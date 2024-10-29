<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\CustomerAgentConnection;
use App\Models\CustomPage;
use App\Models\Office;
use App\Models\Property;
use App\Models\Upload;
use App\Models\Tour;
use App\Models\TourCountry;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function dashboard_data_count()
    {
        $offices_count = Office::count();
        $custom_pages_count = CustomPage::count();
        $tour_count = Tour::count();
        $tour_country_count = TourCountry::count();

        return ['offices' => $offices_count, 'custom_pages' => $custom_pages_count, 'tours' => $tour_count, 'tour_countries' => $tour_country_count];
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
