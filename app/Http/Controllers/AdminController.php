<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\Community;
use App\Models\CustomerAgentConnection;
  
use App\Models\Property;
use App\Models\Upload;
  
use App\Models\User;
use Auth;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function dashboard_data_count()
    {
        $peroperties_count = Property::count();
        $communities_count = Community::count();
        $agents_count = Agent::count();
      
       
        return ['peroperties_count' => $peroperties_count, 'communities_count' => $communities_count, 'agents_count' => $agents_count];
    }
    public function login(Request $request)
    {

        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = User::where('email', $request->email)->whereNotNull('email_verified_at')->first();
            if ($user) {
                $auth_token = $user->createToken('webToken')->plainTextToken;
                session()->put('auth_token', $auth_token);
                return 'success';
            } else {
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return 'not-verified';
            }
        }
        return response()->json([
            'errors' => [
                'email' => ['The provided credentials do not match our records.'],
            ],
            'message' => "The given data was invalid.",
        ], 422);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return 'success';
    }

    public function dashboard()
    {

        return view('app');
    }

    public function dashboard_agent_history()
    {
        $user_id = auth()->user()->id;
        $agent = Agent::where('user_id', $user_id)->first();
        if ($agent) {

            $records = CustomerAgentConnection::where('agent_id', $agent->id)->get();
            foreach ($records as $record) {
                $user = User::where('id', $record->customer_id)->first();if($user)
                {
                    $uploaded_image = Upload::where('id', $user->image)->first();
                    if ($uploaded_image && $uploaded_image->file_name) {
                        $user->image = get_storage_url($uploaded_image->file_name);
                    }
                }
                $record->user = $user;
                $property = Property::where('property_id', $record->property_id)->first();
                $record->property = $property;
            }

            return $records;
        }
    }
    public function dashboard_customer_history()
    {
        $user_id = auth()->user()->id;
  
        // dd($user_id);
        $records = CustomerAgentConnection::where('customer_id', $user_id)->get();
      
        foreach ($records as $record) {
            $agent = Agent::where('id', $record->agent_id)->first();

            $user = User::where('id', $agent->user_id)->first();
            if($user)
            {
                $uploaded_image = Upload::where('id', $user->image)->first();
                if ($uploaded_image && $uploaded_image->file_name) {
                    $user->image = get_storage_url($uploaded_image->file_name);
                }
            }
            $record->user = $user;
            $property = Property::where('property_id', $record->property_id)->first();
            $record->property = $property;
        }
    
        return $records;
    }
    public function deal_status_change(Request $request)
    { 
        $record = CustomerAgentConnection::where('id', $request->id)->first();
        $record->current_status = $request->status;
        $record->save();
        return 'success';
    }
}
