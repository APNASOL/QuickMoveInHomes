<?php

namespace App\Http\Controllers;

use App\Models\Builder;
use App\Models\BuildersCommunity;
use App\Models\Community;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class BuilderController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function builders(Request $request)
    {
        $builders = DB::table('builders');
        if ($request->name !== null && $request->name !== "null") {
            $builders->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $builders = $builders->paginate(15);
        foreach($builders as $builder)
        {  
            $communities_ids = BuildersCommunity::where('builder_id', $builder->id)->pluck('community_id');
            
            if ($communities_ids) { 
        
                $communities = Community::whereIn('id', $communities_ids)->pluck('name');
              
                $builder->communities = $communities;
            }
             

        }

        return $builders;
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
            'description' => 'required|string'
        ]);

        if ($request->id) {
            $builder = Builder::where('id', $request->id)->first();
        } else {
            $builder = new Builder();
            $builder->id = Str::orderedUuid();
        }
        $builder->name = $request->name;
        $builder->description = $request->description;
 
        if ($request->communities) {
            BuildersCommunity::where('builder_id', $request->id)->delete();

            $communities_ids = $request->communities;
            foreach ($communities_ids as $community_id) {
                
                $buildersCommunity = new BuildersCommunity;
                $buildersCommunity->id = Str::orderedUuid();
         
                $buildersCommunity->community_id = $community_id;
                $buildersCommunity->builder_id = $builder->id;
                $buildersCommunity->save();
            }

        }

        

        $builder->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function get($id)
    {
        $builder = Builder::findOrFail($id);
        if($builder)
        {
            $builder->communities = BuildersCommunity::where('builder_id', $id)->pluck('community_id');
        }
        return $builder;
    }

    public function delete($id)
    {
        $builder = Builder::findOrFail($id);
        BuildersCommunity::where('builder_id', $id)->delete();
        $builder->delete();

        return 'success';
    }

    public function builders_pluck()
    {
        return Builder::pluck('name', 'id');
    }
}
