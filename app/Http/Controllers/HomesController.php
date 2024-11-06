<?php

namespace App\Http\Controllers;

use App\Models\Home;
use App\Models\Community;
use Illuminate\Http\Request;
use App\Models\Upload; 
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use DB;

class HomesController extends Controller
{

    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }


    public function fetchHomes(Request $request)
    {
        $homes = DB::table('homes');
        if ($request->name !== null && $request->name !== "null") {
            $homes->where(function ($query) use ($request) {
                $query->where('title', 'LIKE', '%' . $request->name . '%');
            });
        }

        $homes = $homes->paginate(15);
        foreach ($homes as $home) {
            $uploaded_image = Upload::where('id', $home->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $home->image = get_storage_url($uploaded_image->file_name);
            }
        }

        return $homes;
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
            'description' => 'required|string',
            'price' => 'required|numeric',
            'address' => 'required|string|max:255',
            'community_id' => 'required', // Ensure community_id exists in homes table
            'status' => 'required|boolean', // Assuming status is boolean (true/false)
        ]);

        if ($request->home_id) {
            $home = Home::where('id', $request->home_id)->first();
            
        } else {
            $home = new Home();
            $home->id = Str::orderedUuid();

        }  
        // Assign values from the request to the Home model
        $home->title = $request->title;
        $home->description = $request->description;
        $home->price = $request->price;
        $home->address = $request->address;
        $home->community_id = $request->community_id;
        $home->status = ($request->status == true) ? 1 : 0;

        // Handle image upload if provided
        if ($request->has('image')) {
            $imageData = $request->image;
            $imageData = substr($imageData, strpos($imageData, ',') + 1); // Remove data URL scheme
            $imageData = base64_decode($imageData);

            $imagePath = 'real_public/homeImages/' . Str::random(40) . '.png'; // Adjust path as needed
            Storage::put($imagePath, $imageData);

            // Save upload record
            $upload = new Upload();
            $upload->file_original_name = $imagePath;
            $upload->extension = 'png'; // Adjust extension based on actual image type
            $upload->type = 'image/png'; // Adjust type based on actual image type
            $upload->file_name = $imagePath;
            $upload->save();

            // Assign uploaded image ID to home model
            $home->image = $upload->id; // Assuming you have an 'image' column in your Home table for storing upload ID
        }

        // Save the Home model
        $home->save();

        return 'success';
    }

    public function edit($id)
    { 
        return view('app', compact('id'));
    }

    public function getHome($id)
    {

        $home = Home::findOrFail($id);
        if ($home && $home->image) {
            $uploaded_image = Upload::where('id', $home->image)->first();

            if ($uploaded_image) {
                $home->image = get_storage_url($uploaded_image->file_name);
            }
        }
        $community = Community::where('id',$home->community_id)->first();
        // dd($community);
        $home->community = $community->name ?? "";
        $home->status = ($home->status == 1) ? 'ON' : 'OFF';

        return $home;
    }

    public function delete($id)
    {
        $home = Home::findOrFail($id);
        $upload = Upload::where('id', $home->image)->first();
        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        $home->delete();

        return 'success';
    }

    public function details($id)
    {  
        return view('app', compact('id'));
    }
    public function homes_pluck() { 
        return Home::pluck('title','id');
    }
    public function fetch_customer_visits() { 
        
    }

}
