<?php

namespace App\Http\Controllers;

use App\Models\Neighborhood;
use App\Models\Upload;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class NeighborhoodController extends Controller
{
    public function index()
    {
         
        $name = 'index';
        return view('app', compact('name'));
    }

    public function neighborhoods(Request $request)
    {
        $neighborhoods = DB::table('neighborhoods');
        if ($request->name !== null && $request->name !== "null") {
            $neighborhoods->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $neighborhoods = $neighborhoods->paginate(15);
        foreach($neighborhoods as $neighborhood)
        {
            if($neighborhood->image)
            {
                $upload  = Upload::where('id',$neighborhood->image)->first();
                if($upload){ 
                    $neighborhood->image = get_storage_url($upload->file_name);
                }
            }
        }
        return $neighborhoods;
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'location' => 'required|string',
            'amenity' => 'required|string', 
            'map_location' => 'required|string',
            'nearby_properties' => 'required|string',
            'image' => 'nullable|string',
        ]);

        if ($request->id) {
            $neighborhood = Neighborhood::where('id', $request->id)->first();
        } else {
            $neighborhood = new Neighborhood();
            $neighborhood->id = Str::orderedUuid();
        }
        $neighborhood->name = $request->name;
        $neighborhood->description = $request->description;
        $neighborhood->location = $request->location;
        $neighborhood->amenities = $request->amenity;
        
        $neighborhood->map_location = $request->map_location;
        $neighborhood->nearby_properties = $request->nearby_properties;
        

        if ($request->image) {
            $existingInUploads = Upload::where('id', $neighborhood->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/neighborhoodImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $upload = new Upload;
            $upload->file_original_name = $image_name_with_path;
            $upload->extension = 'png';
            $upload->type = 'image/png';
            $upload->file_name = $image_name_with_path;
            $upload->save();

            $neighborhood->image = $upload->id;
        }

        $neighborhood->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function get($id)
    {
        $neighborhood = Neighborhood::findOrFail($id);
        if($neighborhood->image)
        {
            $upload  = Upload::where('id',$neighborhood->image)->first();
            if($upload){ 
                $neighborhood->image = get_storage_url($upload->file_name);
            }
        }
         
        return $neighborhood;
    }

    public function delete($id)
    {
        $neighborhood = Neighborhood::findOrFail($id);

        $upload = Upload::where('id', $neighborhood->image)->first();
        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        $neighborhood->delete();

        return 'success';
    }

    public function neighborhoods_pluck()
    
    {
        return Neighborhood::pluck('name', 'id');
    }
}
