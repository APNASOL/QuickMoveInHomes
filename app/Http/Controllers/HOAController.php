<?php

namespace App\Http\Controllers;

use App\Models\HOA;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class HOAController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }
    public function hoas(Request $request)
    {
        $hoas = DB::table('hoa');
        if ($request->name !== null && $request->name !== "null") {
            $hoas->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $hoas = $hoas->paginate(15);
        foreach($hoas as $hoa)
        {
            $hoa->master_plan = ($hoa->master_plan == 1) ? 'ON' : 'OFF';
            $hoa->sub_association = ($hoa->sub_association == 1) ? 'ON' : 'OFF';
        }

        return $hoas;
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
            'fee' => 'required|numeric',
            'frequency' => 'required|string|max:255',
            'master_plan' => 'required|boolean',
            'sub_association' => 'required|boolean',
        ]);
        
        if ($request->id) {
            $hoa = HOA::where('id', $request->id)->first();
            
        } else {
            $hoa = new HOA();
            $hoa->id = Str::orderedUuid();
            
        }
        $hoa->name = $request->name;
        $hoa->fee = $request->fee;
        $hoa->frequency = $request->frequency;
        
        $hoa->master_plan = ($request->master_plan == true) ? 1 : 0;
        $hoa->sub_association = ($request->sub_association == true) ? 1 : 0;
        
        

        $hoa->save();

        return 'success';
    }
    public function edit($id)
    {
        return view('app', compact('id'));
    }
    public function get($id)
    {

        $hoa = HOA::findOrFail($id);
        
        $hoa->master_plan = ($hoa->master_plan == 1) ? true : false;
        $hoa->sub_association = ($hoa->sub_association == 1) ? true : false;
        
        return $hoa;
    }

    public function delete($id)
    {
        $hoa = HOA::findOrFail($id);

        $hoa->delete();

        return 'success';
    }

    public function hoas_pluck()
    {
        return HOA::pluck('name', 'id');
    }
     
}
