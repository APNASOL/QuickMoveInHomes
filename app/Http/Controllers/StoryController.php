<?php

namespace App\Http\Controllers;

use App\Models\Story;
use App\Models\Tour;
use App\Models\Upload;
use App\Models\User;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;

class StoryController extends Controller
{

    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required',
            'location' => 'required|string|max:255',
            'title' => 'required',
            'description' => 'required|string',
            'rating' => 'required',
            'tour_id' => 'nullable',
        ]);

        if ($request->story_id) {
            $Story = Story::where('id', $request->story_id)->first();
        } else {
            $Story = new Story;
            $Story->id = Str::orderedUuid();
        }

        $Story->location = $request->location;
        $Story->title = $request->title;
        $Story->description = $request->description;
        $Story->rating = $request->rating;
        $Story->user_id = auth()->user()->id;
        $Story->tour_id = $request->tour_id;

        if ($request->image) {
            $existingInUploads = Upload::where('id', $Story->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'real_public/stories_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);
            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $Story->image = $Upload->id;
        }

        $Story->save();
        return 'success';

    }

    public function create()
    {
        return view('app');
    }

    public function stories()
    {
        $name = 'stories';
        return view('app', compact('name'));
    }

    public function fetch_stories(Request $request)
    {
        $logedIbn_user = auth()->user();
        if ($logedIbn_user->role == 'admin') {
            $stories = DB::table('stories');
            if ($request->name !== null && $request->name !== "null") {
                $stories->where(function ($query) use ($request) {
                    $query->where('name', 'LIKE', '%' . $request->name . '%');
                });
            }
        } else if ($logedIbn_user->role == 'user') {
            $stories = DB::table('stories')->where('user_id', $logedIbn_user->id);
            if ($request->name !== null && $request->name !== "null") {
                $stories->where(function ($query) use ($request) {
                    $query->where('name', 'LIKE', '%' . $request->name . '%');
                });
            }
        }

        $stories = $stories->orderBy('order_id')->paginate(15);

        foreach ($stories as $story) {
            $uploaded_image = Upload::where('id', $story->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $story->image = get_storage_url($uploaded_image->file_name);
            }
        }

        foreach ($stories as $key => $story) {
            if ($story && $story->image) {
                $uploaded_image = Upload::where('id', $story->image)->first();
                if ($uploaded_image) {
                    $story->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $stories;
    }
    public function story_delete($id)
    {
        $story = Story::findOrFail($id);
        $uploaded_image = Upload::where('id', $story->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            Storage::delete($uploaded_image->file_name);
            $uploaded_image->delete();
        }
        $story->delete();
        return 'success';
    }
    public function edit_story($id)
    {
        return view('app', compact('id'));
    }
    public function get_story($id)
    {
        $story = Story::findOrFail($id);
        $uploaded_image = Upload::where('id', $story->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {

            $story->image = get_storage_url($uploaded_image->file_name);

        }
        return $story;
    }
    public function contact_page_stories_fetch()
    {
        $stories = Story::orderBy('order_id')->get();
        foreach ($stories as $story) {
            $uploaded_image = Upload::where('id', $story->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $story->image = get_storage_url($uploaded_image->file_name);
            }
        }

        return $stories;
    }

    public function story_position_change(Request $newPositions)
    {
        $newPositions = json_decode($newPositions[0]);

        foreach ($newPositions as $newPosition) {
            $story = Story::findOrFail($newPosition->story_id);
            $story->order_id = $newPosition->order_id;

            $story->save();
        }

        return 'success';
    }

    // for external website
    public function external_websit_tour_reviews()
    {
        $stories = Story::where('status',1)->get();
        foreach ($stories as $story) {
            $tour = Tour::where('id', $story->tour_id)->first();
            $story->tour_name = $tour->title;
            $user = User::where('id', $story->user_id)->first();

            if ($user) {
                $story->user_name = $user->name;
            }

            if ($story && $story->image) {
                $uploaded_image = Upload::where('id', $story->image)->first();

                if ($uploaded_image) {
                    $story->image = get_storage_url($uploaded_image->file_name);
                }

            }

        }

        return $stories;
    }
    public function see_review_on_tour($tour_id)
    {

        return view('app', compact('tour_id'));
    }
    public function review_on_tour_fetch($tour_id)
    {
        $tour = Tour::where('id', $tour_id)->first();
        $story = Story::where('tour_id', $tour_id)->first();
        if ($story) {

            $tour = Tour::where('id', $story->tour_id)->first();
            $story->tour_name = $tour->title;
            $user = User::where('id', $story->user_id)->first();

            if ($user) {
                $story->user_name = $user->name;
            }

            if ($story && $story->image) {
                $uploaded_image = Upload::where('id', $story->image)->first();

                if ($uploaded_image) {
                    $story->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return ['story' => $story, 'tour' => $tour];
    }

    // for super admin
    public function all_reviews()
    {

        return view('app');
    }
    public function all_reviews_fetch()
    {
        $stories = Story::get();

        foreach ($stories as $story) {
            if ($story) {
                $story->status = ($story->status == 1) ? true : false;
                $tour = Tour::where('id', $story->tour_id)->first();
                $story->tour_name = $tour->title;

                $user = User::where('id', $story->user_id)->first();

                if ($user) {
                    $story->user_name = $user->name;
                }

                if ($story && $story->image) {
                    $uploaded_image = Upload::where('id', $story->image)->first();

                    if ($uploaded_image) {
                        $story->image = get_storage_url($uploaded_image->file_name);
                    }
                }
            }
        }
        return $stories;

    }

    public function review_delete($review_id)
    {
        $review = Story::where('id', $review_id)->first();
        $existingInUploads = Upload::where('id', $review->image)->first();
        if ($existingInUploads) {
            Storage::delete($existingInUploads->file_name);
            $existingInUploads->delete();
        }
        $review->delete();
        return 'success';
    }
    public function review_status_change(Request $request)
    {
         
        $review = Story::where('id', $request->review_id)->first();
        if($request->status === true  || $request->status === 'true')
        {
            $review->status = 1;
        }else
        {
            $review->status = 0;

        }  
        $review->save();
        return 'success';
    }
}
