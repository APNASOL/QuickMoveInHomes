<?php

namespace App\Http\Controllers;

use App\Models\Incentive; 
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DB;
use Carbon\Carbon;

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
        $incentives = $incentives->paginate(15);
        foreach($incentives as $incentive)
        {
            $incentive->status = ($incentive->status == 1) ? 'ON' : 'OFF';
             

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
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'title' => 'required|string|max:254', 
            'how_much' => 'required|numeric|max:99',
            'descriptions' => 'required|string|max:350', 
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
        $incentive->how_much = $request->how_much;
       
        if ($request->status == true) {
            $incentive->status = 1;
        } else {
            $incentive->status = 0;
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
