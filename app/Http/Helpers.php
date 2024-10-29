<?php
use App\Models\CustomerAgentConnection;
use App\Models\Setting;
use App\Models\Translation;
use App\Models\Upload;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

function getTranslations()
{
    $setting = Setting::where('type', 'default_language')->first();
    $default_language = $setting->value ?? "US";

    $user_language = session('default_language') ?? $setting->value ?? "US"; //ES
    $lang_data = Translation::where('lang', $user_language)->pluck('lang_value', 'lang_key');

    return $lang_data;
}
function getExternalWebsiteData()
{
    $external_website = new \stdClass();
    $website_email = Setting::where('type', 'email')->first();
    if($website_email)
    {
        $external_website->website_email = $website_email->value;
    }
    $website_phone = Setting::where('type', 'website_phone')->first();
    if($website_phone)
    {
        $external_website->website_phone = $website_phone->value;
    }
    $website_name = Setting::where('type', 'website_name')->first();
    if ($website_name) {
        $external_website->name = $website_name->value;
    }
    $black_logo = Setting::where('type', 'black_logo')->first();
    if ($black_logo) {
        $upload = Upload::where('id', $black_logo->value)->first();
        if ($upload) {
            $external_website->black_logo = get_storage_url($upload->file_name);
        }
    }
    $white_logo = Setting::where('type', 'white_logo')->first();
    if ($white_logo) {
        $upload = Upload::where('id', $white_logo->value)->first();
        if ($upload) {
            $external_website->white_logo = get_storage_url($upload->file_name);
        }
    }

    return $external_website;
}
function logedInUser()
{
    if (auth()->check() && auth()->user()) {
        $user = auth()->user();
        if ($user) {
            $upload = Upload::where('id', $user->image)->first();
            if ($upload) {
                $user->image = get_storage_url($upload->file_name);
            }
        }

        // Fetch the most recent agreement for the logged-in user
        $agreement = CustomerAgentConnection::where('customer_id', auth()->user()->id)->orderBy('created_at', 'desc')->first();

        if ($agreement) {
            $user->agreement = $agreement->terms_agreed;
        }
        return $user;
    }
}

// function CheckCustomerAgreement()
// {
//     // Check if the user is authenticated
//     if (auth()->check()) {
//         $user = auth()->user();

//         // Fetch the most recent agreement for the logged-in user
//         $agreement = CustomerAgentConnection::where('customer_id', $user->id)->where('terms_agreed',true)
//             ->orderBy('created_at', 'desc')
//             ->first();

//         dd($agreement);
//            // Return the agreement object or null if none exists
//         return $agreement;

//     }

//     return null; // Return null if the user is not authenticated
// }

function get_storage_url($path)
{
    return Storage::url($path);
}
