<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Upload;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class EventController extends Controller
{
    public function index()
    {
        $name = 'custom page';
        return view('app', compact('name'));
    }

    public function create()
    {
        $name = 'create events';
        return view('app', compact('name'));
    }

    public function edit($id)
    {

        return view('app', compact('id'));
    }

    public function events()
    {
        $events = Event::orderBy('date', 'desc')->get();
        foreach($events as $event)
        {

            // Format image image URL
            if ($event && $event->image) {
                $uploaded_image = Upload::where('id', $event->image)->first();
                if ($uploaded_image) {
                    $event->image = get_storage_url($uploaded_image->file_name);
                }
            }
            
            // Format created_at and updated_at dates
            $event->created_at = Carbon::parse($event->created_at)->format('d-m-Y');
            $event->updated_at = Carbon::parse($event->updated_at)->format('d-m-Y');
        }
        return $events;
    }
   

    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|string|max:250',
            'date' => 'required',

            'registeration_link' => 'required',
            'image' => 'nullable',

            'description' => ['required', function ($attribute, $value, $fail) {

                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty.");
                }
            }],

        ]);

        if ($request->id) {
            $event = Event::where('id', $request->id)->first();
        } else {

            $event = new Event;
            $event->id = Str::orderedUuid();
        }

        $event->title = $request->title;
        $event->date = Carbon::parse($request->date);
        $event->description = $request->description;
        $event->registeration_link = $request->registeration_link;

        if ($request->image) {

            if ($event->image) {
                $existing_uploaded = Upload::where('id', $event->image)->first();
                if ($existing_uploaded) {
                    Storage::delete($existing_uploaded->file_name);
                    $existing_uploaded->delete();
                }
            }
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'EventImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $event->image = $Upload->id;
        }

        $event->save();

        return 'success';
    }

    public function delete($id)
    {
        $event = Event::findOrFail($id);

        if ($event->image) {
            $existing_uploaded = Upload::where('id', $event->image)->first();
            if ($existing_uploaded) {
                Storage::delete($existing_uploaded->file_name);
                $existing_uploaded->delete();
            }
        }
        $event->delete();

        return 'success';
    }

    public function get($id)
    {
        $event = Event::findOrFail($id);
        
        if ($event->image) {
            $uploaded_image = Upload::where('id', $event->image)->first();
            if ($uploaded_image) {
                $event->image = get_storage_url($uploaded_image->file_name);
            }
        } else {
            $event->image = get_storage_url('');
        }

        return $event;
    }

}
