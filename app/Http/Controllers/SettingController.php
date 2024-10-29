<?php

namespace App\Http\Controllers;

use App\Models\Carousel;
use App\Models\Seo;
use App\Models\Setting;
use App\Models\Upload;
use DB;
use File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class SettingController extends Controller
{
    // the below code is for Email
    public function welcome_email()
    {
        $name = 'welcom_email';
        return view('app', compact('name'));
    }

    public function welcome_email_store(Request $request)
    {

        $request->validate([
            'subject' => 'required',
            'email_description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty or contain only HTML tags.");
                }
            }],
        ]);

        if ($request->email_description) {
            $email_data_array = [];

            $email_data_array[] = [
                'subject' => $request->subject,
                'description' => $request->email_description,
            ];

            $Email = Setting::where('type', 'welcome_email')->first();
            if (!$Email) {
                $Email = new Setting;
                $Email->id = Str::orderedUuid();
            }

            $Email->type = 'welcome_email';
            $Email->value = json_encode($email_data_array);
            $Email->save();

        }
    }
    public function welcome_email_fetch()
    {
        $Email = Setting::where('type', 'welcome_email')->first();
        return $Email;
    }
    // Reset password email functions
    public function Reset_password_email()
    {

        $name = 'reset_email';
        return view('app', compact('name'));
    }

    public function Reset_password_email_fetch()
    {
        $Email = Setting::where('type', 'reset_password_email_section')->first();

        return $Email;
    }
    public function reset_password_email_store(Request $request)
    {
        $request->validate([
            'subject' => 'required',
            'email_description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty or contain only HTML tags.");
                }
            }],
        ]);

        if ($request->email_description) {
            $email_data_array = [];

            $email_data_array[] = [
                'subject' => $request->subject,
                'description' => $request->email_description,
            ];

            $Email = Setting::where('type', 'reset_password_email_section')->first();
            if (!$Email) {
                $Email = new Setting;
                $Email->id = Str::orderedUuid();
            }

            $Email->type = 'reset_password_email_section';
            $Email->value = json_encode($email_data_array);
            $Email->save();

        }
    }
    // verification code email functions
    public function verification_code_email()
    {

        $name = 'verification_code_email_section';
        return view('app', compact('name'));
    }

    public function verification_code_email_fetch()
    {
        $Email = Setting::where('type', 'verification_code_email_section')->first();

        return $Email;
    }
    public function verification_code_email_store(Request $request)
    {
        $request->validate([
            'subject' => 'required',
            'email_description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty or contain only HTML tags.");
                }
            }],
        ]);

        if ($request->email_description) {
            $email_data_array = [];

            $email_data_array[] = [
                'subject' => $request->subject,
                'description' => $request->email_description,
            ];

            $Email = Setting::where('type', 'verification_code_email_section')->first();
            if (!$Email) {
                $Email = new Setting;
                $Email->id = Str::orderedUuid();
            }

            $Email->type = 'verification_code_email_section';
            $Email->value = json_encode($email_data_array);
            $Email->save();

        }
    }

    // External website
    public function website_info_store(Request $request)
    {

        $request->validate([
            'website_name' => 'required|string|max:255',
            'youtube_link' => 'nullable|string|max:255',
            'instagram_link' => 'nullable|string|max:255',
            'facebook_link' => 'nullable|string|max:255',
            'email' => 'nullable|string|max:255',
            'website_address' => 'nullable',
            'website_phone' => 'nullable',
        ]);

        if ($request->website_name) {
            $website_name = Setting::where('type', 'website_name')->first();
            if (!$website_name) {
                $website_name = new Setting;
                $website_name->id = Str::orderedUuid();
            }

            $website_name->type = 'website_name';
            $website_name->value = $request->website_name;
            $website_name->save();

        }
        if ($request->youtube_link) {
            $youtube = Setting::where('type', 'youtube')->first();
            if (!$youtube) {
                $youtube = new Setting;
                $youtube->id = Str::orderedUuid();
            }

            $youtube->type = 'youtube';
            $youtube->value = $request->youtube_link;
            $youtube->save();

        }
        if ($request->instagram_link) {
            $instagram = Setting::where('type', 'instagram')->first();
            if (!$instagram) {
                $instagram = new Setting;
                $instagram->id = Str::orderedUuid();
            }

            $instagram->type = 'instagram';
            $instagram->value = $request->instagram_link;
            $instagram->save();

        }
        if ($request->facebook_link) {
            $facebook = Setting::where('type', 'facebook')->first();
            if (!$facebook) {
                $facebook = new Setting;
                $facebook->id = Str::orderedUuid();
            }

            $facebook->type = 'facebook';
            $facebook->value = $request->facebook_link;
            $facebook->save();

        }
        if ($request->email) {
            $email = Setting::where('type', 'email')->first();
            if (!$email) {
                $email = new Setting;
                $email->id = Str::orderedUuid();
            }

            $email->type = 'email';
            $email->value = $request->email;
            $email->save();

        }
        if ($request->website_address) {
            $website_address = Setting::where('type', 'website_address')->first();
            if (!$website_address) {
                $website_address = new Setting;
                $website_address->id = Str::orderedUuid();
            }

            $website_address->type = 'website_address';
            $website_address->value = $request->website_address;
            $website_address->save();

        }
        if ($request->website_phone) {
            $website_phone = Setting::where('type', 'website_phone')->first();
            if (!$website_phone) {
                $website_phone = new Setting;
                $website_phone->id = Str::orderedUuid();
            }

            $website_phone->type = 'website_phone';
            $website_phone->value = $request->website_phone;
            $website_phone->save();

        }
    }

    public function website_info_fetch()
    {
        $website_info = [];
        $website_name = Setting::where('type', 'website_name')->first();
        $website_info['website_name'] = $website_name->value ?? "";

        $youtube_link = Setting::where('type', 'youtube')->first();
        $website_info['youtube_link'] = $youtube_link->value ?? "";

        $instagram_link = Setting::where('type', 'instagram')->first();
        $website_info['instagram_link'] = $instagram_link->value ?? "";

        $facebook_link = Setting::where('type', 'facebook')->first();
        $website_info['facebook_link'] = $facebook_link->value ?? "";

        $email = Setting::where('type', 'email')->first();
        $website_info['email'] = $email->value ?? "";

        $website_phone = Setting::where('type', 'website_phone')->first();
        $website_info['website_phone'] = $website_phone->value ?? "";

        $website_address = Setting::where('type', 'website_address')->first();
        $website_info['website_address'] = $website_address->value ?? "";

        return $website_info;
    }

     // website logo
     public function logo_store(Request $request)
     {
 
         $request->validate([
             'black_logo' => 'required_without:white_logo|nullable',
             'white_logo' => 'required_without:black_logo|nullable',
         ]);
         
 
         if ($request->black_logo) {
             $Black_logo = Setting::where('type', 'black_logo')->first();
             if ($Black_logo) {
                 $existingInUploads = Upload::where('id', $Black_logo->value)->first();
                 if ($existingInUploads) {
                     Storage::delete($existingInUploads->file_name);
                     $existingInUploads->delete();
                 }
 
             }
             if (!$Black_logo) {
                 $Black_logo = new Setting;
                 $Black_logo->id = Str::orderedUuid();
             }
 
             $Black_logo->type = 'black_logo';
 
             if ($request->file('black_logo')) {
                 $file_name_with_path = $request->file('black_logo')->store('real_public/website_logos');
                 $upload = new Upload;
                 $upload->file_original_name = $request->file('black_logo')->getClientOriginalName();
                 $upload->file_name = $file_name_with_path;
                 $upload->file_size = $request->file('black_logo')->getSize();
                 $upload->extension = $request->file('black_logo')->extension();
                 $upload->type = $request->file('black_logo')->getClientMimeType();
                 $upload->save();
 
                 $Black_logo->value = $upload->id;
             }
 
             $Black_logo->save();
 
         }
         if ($request->white_logo) {
             $White_logo = Setting::where('type', 'white_logo')->first();
             if ($White_logo) {
                 $existingInUploads = Upload::where('id', $White_logo->value)->first();
                 if ($existingInUploads) {
                     Storage::delete($existingInUploads->file_name);
                     $existingInUploads->delete();
                 }
 
             }
             if (!$White_logo) {
                 $White_logo = new Setting;
                 $White_logo->id = Str::orderedUuid();
             }
 
             $White_logo->type = 'white_logo';
 
             if ($request->file('white_logo')) {
                 $file_name_with_path = $request->file('white_logo')->store('real_public/website_logos');
                 $upload = new Upload;
                 $upload->file_original_name = $request->file('white_logo')->getClientOriginalName();
                 $upload->file_name = $file_name_with_path;
                 $upload->file_size = $request->file('white_logo')->getSize();
                 $upload->extension = $request->file('white_logo')->extension();
                 $upload->type = $request->file('white_logo')->getClientMimeType();
                 $upload->save();
 
                 $White_logo->value = $upload->id;
             }
 
             $White_logo->save();
 
         }
     }

     public function logo()
     {
        $white_log_file = '';
        $black_log_file = '';
         $black_logo = Setting::where('type', 'black_logo')->first();
         if ($black_logo) {
             $upload = Upload::where('id', $black_logo->value)->first();
 
             if ($upload) {
                 $black_log_file = get_storage_url($upload->file_name);
             }
         }
         $white_logo = Setting::where('type', 'white_logo')->first();
         if ($white_logo) {
             $upload = Upload::where('id', $white_logo->value)->first();
 
             if ($upload) {
                 $white_log_file = get_storage_url($upload->file_name);
             }
         } 
         
         return ['white_logo' => $white_log_file, 'black_logo' => $black_log_file];
     }

    // carousel coding
    public function carousel_store(Request $request)
    {
        $request->validate([
            'image' => 'required_without:video',
            'video' => 'required_without:image',
            'description' => 'nullable',
        ]);

        $Carousel = new Carousel;
        $Carousel->id = Str::orderedUuid();

        if ($request->image) {
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/Carousel_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();
            $Carousel->image_id = $Upload->id;
        }
        if ($request->video) {

            $videoFile = $request->video;
            $videoName = Str::random(40) . '.' . $videoFile->getClientOriginalExtension();
            $videoPath = 'real_public/Carousel_videos/';

            // Store the video file
            $videoFile->move($videoPath, $videoName);

            // Save details in the database
            $upload = new Upload;

            $upload->file_original_name = $videoName;
            $upload->extension = $videoFile->getClientOriginalExtension();
            $upload->type = $videoFile->getClientMimeType();
            $upload->file_name = $videoPath . $videoName;
            $upload->save();

            $Carousel->image_id = $upload->id;
        }

        $Carousel->save();

        return 'success';
    }

    public function carousel_fetch()
    {

        $carousels = Carousel::orderBy('order_id', 'asc')->get();
        if ($carousels) {
            foreach ($carousels as $record) {
                $uploaded_image = Upload::where('id', $record->image_id)->first(['file_original_name', 'file_name', 'extension', 'type', 'id']);

                if ($uploaded_image) {
                    $record->image = [
                        'url' => get_storage_url($uploaded_image->file_name),
                        'type' => $uploaded_image->type,
                    ];
                }
            }
            return $carousels;
        }
    }

    public function carousel_text_update(Request $request)
    {
        
        foreach (json_decode($request->text_list) as $record) {
           
            $carousel = Carousel::where('id', $record->id)->first();
            if($carousel)
            { 
                $carousel->description = $record->description;
     
                $carousel->save();
            }
        }
        return 'success';
    }
    public function carousel_delete($id)
    {

        $carousel = Carousel::where('id', $id)->first();
        if ($carousel->image_id) {
            $upload = Upload::where('id', $carousel->image_id)->first();
            if ($upload) {
                Storage::delete($upload->file_name);
                $upload->delete();
            }

        }
        $carousel->delete();

        return 'success';
    }

    public function carousel_dragging($newPositions)
    {
        $newPositions = json_decode($newPositions);

        foreach ($newPositions as $newPosition) {
            $carousel = Carousel::findOrFail($newPosition->event_id);
            $carousel->order_id = $newPosition->order_id;
            $carousel->save();
        }

        return 'success';
    }

    // SEO
    public function seo_store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'keywords' => 'required',
            'description' => 'required',
        ]);
        $Exist_seo = $seo_exist = DB::table('seo')->first();

        if ($Exist_seo) {

            $seo_exist = DB::table('seo')->first();
            $Seo = Seo::findOrFail($seo_exist->id);

        } else {

            $Seo = new Seo;
            $Seo->id = Str::orderedUuid();

        }

        $Seo->title = $request->title;
        $Seo->keyword = $request->keywords;
        $Seo->description = $request->description;

        if ($request->file('image')) {

            $existingInUploads = Upload::where('id', $Seo->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            if ($request->file('image')) {

                $file_name_with_path = $request->file('image')->store('real_public/Seo_images');
                $upload = new Upload;
                $upload->file_original_name = $request->file('image')->getClientOriginalName();
                $upload->file_name = $file_name_with_path;
                $upload->file_size = $request->file('image')->getSize();
                $upload->extension = $request->file('image')->extension();
                $upload->type = $request->file('image')->getClientMimeType();
                $upload->save();
                $Seo->image = $upload->id;
            }
        }
        $Seo->save();
        return 'success';
    }

    public function seo()
    {
        $seo = DB::table('seo')->first();

        if ($seo) {
            $upload = Upload::where('id', $seo->image)->first();
            if ($upload) {
                $seo->image = $upload->file_name ? get_storage_url($upload->file_name) : '';
            }
        }
        return $seo;
    }

    // External website top bar section
    // public function website_top_bar_data_store(Request $request)
    // {

    //     $request->validate([
    //         'youtube_link' => 'nullable|string|max:255',
    //         'instagram_link' => 'nullable|string|max:255',
    //         'facebook_link' => 'nullable|string|max:255',
    //         'email' => 'nullable|string|max:255',
    //     ]);
    //     if ($request) {
    //         $topbar_section_array = [];

    //         $topbar_section_array[] = [
    //             'youtube_link' => $request->youtube_link,
    //             'instagram_link' => $request->instagram_link,
    //             'facebook_link' => $request->facebook_link,
    //             'email' => $request->email,
    //         ];

    //         $top_bar_section = Setting::where('type', 'top_bar_section')->first();
    //         if (!$top_bar_section) {
    //             $top_bar_section = new Setting;
    //             $top_bar_section->id = Str::orderedUuid();
    //         }

    //         $top_bar_section->type = 'top_bar_section';
    //         $top_bar_section->value = json_encode($topbar_section_array);
    //         $top_bar_section->save();

    //     }

    // }

    // public function website_top_bar_data_fetch()
    // {
    //     $top_bar_section = Setting::where('type', 'top_bar_section')->first();
    //     return $top_bar_section;
    // }

}
