<?php

namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\CustomerAgentConnection;
use App\Models\Property;
use App\Models\Setting;
use App\Models\User;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class AgentController extends Controller
{
    public function index()
    {
        return view('app');
    }

    public function fetchAgents()
    {
        $agents = Agent::all();  
        foreach ($agents as $agent) {
            $agreements = CustomerAgentConnection::where('agent_id', $agent->id)->get();

            foreach ($agreements as $agreement) {
                $property_record = Property::where('property_id', $agreement->property_id)->first();
                $agreement->home_title = $property_record ? $property_record->title : "N/A";
                $agreement->home_id = $property_record ? $property_record->property_id : "N/A";

                $customer_record = User::where('id', $agreement->customer_id)->first();
                $agreement->customer_name = $customer_record ? $customer_record->name : "N/A";

            }

            $agent->customer_agreements = $agreements;
        } 

        return $agents;
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'agent_name' => 'required|string|max:255',
            'agency_name' => 'required|string|max:255',
            'license_number' => 'required|string|max:255',
            'specialties' => 'required|string',
            'biography' => 'required|string',
            'experience' => 'required|string',
            'languages' => 'required|string|max:255',
            'contact' => 'required|string|max:255',
            'email' => 'required|unique:users',
        ]);

        if ($request->agent_id) {
            $agent = Agent::where('id', $request->agent_id)->first();
        } else {
            $randomPassword = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 0, 8);

            $agent = new Agent();
            $agent->id = Str::orderedUuid();
            $User = new User;
            $User->name = $request->agent_name;
            $User->email = $request->email;
            $User->email_verified_at = Carbon::now();
            $User->role = "agent";
            $User->password = Hash::make($randomPassword);

            $welcome_email = Setting::where('type', 'welcome_email')->first();
            if ($welcome_email) {
                $decoded_welcome_email = json_decode($welcome_email->value) ?? "";
                $dynamic_subject = $decoded_welcome_email[0]->subject ?? "";
                $dynamic_email_descriptions = $decoded_welcome_email[0]->description ?? "";
            } else {
                $dynamic_subject = "";
                $dynamic_email_descriptions = "";
            }

            // Sending, dynamic email from the admin panel, genereated.
            $dynamic_subject_var = ['${SUBJECT}'];
            $dynamic_subject_array = [$dynamic_subject];
            $adjusted_subject = str_replace($dynamic_subject_var, $dynamic_subject_array, $dynamic_subject);
            $dynamic_email_descriptions_var = ['[email]', '[password]'];
            $dynamic_email_descriptions_array = [$request->email, $randomPassword];
            $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_var, $dynamic_email_descriptions_array, $dynamic_email_descriptions);

            $dataforEmail = [
                'account_create' => 'account_create',
                'dynamic_email_descriptions' => $adjusted_email_descriptions,
            ];

            $user_email = $request->email;
            $mail_subject = $dynamic_subject;
            Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
                $message->to($user_email)->subject($mail_subject);
            });
        }

        // Assign values from the request to the Agent model
        $agent->name = $request->agent_name;
        $agent->email = $request->email;
        $agent->agency_name = $request->agency_name;
        $agent->license_number = $request->license_number;
        $agent->specialties = $request->specialties;
        $agent->biography = $request->biography;
        $agent->experience = $request->experience;
        $agent->languages = $request->languages;
        $agent->contact = $request->contact;

        $User->save();
        // Save the Agent model
        $agent->user_id = $User->id;
        $agent->save();

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function getAgent($id)
    {
        $agent = Agent::findOrFail($id);
        $agent->status = ($agent->status == 1) ? 'true' : 'false';

        return $agent;
    }

    public function delete($id)
    {
        $agent = Agent::findOrFail($id);
        $agent->delete();

        return 'success';
    }

    public function agents_pluck()
    {
        return Agent::pluck('agency_name', 'id');
    }
}
