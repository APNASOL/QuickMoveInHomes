<?php

namespace App\Http\Controllers;

use App\Models\OurPromise;
use App\Models\Upload;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class OurPromisesController extends Controller
{
    public function index()
    {
        $name = 'promises';
        return view('app', compact('name'));
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }

    public function edit($id)
    {
        $name = 'promises';
        return view('app', compact('id'));
    }

    public function fetch_our_promises(Request $request)
    { 
        $our_promises = DB::table('our_promises');
        if ($request->title && $request->title != "null" && $request->title != "undefined") {
            $our_promises->where(
                'title',
                'LIKE',
                '%' . $request->title . '%',
            );
        }
        $our_promises = $our_promises->paginate(15);
        foreach ($our_promises as $our_promise) {

            if ($our_promise && $our_promise->icon) {
                $uploaded_icon = Upload::where('id', $our_promise->icon)->first();
                if ($uploaded_icon) {
                    $our_promise->icon = get_storage_url($uploaded_icon->file_name);
                }
            } else {
                $our_promise->icon = "";
            }
        }

        return $our_promises;
    } 
    public function our_promise_store(Request $request)
    {
     
        $request->validate([ 
            'icon' => $request->id ? 'nullable' : 'required',
            'title' => 'required|string|max:255',
            'description' => 'required|string|max:250',
        ]);
        if ($request->id) { 
            $our_sermissions = OurPromise::findOrFail($request->id);
        } else {

            $our_sermissions = new OurPromise;
            $our_sermissions->id = Str::orderedUuid();
        }
        $our_sermissions->title = $request->title;
        $our_sermissions->description = $request->description;
        if ($request->icon) {

            $data = substr($request->icon, strpos($request->icon, ',') + 1);
            $data = base64_decode($data);
            $icon_name_with_path = 'ServicesIcons/' . Str::random(40) . '.png';
            Storage::put($icon_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $icon_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'icon/png';
            $Upload->file_name = $icon_name_with_path;
            $Upload->save();

            $our_sermissions->icon = $Upload->id;

        }

        $our_sermissions->save();

        return 'success';
    }

    public function services_show($id)
    {
        $our_sermissions = OurPromise::findOrFail($id);
        if ($our_sermissions && $our_sermissions->icon) {
            $uploaded_icon = Upload::where('id', $our_sermissions->icon)->first();
            if ($uploaded_icon) {
                $our_sermissions->icon = get_storage_url($uploaded_icon->file_name);
            }
        } else {
            $our_sermissions->icon = null;
        }
        return $our_sermissions;
    }
 
    public function our_promise_delete($id)
    {
        $our_sermissions = OurPromise::findOrFail($id);
        if ($our_sermissions && $our_sermissions->icon) {
            $existing_uploaded = Upload::where('id', $our_sermissions->icon)->first();
            if ($existing_uploaded) {
                Storage::delete($existing_uploaded->file_name);
                $existing_uploaded->delete();
            }
        }
        $our_sermissions->delete();

        return 'success';
    }
    // fetching data for external website ... 
    public function get_promises()
    {
        $our_promises = OurPromise::all();
        foreach ($our_promises as $our_promise) {

            if ($our_promise && $our_promise->icon) {
                $uploaded_icon = Upload::where('id', $our_promise->icon)->first();
                if ($uploaded_icon) {
                    $our_promise->icon = get_storage_url($uploaded_icon->file_name);
                }
            } else {
                $our_promise->icon = "";
            }
        }
        return $our_promises;
    }
}
