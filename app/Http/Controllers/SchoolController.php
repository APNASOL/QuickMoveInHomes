<?php

namespace App\Http\Controllers;

use App\Models\School;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SchoolController extends Controller
{
    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function schools(Request $request)
    {
        $schools = DB::table('schools');
        if ($request->name !== null && $request->name !== "null") {
            $schools->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $schools = $schools->paginate(15);

        return $schools;
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
            'type' => 'required|string|max:255',
            'directions_and_details' => 'required|string',
        ]);

        if ($request->id) {
            $school = School::where('id', $request->id)->first();
        } else {
            $school = new School();
            $school->id = Str::orderedUuid();
        }
        $school->name = $request->name;
        $school->type = $request->type;
        $school->directions_and_details = $request->directions_and_details;

        $school->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function get($id)
    {
        $school = School::findOrFail($id);

        return $school;
    }

    public function delete($id)
    {
        $school = School::findOrFail($id);

        $school->delete();

        return 'success';
    }

    public function schools_pluck()
    {
        return School::pluck('name', 'id');
    }
}
