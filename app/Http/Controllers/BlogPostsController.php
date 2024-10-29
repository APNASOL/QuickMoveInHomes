<?php

namespace App\Http\Controllers;

use App\Models\BlogPost;
use App\Models\Upload;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class BlogPostsController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function fetchBlogPosts(Request $request)
    {
        $query = BlogPost::query();

        if ($request->has('title') && $request->title !== null && $request->title !== "null") {
            $query->where('title', 'LIKE', '%' . $request->title . '%');
        }

        $blogPosts = $query->paginate(15);

        // Loop through blog posts to format or modify if needed
        foreach ($blogPosts as $post) {
            $post->status = ($post->status == 1) ? 'ON' : 'OFF';
            $user = User::where('id', $post->author_id)->first();
            if ($user) {
                $post->author_name = $user->name;
            }

            $uploaded_image = Upload::where('id', $post->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $post->image = get_storage_url($uploaded_image->file_name);
            }

        }

        return $blogPosts;
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'required',
        ]);

        if ($request->blog_post_id) {
            $blogPost = BlogPost::findOrFail($request->blog_post_id);
        } else {
            $blogPost = new BlogPost();
            $blogPost->id = Str::orderedUuid();
        }

        // Assign values from the request to the BlogPost model
        $blogPost->title = $request->title;
        $blogPost->content = $request->content;
        $blogPost->author_id = auth()->user()->id;
        $blogPost->status = ($request->status == true) ? 1 : 0;

        // Handle image upload if provided

        if ($request->image) {
            $existingInUploads = Upload::where('id', $blogPost->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/Blog_posts/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $blogPost->image = $Upload->id;
        }

        // Save the BlogPost model
        $blogPost->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function getBlogPost($id)
    {
        $blogPost = BlogPost::findOrFail($id);
        if ($blogPost && $blogPost->image) {
            $uploaded_image = Upload::where('id', $blogPost->image)->first();

            if ($uploaded_image) {
                $blogPost->image = get_storage_url($uploaded_image->file_name);
            }
        }
        $blogPost->status = ($blogPost->status == 1) ? 'true' : 'false';

        // You can modify the response as needed
        return $blogPost;
    }

    public function delete($id)
    {
        $blogPost = BlogPost::findOrFail($id);
        $upload = Upload::where('id', $blogPost->image)->first();
        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        $blogPost->delete();

        return 'success';
    }

    // front end
    public function overall_blogs()
    {
        $blogPosts = BlogPost::where('status', 1)->get();

        // Loop through blog posts to format or modify if needed
        foreach ($blogPosts as $post) {
            $post->status = ($post->status == 1) ? 'ON' : 'OFF';
            $user = User::where('id', $post->author_id)->first();
            if ($user) {
                $post->author_name = $user->name;
            }

            $uploaded_image = Upload::where('id', $post->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $post->image = get_storage_url($uploaded_image->file_name);
            }

        }

        return $blogPosts;
    }
    public function blog_details($id)
    { 
        return view('app', compact('id'));
    }
    public function blog_details_get($id)
    {
        $blogPost = BlogPost::where('id', $id)->first();
          
        $uploaded_image = Upload::where('id', $blogPost->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            $blogPost->image = get_storage_url($uploaded_image->file_name);
        }

        return $blogPost;
    }
}
