<?php

namespace App\Http\Controllers;

use App\Models\Office;
use App\Models\Upload;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;

class OfficeController extends Controller
{

    public function store(Request $request)
    { 
        $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required',
            'phone' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'image' => 'nullable',
        ]);

        if ($request->office_id) {
            $Office = Office::where('id', $request->office_id)->first();
        } else {
            $Office = new Office;
            $Office->id = Str::orderedUuid();

        }

        $Office->name = $request->name;
        $Office->address = $request->address;
        $Office->phone = $request->phone;
        $Office->email = $request->email;

        if ($request->image) {
            $existingInUploads = Upload::where('id', $Office->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'real_public/offices_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);
            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $Office->image = $Upload->id;
        }

        $Office->save();
        return 'success';

    }

    public function create()
    {
        return view('app');
    }

    public function offices()
    {
        $name = 'offices';
        return view('app', compact('name'));
    }

    public function fetch_offices(Request $request)
    {
        $offices = DB::table('offices');
        if ($request->name !== null && $request->name !== "null") {
            $offices->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }

        $offices = $offices->orderBy('order_id')->paginate(15);
        foreach ($offices as $office) {
            $uploaded_image = Upload::where('id', $office->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $office->image = get_storage_url($uploaded_image->file_name);
            }
        }

        foreach ($offices as $key => $office) {
            if ($office && $office->image) {
                $uploaded_image = Upload::where('id', $office->image)->first();
                if ($uploaded_image) {
                    $office->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $offices;
    }
    public function office_delete($id)
    {
        $office = Office::findOrFail($id);
        $uploaded_image = Upload::where('id', $office->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            Storage::delete($uploaded_image->file_name);
            $uploaded_image->delete();
        }
        $office->delete();
        return 'success';
    }
    public function edit_office($id)
    { 
        return view('app', compact('id'));
    }
    public function get_office($id)
    { 
        $office = Office::findOrFail($id);
        $uploaded_image = Upload::where('id', $office->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {

            $office->image = get_storage_url($uploaded_image->file_name);

        }
        return $office;
    }
    public function contact_page_offices_fetch()
    {
        $offices = Office::orderBy('order_id')->get();
        foreach ($offices as $office) {
            $uploaded_image = Upload::where('id', $office->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $office->image = get_storage_url($uploaded_image->file_name);
            }
        }
        
        return $offices;
    }

    public function office_position_change(Request $newPositions)
    {
        $newPositions = json_decode($newPositions[0]);
        
        foreach ($newPositions as $newPosition) {
            $office = Office::findOrFail($newPosition->office_id);
            $office->order_id = $newPosition->order_id;
             
            $office->save();
        }

        return 'success';
    }

}
