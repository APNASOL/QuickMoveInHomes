<?php

namespace App\Http\Controllers;

use App\Models\LasVegasRegion;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LasVegasRegionController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function regions(Request $request)
    {
        $regions = DB::table('las_vegas_regions');
        if ($request->name !== null && $request->name !== "null") {
            $regions->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $regions = $regions->paginate(15);

        return $regions;
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
            'description' => 'nullable|string',
            'boundaries' => 'nullable|string',
        ]);

        if ($request->id) {
            $region = LasVegasRegion::where('id', $request->id)->first();
        } else {
            $region = new LasVegasRegion();
            $region->id = Str::orderedUuid();
        }
        $region->name = $request->name;
        $region->description = $request->description;
        $region->boundaries = $request->boundaries;

        $region->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function get($id)
    {
        $region = LasVegasRegion::findOrFail($id);

        return $region;
    }

    public function delete($id)
    {
        $region = LasVegasRegion::findOrFail($id);

        $region->delete();

        return 'success';
    }

    public function regions_pluck()
    {
        return LasVegasRegion::pluck('name', 'id');
    }
}
