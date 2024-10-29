<?php

namespace App\Http\Controllers;

use App\Models\Amenity;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AmenityController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function amenities(Request $request)
    {
        $amenities = DB::table('amenities');
        if ($request->name !== null && $request->name !== "null") {
            $amenities->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $amenities = $amenities->paginate(15);

        return $amenities;
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
        ]);
 
        if ($request->id) {
            $amenity = Amenity::where('id', $request->id)->first();
        } else {
            $amenity = new Amenity();
            $amenity->id = Str::orderedUuid();
        }
        $amenity->name = $request->name;
        $amenity->description = $request->description;

        $amenity->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function get($id)
    {
        $amenity = Amenity::findOrFail($id);

        return $amenity;
    }

    public function delete($id)
    {
        $amenity = Amenity::findOrFail($id);

        $amenity->delete();

        return 'success';
    }

    public function amenities_pluck()
    {
        return Amenity::pluck('name', 'id');
    }
}
