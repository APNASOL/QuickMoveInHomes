<?php

namespace App\Http\Controllers;
 
use App\Models\CallMeNow; 
use Illuminate\Http\Request;
 
use Illuminate\Support\Str;
use Auth;

class CallMeNowController extends Controller
{

    public function call_me_now(Request $request)
    {
        $request->validate([
            'contact_number' => 'required',
            'agreement' => 'required',
        ]);

        $call_now = new CallMeNow;
        $call_now->id = Str::orderedUuid();
        $call_now->contact_number = $request->contact_number;
        $call_now->agreement = $request->agreement;
        $call_now->save();
        return 'success'; 
    }
    public function index()
    { 
        $name = 'call-now';
        return view('app', compact('name'));
    }
    public function call_me_now_records_fetch()
    { 
        $calls_now =  CallMeNow::all(); 
        foreach($calls_now as $call_now)
        {
            if($call_now->agreement == 1)
            {
                $call_now->agreement = 'Agreed';
            }else
            {
                $call_now->agreement = 'Not-Agreed';
            }
          

        }
        return $calls_now; 
    }
    public function call_me_now_record_delete($id)
    { 
        $call_now =  CallMeNow::where('id',$id)->first(); 
        $call_now->delete();
        return 'success';
    }



}