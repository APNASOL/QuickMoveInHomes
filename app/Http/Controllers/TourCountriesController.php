<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\CountryFaq;
use App\Models\Tour;
use App\Models\TourCalendar;
use App\Models\TourCountry;
use App\Models\Upload;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;

class TourCountriesController extends Controller
{

    public function index()
    {
        $name = 'tour';
        return view('app', compact('name'));
    }

    public function countries_store(Request $request)
    {
        if ($request->tour_country_record_id) {
            $tour_country = TourCountry::where('id', $request->tour_country_record_id)->first();
            $tour_country->country = $request->country;
            $tour_country->save();
        }
        if ($request->countries) {

            $countries = $request->countries;

            foreach ($countries as $country) {

                $tour_country = new TourCountry;
                $tour_country->id = Str::orderedUuid();

                $tour_country->country = $country;
                $tour_country->save();
            }
        }
    }

    public function create($tour_country_id)
    {

        return view('app', compact('tour_country_id'));
    }

    public function details_store(Request $request)
    {

        // dd($request);
        $request->validate([
            'country' => 'nullable',
            'title' => 'nullable|string|max:255',
            'banner' => 'nullable',
            'description_details' => 'nullable',
            'image' => 'nullable',
        ]);

        if ($request->tour_country_record_id) {
            $TourCountry = TourCountry::where('id', $request->tour_country_record_id)->first();
        } else {
            $TourCountry = new TourCountry;
            $TourCountry->id = Str::orderedUuid();
        }

        $TourCountry->title = $request->title;
        $TourCountry->description_details = $request->description_details;

        if ($request->banner) {
            $existingInUploads = Upload::where('id', $TourCountry->banner)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
            $data = substr($request->banner, strpos($request->banner, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'real_public/tour_countries_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);
            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $TourCountry->banner = $Upload->id;
        }

        if ($request->image) {
            $existingInUploads = Upload::where('id', $TourCountry->image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }
            $data = substr($request->image, strpos($request->image, ',') + 1);
            $data = base64_decode($data);
            $image_name_with_path = 'real_public/tour_countries_images/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);
            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;
            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;
            $Upload->save();
            $TourCountry->image = $Upload->id;
        }

        $TourCountry->save();
        return 'success';

    }

    public function tours_countries()
    {
        $name = 'tours_countries';
        return view('app', compact('name'));
    }

    public function fetch_tour_countries(Request $request)
    {
        $tours_countries = TourCountry::paginate(15);
        foreach ($tours_countries as $tc) {

            $country = Country::where('id', $tc->country)->first();
            $tc->country = $country->name;

        }
        return $tours_countries;
    }

    public function fetch_tour_countries_details(Request $request)
    {
        $tours_countries = TourCountry::paginate(15);
        foreach ($tours_countries as $tc) {

            $country = Country::where('id', $tc->name)->first();

            $uploaded_image = Upload::where('id', $tc->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $tc->image = get_storage_url($uploaded_image->file_name);
            }
            $uploaded_banner = Upload::where('id', $tc->banner)->first();
            if ($uploaded_banner && $uploaded_banner->file_name) {
                $tc->banner = get_storage_url($uploaded_banner->file_name);
            }
        }
        return $tours_countries;
    }
    public function tour_country_delete($id)
    {
        $tourCountry = TourCountry::findOrFail($id);
        $uploaded_image = Upload::where('id', $tourCountry->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            Storage::delete($uploaded_image->file_name);
            $uploaded_image->delete();
        }
        $uploaded_banner = Upload::where('id', $tourCountry->banner)->first();
        if ($uploaded_banner && $uploaded_banner->file_name) {
            Storage::delete($uploaded_banner->file_name);
            $uploaded_banner->delete();
        }
        $tourCountry->delete();
        return 'success';
    }
    public function edit_tourCountry($id)
    {
        return view('app', compact('id'));
    }
    public function get_tour_countries($id)
    {
        $tour_country = TourCountry::findOrFail($id);
        $country = Country::where('id', $tour_country->country)->first();
        $tour_country->country = $country->name;
        $uploaded_image = Upload::where('id', $tour_country->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {

            $tour_country->image = get_storage_url($uploaded_image->file_name);

        }
        $uploaded_banner = Upload::where('id', $tour_country->banner)->first();
        if ($uploaded_banner && $uploaded_banner->file_name) {

            $tour_country->banner = get_storage_url($uploaded_banner->file_name);

        }
        return $tour_country;
    }

    public function edit_country($id)
    {
        $tourCountry = TourCountry::where('id', $id)->first();
        return $tourCountry;
    }
    //  below function is for front end,,, tours list searching
    public function tour_country_tours_list($country_id)
    {
        return view('app', compact('country_id'));
    }
    public function get_tour_country_tours_details($country_id)
    {
        $country = Country::where('id', $country_id)->first();
        $country_name = $country->name;

        $tour_country_details = TourCountry::where('country', $country_id)->first();

        if ($tour_country_details->image) {

            $uploaded_image = Upload::where('id', $tour_country_details->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $tour_country_details->image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($tour_country_details->banner) {
            $uploaded_banner = Upload::where('id', $tour_country_details->banner)->first();
            if ($uploaded_banner && $uploaded_banner->file_name) {
                $tour_country_details->banner = get_storage_url($uploaded_banner->file_name);
            }
        }

        return ['country_name' => $country_name, 'tour_country_details' => $tour_country_details];
    }
    public function get_tour_country_tours_list($country_id)
    {
        $tours = Tour::where('country', $country_id)->get();
        foreach ($tours as $tour) {
            $uploaded_image = Upload::where('id', $tour->image)->first();
            if ($uploaded_image) {
                $tour->image = get_storage_url($uploaded_image->file_name);
            }
            $currentDate = now();
            $minPriceRecord = TourCalendar::where('tour_id', $tour->id)
                ->where('end_date', '>', $currentDate) // Filter records where end_date is after the current date
                ->orderBy('price')
                ->first();
            if ($minPriceRecord) {
                if ($minPriceRecord->start_date <= $currentDate) {
                    // Calculate the days after the current date
                    $startDate = $currentDate->copy()->addDay(); // Start from the day after the current date
                    $endDate = $minPriceRecord->end_date;

                    $daysAfterCurrentDate = $startDate->diffInDays($endDate);
                } else {
                    // Count the days between start and end date

                    $startDate = Carbon::parse($minPriceRecord->start_date);
                    $endDate = Carbon::parse($minPriceRecord->end_date);

                    $daysAfterCurrentDate = $startDate->diffInDays($endDate);
                }
                // Assign the calculated days to the $tour->days property
                $tour->days = $daysAfterCurrentDate;
            }

            if ($minPriceRecord) {
                // Attach the minimum price record to the tour object
                $tour->minimum_price = $minPriceRecord->price;
                $tour->discounted_price = $minPriceRecord->discounted_price;
            }
        }

        return $tours;
    }

    public function get_tour_destinations()
    {
        // Get the list of country IDs associated with tours
        $country_tours = Tour::pluck('country');

        // Retrieve tour countries for the list of country IDs
        $tourCountries = TourCountry::whereIn('country', $country_tours)->get();

        // Loop through each tour country
        foreach ($tourCountries as $tc) {
            // Get the country details
            $country = Country::where('id', $tc->country)->first();

            // Count the number of tours for the country
            $tours_count = Tour::where('country', $tc->country)->count();

            // Assign the country name and tour count to the tour country object
            $tc->country_id = $tc->country;
            $tc->country = $country->name;
            $tc->tours_count = $tours_count;

            // Process the uploaded image
            $uploaded_image = Upload::where('id', $tc->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $tc->image = get_storage_url($uploaded_image->file_name);
            }
        }
        return $tourCountries;
    }

    // faqs
    public function country_faq_save(Request $request)
    {
        $request->validate([
            'question' => 'required|String',
            'answer' => 'required|String',
        ]);

        if ($request->record_id) {
            $countryFaq = CountryFaq::where('id', $request->record_id)->first();
        } else {

            $countryFaq = new CountryFaq;
            $countryFaq->id = Str::orderedUuid();
        }
        $countryFaq->question = $request->question;
        $countryFaq->answer = $request->answer;
        $country_country = TourCountry::where('id', $request->tour_country_id)->first();
        $countryFaq->tour_country_id = $country_country->country;

        // Save the model
        $countryFaq->save();
    }
    public function fetch_country_faqs($tour_country_id)
    {
        $country_country = TourCountry::where('id', $tour_country_id)->first();
        $countryFaq = CountryFaq::where('tour_country_id', $country_country->country)->get();

        return $countryFaq;
    }
    public function country_faq_delete($id)
    {
        CountryFaq::where('id', $id)->delete();
    }
    public function country_faq_edit($id)
    {
        $countryFaq = CountryFaq::where('id', $id)->first();
        return $countryFaq;
    }

    // front extarnal website
    public function external_website_fetch_country_faqs($country_id)
    {
        $countryFaq = CountryFaq::where('tour_country_id', $country_id)->get();

        return $countryFaq;
    }

}
