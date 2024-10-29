<?php

namespace App\Http\Controllers;

use App\Models\AccommodationOtherImag;
use App\Models\ActivityOtherImag;
use App\Models\Country;
use App\Models\SingleTourCountry;
use App\Models\Tour;
use App\Models\TourAccommodation;
use App\Models\TourActivity;
use App\Models\TourBooking;
use App\Models\TourCalendar;
use App\Models\TourItinerary;
use App\Models\TourOtherImage;
use App\Models\TourPriceInclude;
use App\Models\TourTag;
use App\Models\TourUsefullInformation;
use App\Models\TripHightlight;
use App\Models\Upload;
use App\Models\User;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;

class TourController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $name = 'tour';
        // return view('backend.tour.index');
        return view('app', compact('name'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('app');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function tour_save(Request $request)
    {
        $request->validate([
            'title' => 'required|unique:tours,title,' . $request->id,
            'sub_title' => 'required|String|max:255',
            'description' => 'required',
            'price' => 'required|numeric|min:0',

            'discount' => 'nullable|numeric|min:0',
            'price_includes' => 'nullable',
            'important_notes' => 'nullable',
            'offer_conditions' => 'nullable',
            'not_included' => 'nullable',
            'image' => $request->id ? 'nullable' : 'required',
            'itinerary_description' => 'required',
            'itinerary_image' => $request->id ? 'nullable' : 'required',
        ]);
        if ($request->id) {
            $tour = Tour::findOrFail($request->id);
            $operator_status = filter_var($request->operator_status, FILTER_VALIDATE_BOOLEAN);
            $tour->operator_status = ($operator_status == true) ? 1 : 0;

        } else {
            $tour = new Tour;
            $tour->id = Str::orderedUuid();
            $tour->user_id = auth()->user()->id;

            if (auth()->check() && auth()->user()->role == 'admin') {
                $tour->operator_status = 1;
            } else {
                $tour->operator_status = 0;
            }
        }
        $tour->title = $request->title;
        $tour->sub_title = $request->sub_title;
        $tour->description = $request->description;
        $tour->price = $request->price;
        $tour->discount = $request->discount;

        // $tour->status = $request->status;
        // $tour->flash_sale = $request->flash_sale;
        // $tour->best_seller = $request->best_seller;
        // $tour->multi_country = $request->multi_country;

        $tour->status = ($request->status == true) ? 1 : 0;
        $tour->flash_sale = ($request->flash_sale == true) ? 1 : 0;
        $tour->best_seller = ($request->best_seller == true) ? 1 : 0;
        $tour->multi_country = ($request->multi_country == true) ? 1 : 0;

        $tour->important_notes = $request->important_notes;
        $tour->offer_conditions = $request->offer_conditions;
        $tour->not_included = $request->not_included;

        if ($request->tourTags) {
            TourTag::where('tour_id', $tour->id)->delete();

            $tags = $request->tourTags;

            foreach ($tags as $tag_name) {
                $tour_tag = new TourTag;
                $tour_tag->id = Str::orderedUuid();
                $tour_tag->tour_id = $tour->id;
                $tour_tag->tag_name = $tag_name;
                $tour_tag->save();
            }
        }
        // $tour->country = $request->country;
        if ($request->countries) {
            SingleTourCountry::where('tour_id', $tour->id)->delete();
            $countries = $request->countries;

            foreach ($countries as $countryData) {

                $country = new SingleTourCountry();
                $country->id = Str::orderedUuid();
                $country->tour_id = $tour->id;
                $country->country_id = $countryData; // assuming $countryData is an object with an id property
                $country->save();

            }
        }
        // dd($request->price_includes);
        // The price includes code starts here

        // VisitTemperature::where('visit_id', $visits->id)->delete();
        // $new_temperature_list = $request->temperatures_list;
        // foreach ($new_temperature_list as $key => $temperature) {
        //     if (empty($temperature['temperature']) || empty($temperature['method'])) {
        //         return response()->json([
        //             'errors' => [
        //                 'temperature' => [translate('Temperature field is required')],
        //                 'method' => [translate('Temperature method field is required')],
        //             ],
        //             'success' => false,
        //             'message' => translate("The given data was invalid."),
        //         ], 422);
        //     } else {
        //         $visit_temperature = new VisitTemperature;
        //         $visit_temperature->id = Str::orderedUuid();
        //         $visit_temperature->visit_id = $visits->id;
        //         $visit_temperature->temperature = $temperature['temperature'];
        //         $visit_temperature->method = $temperature['method'];
        //         $visit_temperature->save();
        //     }
        // }

        if ($request->price_includes) {
            TourPriceInclude::where('tour_id', $tour->id)->delete();
            $new_list = json_decode($request->price_includes, true); // Decode JSON string into an associative array
            foreach ($new_list as $rule) {
                if ($rule['the_price_include']) {

                    $newPriceInclude = new TourPriceInclude;
                    $newPriceInclude->id = Str::orderedUuid();
                    $newPriceInclude->tour_id = $tour->id;
                    $newPriceInclude->the_price_include = $rule['the_price_include']; // Assuming the field title is 'the_price_include'
                    $newPriceInclude->save();
                }
            }
        }

        if ($request->image) {

            $existingInUploads = Upload::where('id', $tour->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/tour_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $tour->image = $Upload->id;
        }
        if ($request->itinerary_image) {

            $existingInUploads = Upload::where('id', $tour->itinerary_image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->itinerary_image, strpos($request->itinerary_image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/tour_itinerary_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $tour->itinerary_image = $Upload->id;
        }
        $tour->itinerary_description = $request->itinerary_description;

        $tour->save();
        return $tour->id;
    }

    /**
     * Display the specified resource.
     */
    public function fetch_tours(Request $request)
    {
        $tours = DB::table('tours');
        if ($request->title !== null && $request->title !== "null") {
            $tours->where(function ($query) use ($request) {
                $query->where('title', 'LIKE', '%' . $request->title . '%');
            });
        }
        if (auth()->user()->role == "admin") {
            $tours = $tours->paginate(15);
        } else {

            $tours = $tours->where('user_id', auth()->user()->id)->paginate(15);
        }

        foreach ($tours as $key => $tour) {
            if ($tour && $tour->image) {
                $uploaded_image = Upload::where('id', $tour->image)->first();

                if ($uploaded_image) {
                    $tour->image = get_storage_url($uploaded_image->file_name);
                }
                $tour->status = ($tour->status == 1) ? true : false;

            }
        }

        return $tours;
    }

    public function tour_delete($id)
    {
        $tour = Tour::findOrFail($id);
        $existingInUploads = Upload::where('id', $tour->image)->first();
        if ($existingInUploads) {
            Storage::delete($existingInUploads->file_name);
            $existingInUploads->delete();
        }

        TourPriceInclude::where('tour_id', $id)->delete();
        TourTag::where('tour_id', $id)->delete();
        SingleTourCountry::where('tour_id', $id)->delete();

        $tour_other_files = TourOtherImage::where('tour_id', $id)->get();

        foreach ($tour_other_files as $image) {

            if ($image->image) {
                Storage::delete($image->image);
            }
            $image->delete();
        }
        $tour_itineraries = TourItinerary::where('tour_id', $id)->get();
        foreach ($tour_itineraries as $itinerary) {
            if ($itinerary->image) {
                Storage::delete($itinerary->image);
            }
            $itinerary->delete();
        }

        $tour_activities = TourActivity::where('tour_id', $id)->get();
        foreach ($tour_activities as $activity) {
            $activity_other_images = ActivityOtherImag::where('activity_id', $activity->id)->get();
            foreach ($activity_other_images as $image) {
                if ($image->image) {
                    Storage::delete($image->image);
                }
            }
            $activity->delete();
        }

        $tour->delete();
        return 'success';
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit_tour($id)
    {
        return view('app', compact('id'));
    }

    public function get_tour($id)
    {
        
        $tour = Tour::where('id', $id)->first();
        if ($tour && $tour->image) {
            $uploaded_image = Upload::where('id', $tour->image)->first();

            if ($uploaded_image) {
                $tour->image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($tour && $tour->itinerary_image) {
            $uploaded_image = Upload::where('id', $tour->itinerary_image)->first();

            if ($uploaded_image) {
                $tour->itinerary_image = get_storage_url($uploaded_image->file_name);
            }
        }

        $tourPriceInculde = TourPriceInclude::where('tour_id', $id)->get();
        if ($tourPriceInculde) {
            $tour->tour_price_includes = $tourPriceInculde;
        } 

        $tour_tags = TourTag::where('tour_id', $id)->pluck('tag_name');
        if ($tour_tags) {
            $tour->tour_tags = $tour_tags;
        }
        $countries = SingleTourCountry::where('tour_id', $id)->pluck('country_id');
        if ($countries) {
            $tour->countries = $countries;
        }
        // $single_tour_countries = SingleTourCountry::where('tour_id', $id)->pluck('country_id');
        // if ($single_tour_countries) {

        //     foreach($single_tour_countries as $country)
        //     {

        //         $country_record = Country::where('id',$country->id)->first();
        //         $country->country->name = $country_record->name;

        //     }

        // }
        $tour->status = ($tour->status == 1) ? true : false;
        $tour->operator_status = ($tour->operator_status == 1) ? true : false;
        $tour->flash_sale = ($tour->flash_sale == 1) ? true : false;
        $tour->best_seller = ($tour->best_seller == 1) ? true : false;
        $tour->multi_country = ($tour->multi_country == 1) ? true : false;

        return $tour;
    }
    // Show the details page.
    public function details_tour($id)
    {
        return view('app', compact('id'));
    }
    public function get_details_tour($id)
    {
        $tour = Tour::where('id', $id)->first();

        if ($tour && $tour->image) {
            $uploaded_image = Upload::where('id', $tour->image)->first();

            if ($uploaded_image) {
                $tour->image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($tour && $tour->itinerary_image) {
            $uploaded_image = Upload::where('id', $tour->itinerary_image)->first();

            if ($uploaded_image) {
                $tour->itinerary_image = get_storage_url($uploaded_image->file_name);
            }
        }

        $country = Country::where('id', $tour->country)->first();
        if ($country) {
            $tour->country = $country->title;
        } else {
            $tour->country = "No Country Added";
        }

        $tour->status = ($tour->status == 1) ? "ON" : "OFF" ?? "";

        $tour->flash_sale = ($tour->flash_sale == 1) ? "ON" : "OFF";
        $tour->best_seller = ($tour->best_seller == 1) ? "ON" : "OFF";
        $tour->multi_country = ($tour->multi_country == 1) ? "ON" : "OFF";
        $tour->operator_status = ($tour->operator_status == 1) ? "ON" : "OFF";

        $tourTags = TourTag::where('tour_id', $id)->get();
        if ($tourTags) {
            $tour->tourTags = $tourTags;
        }

        $single_tour_countries_ids = SingleTourCountry::where('tour_id', $id)->pluck('country_id');
        $countries = Country::whereIn('id', $single_tour_countries_ids)->pluck('name');

        $tour->countries = $countries->implode(', ');

        $tourPriceInculde = TourPriceInclude::where('tour_id', $id)->get();
        if ($tourPriceInculde) {

            $tour->tour_price_includes = $tourPriceInculde;
        }
        // dd($tour->tourPriceInculde);
        // if ($tourPriceInculde) {
        //     $tour->tourPriceInculde = $tourPriceInculde;
        // }

        $tour_other_files = TourOtherImage::where('tour_id', $id)->get();
        foreach ($tour_other_files as $tour_file) {
            if ($tour_file && $tour_file->file) {
                $uploaded_image = Upload::where('id', $tour_file->file)->first(['file_original_name', 'file_name', 'extension', 'type', 'id']);

                if ($uploaded_image) {
                    $tour_file->file = [
                        'url' => get_storage_url($uploaded_image->file_name),
                        'type' => $uploaded_image->type,
                    ];
                }

            }
        }

        $tour->other_images = $tour_other_files ?? "";

        return $tour;
    }

    public function tour_status_change(Request $request)
    {
        $tour = Tour::where('id', $request->tour_id)->first();
        if ($tour) {
            // Convert the value to boolean using filter_var
            $status = filter_var($request->status, FILTER_VALIDATE_BOOLEAN);

            $tour->status = $status ? 1 : 0;
            $tour->save();

        }
        return 'success';
    }

    // Tour other images
    public function tour_other_image_save(Request $request)
    {
        $tour_other_file = new TourOtherImage;
        $tour_other_file->id = Str::orderedUuid();
        $tour_other_file->tour_id = $request->id;
        if ($request->video) {
            // dd($request->video);

            $videoFile = $request->video;
            $videoName = Str::random(40) . '.' . $videoFile->getClientOriginalExtension();
            $videoPath = 'real_public/tour_other_videos/';

            $videoFile->move($videoPath, $videoName);
            $Upload = new Upload;

            $Upload->file_original_name = $videoName;
            $Upload->extension = $videoFile->getClientOriginalExtension();
            $Upload->type = $videoFile->getClientMimeType();
            $Upload->file_name = $videoPath . $videoName;
            $Upload->save();

            $tour_other_file->file = $Upload->id;
        } else if ($request->image) {

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/tour_other_files/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $tour_other_file->file = $Upload->id;
        }

        $tour_other_file->save();
        return 'success';
    }
    public function tour_other_image_delete($id)
    {
        $tour_other_file = TourOtherImage::find($id);

        $existingInUploads = Upload::where('id', $tour_other_file->file)->first();
        if ($existingInUploads) {
            Storage::delete($existingInUploads->file_name);
            $existingInUploads->delete();
        }
        $tour_other_file->delete();
        return 'success';

    }
    // itineraries code here

    public function itinerary_create($tour_id, $status)
    {
        return view('app', compact('tour_id', 'status'));
    }
    public function itinerary_save(Request $request)
    {
        // dd($request);
        $request->validate([
            'title' => 'required|string|max:255',
            'itinerary_image' => 'nullable',
            'description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty.");
                }
            }],
            'image' => 'nullable',

        ]);

        if ($request->status == 'edit') {
            $itinerary = TourItinerary::findOrFail($request->id);
        } else {
            $itinerary = new TourItinerary;
            $itinerary->id = Str::orderedUuid();
        }
        $itinerary->tour_id = $request->tour_id;
        $itinerary->title = $request->title;
        $itinerary->description = $request->description;

        if ($request->image) {

            $existingInUploads = Upload::where('id', $itinerary->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/itinerary_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $itinerary->image = $Upload->id;
        }

        $itinerary->save();
        return 'success';
    }
    public function get_itineraries_tour($id)
    {
        $itineraries = TourItinerary::where('tour_id', $id)->get();
        foreach ($itineraries as $itinerary) {

            if ($itinerary && $itinerary->image) {
                $uploaded_image = Upload::where('id', $itinerary->image)->first();

                if ($uploaded_image) {
                    $itinerary->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }
        return $itineraries;
    }

    public function edit_itinerary($tour_id, $status, $itinerary_id)
    {
        return view('app', compact('tour_id', 'status', 'itinerary_id'));
    }
    public function get_itinerary($itinerary_id)
    {
        $itinerary = TourItinerary::where('id', $itinerary_id)->first();
        if ($itinerary && $itinerary->image) {
            $uploaded_image = Upload::where('id', $itinerary->image)->first();

            if ($uploaded_image) {
                $itinerary->image = get_storage_url($uploaded_image->file_name);
            }
        }

        return $itinerary;
    }

    public function itinerary_delete($itinerary_id)
    {

        $itinerary = TourItinerary::findOrFail($itinerary_id);
        if ($itinerary->image) {
            $existingInUploads = Upload::where('id', $itinerary->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
        }
        $itinerary->delete();
        return 'success';
    }

    // activity code here
    public function activity_create($tour_id, $status)
    {
        return view('app', compact('tour_id', 'status'));
    }
    public function activity_save(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty.");
                }
            }],

        ]);

        if ($request->process_status == 'edit') {
            $activity = TourActivity::findOrFail($request->id);
        } else {
            $activity = new TourActivity;
            $activity->id = Str::orderedUuid();
        }
        $activity->tour_id = $request->tour_id;

        $activity->status = $request->status;
        $activity->title = $request->title;
        $activity->description = $request->description;

        $activity->save();
        return 'success';
    }
    public function get_activities_tour($id)
    {

        $activities = TourActivity::where('tour_id', $id)->get();

        return $activities;
    }

    public function edit_activity($tour_id, $status, $activity_id)
    {
        return view('app', compact('tour_id', 'status', 'activity_id'));
    }
    public function get_activity($activity_id)
    {
        $activity = TourActivity::where('id', $activity_id)->first();
        $activity->status = ($activity->status == 1) ? true : false;

        return $activity;
    }

    public function activity_delete($activity_id)
    {

        $activity = TourActivity::findOrFail($activity_id);
        $activities_other_images = ActivityOtherImag::where('activity_id', $activity_id)->get();
        foreach ($activities_other_images as $activity_image) {
            $existingInUploads = Upload::where('id', $activity_image->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
                $activity_image->delete();
            }
        }

        $activity->delete();
        return 'success';
    }

    // activities code
    public function details_activity($activity_id, $tour_id)
    {
        return view('app', compact('activity_id', 'tour_id'));
    }
    public function activity_details_fetch($activity_id)
    {
        $activity = TourActivity::findOrFail($activity_id);
        $activity->status = ($activity->status == 1) ? "Included" : "Optional";
        $activity_other_images = ActivityOtherImag::where('activity_id', $activity_id)->get();

        foreach ($activity_other_images as $activity_image) {
            if ($activity_image && $activity_image->image) {
                $uploaded_image = Upload::where('id', $activity_image->image)->first();
                if ($uploaded_image) {
                    $activity_image->image = get_storage_url($uploaded_image->file_name);
                }
            }

        }

        $activity->other_images = $activity_other_images ?? "";
        return $activity;
    }

    public function activity_other_image_save(Request $request)
    {
        $activity_other_image = new ActivityOtherImag;
        $activity_other_image->id = Str::orderedUuid();
        $activity_other_image->activity_id = $request->id;

        if ($request->image) {

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/activity_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $activity_other_image->image = $Upload->id;
        }

        $activity_other_image->save();
        return 'success';
    }
    public function activity_image_delete($id)
    {
        $activity = ActivityOtherImag::find($id);
        $existingInUploads = Upload::where('id', $activity->image)->first();
        if ($existingInUploads) {
            Storage::delete($existingInUploads->file_name);
            $existingInUploads->delete();
        }

        $activity->delete();
        return 'success';

    }

    // Tour dates
    public function tour_dates_save(Request $request)
    {

        $request->validate([
            'dates' => 'required|array',
            'dates.*' => 'date_format:Y-m-d\TH:i:s.v\Z', // Validate each date format individually
            'price' => 'required|digits_between:1,4',
            'discounted_price' => 'required|digits_between:1,4',
            'infants' => 'required|numeric|min:0',
            'children' => 'required|numeric|min:0',
            'adults' => 'required|numeric|min:0',
        ]);

        $datesArray = $request->dates;

        if (count($datesArray) >= 2) {
            $startDate = Carbon::parse($datesArray[0]);
            $endDate = Carbon::parse($datesArray[count($datesArray) - 1]);

            if ($request->record_id) {
                $tourCalendar = TourCalendar::where('id', $request->record_id)->first();
            } else {

                $tourCalendar = new TourCalendar;
                $tourCalendar->id = Str::orderedUuid();
            }

            $tourCalendar->start_date = $startDate->toDateString();
            $tourCalendar->end_date = $endDate->toDateString();

            $tourCalendar->tour_id = $request->tour_id;
            $tourCalendar->price = $request->price;
            $tourCalendar->discounted_price = $request->discounted_price;
            $tourCalendar->infants = $request->infants;
            $tourCalendar->children = $request->children;
            $tourCalendar->adults = $request->adults;

            // Save the model
            $tourCalendar->save();

            return 'success';

        }
    }
    public function fetch_tour_dates($tour_id)
    {
        return TourCalendar::where('tour_id', $tour_id)->orderBy('start_date')->get();
    }
    public function tour_dates_delete($record_id)
    {
        TourCalendar::where('id', $record_id)->delete();
    }
    public function tour_dates_edit($record_id)
    {
        $tourDates = TourCalendar::where('id', $record_id)->first();

        //  converting back the start and end date to the format of multi selectot.
        $originalStartDate = Carbon::parse($tourDates->start_date)->format('Y-m-d\TH:i:s.v\Z');
        $originalEndDate = Carbon::parse($tourDates->end_date)->format('Y-m-d\TH:i:s.v\Z');
        $originalDatesArray = [
            $originalStartDate,
            $originalEndDate,
        ];
        $tourDates->dates = $originalDatesArray;
        return $tourDates;
    }

    ////////////////////// Accomodations section code /////////////////////////////////////////
    ////////////////////// Accomodations section code /////////////////////////////////////////

    // activity code here
    public function accommodation_create($tour_id, $status)
    {
        return view('app', compact('tour_id', 'status'));
    }
    public function accommodation_save(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => ['required', function ($attribute, $value, $fail) {
                if (strip_tags($value) === '') {
                    $fail("Description cannot be empty.");
                }
            }],

        ]);

        if ($request->process_status == 'edit') {
            $accommodation = TourAccommodation::findOrFail($request->id);
        } else {
            $accommodation = new TourAccommodation;
            $accommodation->id = Str::orderedUuid();
        }
        $accommodation->tour_id = $request->tour_id;

        $accommodation->status = $request->status;
        $accommodation->title = $request->title;
        $accommodation->description = $request->description;

        $accommodation->save();
        return 'success';
    }
    public function get_accommodations_tour($id)
    {

        $accommodations = TourAccommodation::where('tour_id', $id)->get();

        return $accommodations;
    }

    public function edit_accommodation($tour_id, $status, $accommodation_id)
    {
        return view('app', compact('tour_id', 'status', 'accommodation_id'));
    }
    public function get_accommodation($accommodation_id)
    {
        $accommodation = TourAccommodation::where('id', $accommodation_id)->first();
        $accommodation->status = ($accommodation->status == 1) ? true : false;

        return $accommodation;
    }

    public function accommodation_delete($accommodation_id)
    {

        $accommodation = TourAccommodation::findOrFail($accommodation_id);
        $activities_other_images = AccommodationOtherImag::where('accommodation_id', $accommodation_id)->get();
        foreach ($activities_other_images as $accomodation_image) {
            $existingInUploads = Upload::where('id', $accomodation_image->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
                $accomodation_image->delete();
            }
        }

        $accommodation->delete();
        return 'success';
    }

    public function details_accommodation($accommodation_id, $tour_id)
    {
        return view('app', compact('accommodation_id', 'tour_id'));
    }
    public function accommodation_details_fetch($accommodation_id)
    {
        $accommodation = TourAccommodation::findOrFail($accommodation_id);
        $accommodation->status = ($accommodation->status == 1) ? "Included" : "Optional";
        $accommodation_other_images = AccommodationOtherImag::where('accommodation_id', $accommodation_id)->get();

        foreach ($accommodation_other_images as $accommodation_image) {
            if ($accommodation_image && $accommodation_image->image) {
                $uploaded_image = Upload::where('id', $accommodation_image->image)->first();
                if ($uploaded_image) {
                    $accommodation_image->image = get_storage_url($uploaded_image->file_name);
                }
            }

        }

        $accommodation->other_images = $accommodation_other_images ?? "";
        return $accommodation;
    }

    public function accommodation_other_image_save(Request $request)
    {
        $accommodation_other_image = new AccommodationOtherImag;
        $accommodation_other_image->id = Str::orderedUuid();
        $accommodation_other_image->accommodation_id = $request->id;

        if ($request->image) {

            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/accommodation_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $accommodation_other_image->image = $Upload->id;
        }

        $accommodation_other_image->save();
        return 'success';
    }
    public function accommodation_image_delete($id)
    {
        $accommodation = AccommodationOtherImag::find($id);
        $existingInUploads = Upload::where('id', $accommodation->image)->first();
        if ($existingInUploads) {
            Storage::delete($existingInUploads->file_name);
            $existingInUploads->delete();
        }

        $accommodation->delete();
        return 'success';

    }

    ////////////////////// Accomodations section code /////////////////////////////////////////
    ////////////////////// Accomodations section code /////////////////////////////////////////

    ///////////////////// usefull informations////////////////////////////////////////////////
    ///////////////////// usefull informations////////////////////////////////////////////////
    public function tour_usefull_information_save(Request $request)
    {
        $information = TourUsefullInformation::where('tour_id', $request->tour_id)->first();
        if (!$information) {

            $information = new TourUsefullInformation;

            $information->id = Str::orderedUuid();
            $information->tour_id = $request->tour_id;
        }

        $information->entry_requirements = $request->entry_requirements;
        $information->health = $request->health;
        $information->visa = $request->visa;
        $information->time_zone = $request->time_zone;
        $information->currency = $request->currency;
        $information->other_useful_information = $request->other_useful_information;
        $information->language = $request->language;
        $information->tourist_office_website = $request->tourist_office_website;
        $information->electricity = $request->electricity;
        $information->save();
        return 'success';
    }

    public function get_usefull_information($tour_id)
    {
        $informations = TourUsefullInformation::where('tour_id', $tour_id)->first();
        return $informations;
    }
    ///////////////////// usefull informations////////////////////////////////////////////////
    ///////////////////// usefull informations////////////////////////////////////////////////
    public function tours_countries_pluck()
    {
        $countries = Tour::whereNotNull('country')->pluck('country');
        $countries = Country::whereIn('id', $countries)->pluck('name', 'id');
        return $countries;
    }

    // Booked tours ... coded
    public function booked_tours()
    {
        return view('app');
    }
    public function booked_tours_fetch(Request $request)
    {
        $booked_tours_ids = TourBooking::where('user_id', auth()->user()->id)->pluck('tour_id');

        $tours = DB::table('tours')->whereIn('id', $booked_tours_ids);
        if ($request->title !== null && $request->title !== "null") {
            $tours->where(function ($query) use ($request) {
                $query->where('title', 'LIKE', '%' . $request->title . '%');
            });
        }
        $tours = $tours->paginate(15);

        foreach ($tours as $key => $tour) {
            if ($tour && $tour->image) {
                $uploaded_image = Upload::where('id', $tour->image)->first();

                if ($uploaded_image) {
                    $tour->image = get_storage_url($uploaded_image->file_name);
                }
                $tour->status = ($tour->status == 1) ? true : false;

            }
        }

        return $tours;
    }
    public function add_review_on_tour($tour_id)
    {
        return view('app', compact('tour_id'));
    }

    // ////////////////////// Trip Hightlights /////////////////////////////////////////////////////
    // ////////////////////// Trip Hightlights /////////////////////////////////////////////////////

    public function tour_trip_hightlights_save(Request $request)
    {
        $request->validate([
            'trip_highlight' => 'required|string|max:254',
        ]);

        if ($request->record_id) {
            $trip_highlight = TripHightlight::where('id', $request->record_id)->first();
        } else {
            $trip_highlight = new TripHightlight;
            $trip_highlight->id = Str::orderedUuid();
            $trip_highlight->tour_id = $request->tour_id;
        }
        $trip_highlight->trip_highlight = $request->trip_highlight;
        $trip_highlight->save();
        return 'succss';
    }
    public function fetch_tour_trip_hightlights($tour_id)
    {
        return TripHightlight::where('tour_id', $tour_id)->get();
    }
    public function tour_trip_hightlights_delete($record_id)
    {
        TripHightlight::where('id', $record_id)->delete();
    }
    public function tour_trip_hightlights_edit($record_id)
    {
        $trip_highlight = TripHightlight::where('id', $record_id)->first();
        return $trip_highlight;
    }

    // ////////////////////// Trip Hightlights /////////////////////////////////////////////////////
    // ////////////////////// Trip Hightlights /////////////////////////////////////////////////////

    public function tours_pluck()
    {
        $plucked_tours = Tour::pluck('title', 'id');

        return $plucked_tours;
    }
}
