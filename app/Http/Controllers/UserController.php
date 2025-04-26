<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use App\Models\Setting;
use App\Models\Upload;
use App\Models\User;
use Auth;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Storage;

class UserController extends Controller
{

    public function register(Request $request)
    {
        $randomPassword = "";
        if ($request->process_by == "Admin") {
            $request->validate([
                'user_name' => 'required|string|max:255',
                'phone' => 'required|string|max:255',
                'email' => 'required|unique:users,email,' . $request->user_id,
                'role' => 'required|string|max:255',
            ]);

            if ($request->process_status == "Update" && $request->user_id) {
                $User = User::where('id', $request->user_id)->first();

            } else {
                $User = new User;
                $randomPassword = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 0, 8);
                $User->password = Hash::make($randomPassword);
                $password_in_email = $randomPassword;

            }
        } else {
            $request->validate([
                'user_name' => 'required|string|max:255',
                'phone' => 'required|string|max:255',
                'email' => 'required|unique:users',
                'password' => 'required|required_with:confirm_password|same:confirm_password',
                'confirm_password' => 'required|required_with:password|same:password',
                'role' => 'required|string|max:255',
            ]);
            $User = new User;

        }

        $User->name = $request->user_name;
        $User->phone = $request->phone;
        $User->email = $request->email;
        $User->role = $request->role;

        if ($request->image) {
            $existingInUploads = Upload::where('id', $User->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'real_public/user_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);
            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $User->image = $Upload->id;
            $User->role = $request->role;
        }
        if ($request->password) {

            $User->password = Hash::make($request->password);
            $password_in_email = $request->password;
        }
        $User->save();

        $website_name = Setting::where('type', 'website_name')->first();

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

        $dynamic_email_descriptions_var = ['[email]'];
        $dynamic_email_descriptions_array = [$User->email];
        $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_var, $dynamic_email_descriptions_array, $dynamic_email_descriptions);

        // $url = url('/');
        // $token = Str::random(64);
        // $link = $url . '/verify-email/' . $token . '?email=' . urlencode($request->email);
        $dataforEmail = [
            'account_create' => 'account_create',
            'dynamic_email_descriptions' => $adjusted_email_descriptions,
        ];

