<?php

namespace App\Http\Controllers;

use App\Models\Incentive; 
use App\Models\Upload; 
use App\Models\Builder; 
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DB;
use Carbon\Carbon;  
use Storage;

class IncentivesController extends Controller
{

    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }
 

    public function fetchIncentives(Request $request)
    {
        $incentives = DB::table('incentives');
    
        if ($request->title !== null && $request->title !== "null") {
            $incentives->where(function ($query) use ($request) {
                $query->where('title', 'LIKE', '%' . $request->title . '%');
            });
        }
    
        $incentives->orderBy('created_at', 'desc');
        $incentives = $incentives->paginate(15);
    
        foreach ($incentives as $incentive) {
            // Format status
            $incentive->status = ($incentive->status == 1) ? 'ON' : 'OFF';
    
            // Fetch and set builder name
            $builder = Builder::where('id', $incentive->builder_id)->first();
            if ($builder) {
                $incentive->builder_name = $builder->name;
            }
    
            // Format incentive_banner image URL
            if ($incentive && $incentive->incentive_banner) {
                $uploaded_image = Upload::where('id', $incentive->incentive_banner)->first();
                if ($uploaded_image) {
                    $incentive->incentive_banner = get_storage_url($uploaded_image->file_name);
                }
            }
    
            // Format created_at and updated_at dates
            $incentive->created_at = Carbon::parse($incentive->created_at)->format('d-m-Y');
            $incentive->updated_at = Carbon::parse($incentive->updated_at)->format('d-m-Y');
        }
    
        return $incentives;
    }
    

    public function create()
    { 
        $name = 'create';
        return view('app', compact('name'));
    }

    public function store(Request $request)
    {
        $request->validate([ 
            'title' => 'required|string|max:254', 
            'builder_id' => 'required', 
            'interest_rate_first_year' => 'required|numeric',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
         
            'descriptions' => ['required', function ($attribute, $value, $fail) {

                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty.");
                }
            }],
        ]);

        if ($request->incentive_id) {
            $incentive = Incentive::where('id', $request->incentive_id)->first();
        } else {
            $incentive = new Incentive();
            $incentive->id = Str::orderedUuid();
        }

        // Assign values from the request to the Incentive model
      
        $incentive->start_date = Carbon::parse($request->start_date)->format('Y-m-d');
        $incentive->end_date = Carbon::parse($request->end_date)->format('Y-m-d');
        $incentive->title = $request->title;
        $incentive->description = $request->descriptions;
        $incentive->interest_rate_first_year = $request->interest_rate_first_year;
        $incentive->builder_id = $request->builder_id;
       
        if ($request->status == true) {
            $incentive->status = 1;
        } else {
            $incentive->status = 0;
        }
        

        if ($request->incentive_banner) {

            $existingInUploads = Upload::where('id', $incentive->incentive_banner)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->incentive_banner, strpos($request->incentive_banner, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/incentive_banners/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'incentive_banner/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $incentive->incentive_banner = $Upload->id;
        }

        // Save the Incentive model
        $incentive->save();

        return 'success';
    }

    public function edit($id)
    { 
        return view('app', compact('id'));
    }

    public function getIncentive($id)
    {
        $incentive = Incentive::findOrFail($id); 
      
        $incentive->status = ($incentive->status == 1) ? 'true' : 'false';

        if ($incentive && $incentive->incentive_banner) {
            $uploaded_image = Upload::where('id', $incentive->incentive_banner)->first();

            if ($uploaded_image) {
                $incentive->incentive_banner = get_storage_url($uploaded_image->file_name);
            }
            
        }

        return $incentive;
    }

    public function delete($id)
    {
        $incentive = Incentive::findOrFail($id);
        $incentive->delete();

        return 'success';
    }

    public function incentives_pluck()
    {
        return Incentive::pluck('title', 'id');
    }
 

}
