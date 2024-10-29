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
        $hoas = DB::table('hoas');
        if ($request->name !== null && $request->name !== "null") {
            $hoas->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $hoas = $hoas->paginate(15);

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
            'name' => 'nullable|string|max:255',
            'fee' => 'nullable|numeric',
            'frequency' => 'nullable|string|max:255',
            'master_plan' => 'nullable|boolean',
            'sub_association' => 'nullable|boolean',
        ]);

        if ($request->example_id) {
            $example = HOA::where('id', $request->example_id)->first();

        } else {
            $example = new HOA();
            $example->id = Str::orderedUuid();

        }
        $example->name = $request->name;
        $example->location = $request->location;

        $example->save();

        return 'success';
    }
    public function edit($id)
    {
        return view('app', compact('id'));
    }
    public function get($id)
    {

        $example = Example::findOrFail($id);
        if ($example && $example->image) {
            $uploaded_image = Upload::where('id', $example->image)->first();

            if ($uploaded_image) {
                $example->image = get_storage_url($uploaded_image->file_name);
            }
        }
        $example->status = ($example->status == 1) ? true : false;

        return $example;
    }

    public function delete($id)
    {
        $example = Example::findOrFail($id);
        $upload = Upload::where('id', $example->image)->first();
        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        $example->delete();

        return 'success';
    }

    public function examples_pluck()
    {
        return Example::pluck('name', 'id');
    }
}