        $user_email = $request->email;
        $mail_subject = $dynamic_subject;
        Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
            $message->to($user_email)->subject($mail_subject);
        });

        return 'success';

    }

    public function verify_email(Request $request)
    {
        $verified_user = User::where('email', $request->email)->whereNotNull('email_verified_at')->first();
        if ($verified_user) {
            return redirect('errors/404-page');
        } else {
            $user = User::where('email', $request->email)->first();

            if ($user) {
                $user->email_verified_at = Carbon::now();
                $user->save();

                $message = ("Email Verified Successfully. You can now log in.");
                session()->flash('loginMessage', $message);

                return redirect('/');

            }
        }

    }

    public function forgot_password(Request $request)
    { 
        $request->validate([
            'email' => 'required|email',
        ]);
         
        $email = $request->email;
        
        $user = DB::table('users')->where('email', $request->email)->first();
         
        if($user)
        {
            return 'success';
        }else
        {
            return response()->json([
                'errors' => [
                    'email' => ['The provided email do not match our records.'],
                ],
                'message' => ("The given data was invalid."),
            ], 422);
        }
         

    }

    private function sendResetEmail($email, $token)
    {
        
        //Retrieve the user from the database
        $user_record = DB::table('users')->where('email', $email)->select('name', 'email')->whereNotNull('email_verified_at')->first();
        $reset_password_email = Setting::where('type', 'reset_password_email_section')->first();

        if ($reset_password_email) {
            $decoded_reset_password_email = json_decode($reset_password_email->value) ?? "";
            $dynamic_subject = $decoded_reset_password_email[0]->subject ?? "";
            $dynamic_email_descriptions = $decoded_reset_password_email[0]->description ?? "";

        } else {
            $dynamic_subject = "";
            $dynamic_email_descriptions = "";
        }

        // Sending, dynamic email from the admin panel, genereated.
        $dynamic_subject_var = ['${SUBJECT}'];
        $dynamic_subject_array = [$dynamic_subject];
        $adjusted_subject = str_replace($dynamic_subject_var, $dynamic_subject_array, $dynamic_subject);

        $dynamic_email_descriptions_var = ['[user_name]'];

        $dynamic_email_descriptions_array = [$user_record->name]; 
        $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_var, $dynamic_email_descriptions_array, $dynamic_email_descriptions);

        $url = url('/');
        $link = $url . '/password-reset/' . $token . '?email=' . urlencode($user_record->email);

        $dataforEmail = [
            'link' => $link,
            'reset_email_dynamic_descriptions' => $adjusted_email_descriptions,

        ];

        $user_email = $user_record->email;

        $mail_subject = $dynamic_subject;

        Mail::send('Emails.resetEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {

            $message->to($user_email)->subject($mail_subject);

        });
    }

    // public function resetPasswordVue(Request $request)
    // {
    //     $tokenDataValidate = DB::table('password_resets')->where('token', $request->token)->where('email', $request->email)->first();

    //     $user = User::where('email', $request->email)->first();

    //     if ($tokenDataValidate) {

    //         $user_id = $user->id;
    //         // session()->flash('user_id', $user_id);
    //         return redirect()->route('reset-password', ['user_id' => $user_id]);
    //         // return redirect()->route('reset-password');
    //     } else {

    //         return redirect('errors/404-page');
    //     }
    // }

     
    public function reset_password(Request $request)
    {

        // dd($request->all());
        $request->validate([
            'password' => 'required|required_with:confirm_password|same:confirm_password|min:8',
            'confirm_password' => 'required|required_with:password|same:password',
        ]);
        $user = User::where('email', $request->user_email)->first();
          
        $user->password = Hash::make($request->password);
        // $user->token = $tokenDataValidate->token;
        $user->save();
        return 'success';
        // DB::table('password_resets')->where('email', $user->email)->delete();
        // return Inertia::render('Backend/Login', [
        //     'message' => translate("Password reseted successfully now you can login."),
        // ]);

    }
    // Users

    public function users()
    {
        $name = 'users';
        return view('app', compact('name'));
    }

    public function create()
    {
        return view('app');
    }

    public function fetch_users(Request $request)
    {
        $users = DB::table('users');
        if ($request->name !== null && $request->name !== "null") {
            $users->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }

        $users = $users->paginate(15);
        foreach ($users as $user) {
            $uploaded_image = Upload::where('id', $user->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $user->image = get_storage_url($uploaded_image->file_name);
            }
        }

        foreach ($users as $key => $user) {
            if ($user && $user->image) {
                $uploaded_image = Upload::where('id', $user->image)->first();
                if ($uploaded_image) {
                    $user->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $users;
    }
    public function user_delete($id)
    {
        $user = User::findOrFail($id);
        $uploaded_image = Upload::where('id', $user->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            Storage::delete($uploaded_image->file_name);
            $uploaded_image->delete();
        }
        $user->delete();
        return 'success';
    }
    public function edit_user($id)
    {
        return view('app', compact('id'));
    }
    public function get_user($id)
    {
        $user = User::findOrFail($id);
        $uploaded_image = Upload::where('id', $user->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {

            $user->image = get_storage_url($uploaded_image->file_name);

        }
        return $user;
    }

    // we will remove this function , when project compeletes, its directly email testing
    public function test()
    {
        $randomPassword = "122";
        $welcome_email = Setting::where('type', 'welcome_email')->first();
        if ($welcome_email) {

            $decoded_welcome_email = json_decode($welcome_email->value) ?? "";
            $dynamic_subject = $decoded_welcome_email[0]->subject ?? "";
            $dynamic_email_descriptions = $decoded_welcome_email[0]->description ?? "";
        } else {
            $dynamic_subject = "";
            $dynamic_email_descriptions = "";
        }

        // Replace dynamic placeholders in the email subject and description
        $dynamic_subject_var = ['${SUBJECT}'];
        $dynamic_subject_array = [$dynamic_subject];
        $adjusted_subject = str_replace($dynamic_subject_var, $dynamic_subject_array, $dynamic_subject);

        $dynamic_email_descriptions_var = ['[email]', '[password]'];
        $dynamic_email_descriptions_array = ["abc@gmai.com", $randomPassword];
        $adjusted_email_descriptions = str_replace($dynamic_email_descriptions_var, $dynamic_email_descriptions_array, $dynamic_email_descriptions);

        $url = url('/');
        $token = Str::random(64);
        $link = $url . '/verify-email/' . $token . '?email=' . urlencode("abc@gmai.com");
        $dataforEmail = [
            'verify_email' => $link,
            'dynamic_email_descriptions' => $adjusted_email_descriptions,
        ];

        $user_email = "abc@gmai.com";
        $mail_subject = $dynamic_subject;
        return view('Emails.registerEmail', compact('link', 'dynamic_email_descriptions'));
        Mail::send('Emails.registerEmail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
            $message->to($user_email)->subject($mail_subject);
        });

    }

    public function users_contacted_us()
    {
        return view('app');
    }

    public function fetch_users_contacts(Request $request)
    {

        $contacts = DB::table('contacts');
        if ($request->name !== null && $request->name !== "null") {
            $contacts->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }
        $contacts = $contacts->where('parent_id', null)->paginate(15);

        return $contacts;

    }
    public function contact_details($id)
    {
        return view('app', compact('id'));
    }
    public function get_users_contacts_details($id)
    {
        $contact = Contact::where('id', $id)->first();
        $replies = Contact::where('parent_id', $id)->get();
        return ['contact' => $contact, 'replies' => $replies];

    }

    public function admin_reply_to_user(Request $request)
    {
        $request->validate([
            'subject' => 'required',
            'message' => 'required',
        ]);
        $message = Contact::where('id', $request->message_id)->first();
        if ($message) {

            $user_message = new Contact;
            $user_message->id = Str::orderedUuid();
            $user_message->parent_id = $message->id;
            $user_message->name = $message->name;

            $user_message->email = $message->email;
            $user_message->phone = $message->phone;
            $user_message->subject = $request->subject;
            $user_message->message = $request->message;

            $user_message->save();

            $url = url('/');
            $token = Str::random(64);

            $dataforEmail = [
                'reply_message' => $request->message,
            ];

            $user_email = $message->email;

            $mail_subject = $request->subject;

            Mail::send('Emails.mail', $dataforEmail, function ($message) use ($user_email, $mail_subject) {
                $message->to($user_email)->subject($mail_subject);
            });
        }
        return 'success';
    }

    public function profile_settings()
    {
        if (auth()->check()) {
            $user_id = Auth()->user()->id;
            return view('app', compact('user_id'));

        } else {
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect('/');
        }

    }

    public function update_password(Request $request)
    {

        $request->validate([
            'current_password' => 'required|string|max:255||min:8',
            'new_password' => 'required|required_with:confirm_password|same:confirm_password|min:8',
            'confirm_password' => 'required|required_with:new_password|same:new_password',

        ]);

        $data = $request->all();

        $user = User::find(auth()->user()->id);

        if (!Hash::check($data['current_password'], $user->password)) {

            return response()->json([
                'errors' => [
                    'current_password' => ['The current password is wrong. Please try again with the correct one.'],
                ],
                'message' => "The given data was invalid.",
            ], 422);
        } else {

            //code to update password
            $user->update([
                'password' => Hash::make($request->new_password),
            ]);

            return 'success';

        }
    }

    public function profile_setting_user_record_get()
    {

        $user = User::findOrFail(auth()->user()->id);
        if ($user && $user->image) {
            $uploaded_image = Upload::where('id', $user->image)->first();

            if ($uploaded_image) {
                $user->image = get_storage_url($uploaded_image->file_name);
            }

        }

        return $user;
    }

    public function profile_update(Request $request)
    {
        $request->validate([
            'user_name' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
        ]);

        $User = User::findOrFail(auth()->user()->id);
        $User->name = $request->user_name;
        $User->phone = $request->phone;
        if ($request->profile_image) {

            if ($User->profile_image) {
                Storage::delete($User->profile_image);
            }
            $data = substr($request->profile_image, strpos($request->profile_image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/profile_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $User->image = $Upload->id;

        }
        // if ($request->file('profile_image') == null) {
        //     $User->profile_photo_path = "";
        // } else {
        //     $User->profile_photo_path = $request->file('profile_image')->store('ProfileImages');
        // }
        $User->save();
        // $Doctor  = Doctor::where('user_id',$user->id)->first();
        // if($Doctor)
        // {
        //     $Doctor->name = $request->user_name;
        //     $Doctor->save();
        // }
        // $Patient = Patient::where('user_id',$user->id)->first();
        // if($Patient)
        // {
        //     $Patient->first_name = $request->user_name;
        //     $Patient->save();
        // }

        return 'success';

    }
    public function users_pluck() { 
         
        return User::pluck('name','id');
    }

}
