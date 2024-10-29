<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Tour;
use App\Models\TourCalendar;
use App\Models\CustomPage;
use App\Models\Upload;
use App\Models\CountryFaq;
use App\Models\CustomPageTours;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;

class CustomPagesController extends Controller
{

    public function index()
    {
        $name = 'custom page';
        return view('app', compact('name'));
    }
    public function create()
    {
        $name = 'custom page';
        return view('app', compact('name'));
    }
 
    // public function create($tour_country_id)
    // {

    //     return view('app', compact('tour_country_id'));
    // }

    public function custom_page_store(Request $request)
    { 
        $request->validate([
             
            'tours' => 'required', 
            'title' => 'required|unique:custom_pages,title,' . $request->custom_page_id,
            'banner' => 'nullable',
            'description_details' => 'required',
            'image' => 'nullable',
        ]);

 
        if ($request->custom_page_id) {
            $CustomPage = CustomPage::where('id', $request->custom_page_id)->first();
        } else {
            $CustomPage = new CustomPage;
            $CustomPage->id = Str::orderedUuid();
        }
    
        if ($request->tours) {
            CustomPageTours::where('custom_page_id', $CustomPage->id)->delete();

            $tours = $request->tours;
 
            foreach ($tours as $tour) {
                
                $custom_page_tours = new CustomPageTours;
                $custom_page_tours->id = Str::orderedUuid();
                $custom_page_tours->custom_page_id = $CustomPage->id;
                $custom_page_tours->tour_id = $tour;
                
                $custom_page_tours->save();
            }
        }
        $CustomPage->title = $request->title;
        $CustomPage->description_details = $request->description_details;

        if ($request->banner) {
            $existingInUploads = Upload::where('id', $CustomPage->banner)->first();
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
            $CustomPage->banner = $Upload->id;
        }

        if ($request->image) {
            $existingInUploads = Upload::where('id', $CustomPage->image)->first();
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
            $CustomPage->image = $Upload->id;
        }

        $CustomPage->save();
        return $CustomPage->id;

    }
 

    public function fetch_custom_pages(Request $request)
    {
        $custom_pages = CustomPage::paginate(15);
        foreach ($custom_pages as $custom_page) {

            $tours = CustomPageTours::where('custom_page_id', $custom_page->id)->get();
              
            foreach ($tours as &$tour) {  
                $tourObject = Tour::where('id', $tour->tour_id)->first();
                $tour->tour_name = $tourObject->title;   
            }
            
            
            $custom_page->tours_records = $tours;
            $uploaded_image = Upload::where('id', $custom_page->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $custom_page->image = get_storage_url($uploaded_image->file_name);
            }
            $uploaded_banner = Upload::where('id', $custom_page->banner)->first();
            if ($uploaded_banner && $uploaded_banner->file_name) {
                $custom_page->banner = get_storage_url($uploaded_banner->file_name);
            }
        }
        return $custom_pages;
    }

    public function fetch_tour_countries_details(Request $request)
    {
        $tours_countries = CustomPage::paginate(15);
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
    public function custom_page_delete($id)
    {
        $customPage = CustomPage::findOrFail($id);
        CustomPageTours::where('custom_page_id', $customPage->id)->delete();
        $uploaded_image = Upload::where('id', $customPage->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            Storage::delete($uploaded_image->file_name);
            $uploaded_image->delete();
        }
        $uploaded_banner = Upload::where('id', $customPage->banner)->first();
        if ($uploaded_banner && $uploaded_banner->file_name) {
            Storage::delete($uploaded_banner->file_name);
            $uploaded_banner->delete();
        }
        $customPage->delete();
        return 'success';
    }
    public function edit($id)
    {
        return view('app', compact('id'));
    }
    public function get_custom_page($id)
    {
        $custom_page = CustomPage::findOrFail($id);
        $tour_ids = CustomPageTours::where('custom_page_id', $custom_page->id)->pluck('tour_id');
        $custom_page->tours = $tour_ids;
            
        $uploaded_image = Upload::where('id', $custom_page->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {

            $custom_page->image = get_storage_url($uploaded_image->file_name);

        }
        $uploaded_banner = Upload::where('id', $custom_page->banner)->first();
        if ($uploaded_banner && $uploaded_banner->file_name) {

            $custom_page->banner = get_storage_url($uploaded_banner->file_name);

        }
        return $custom_page;
    }

    public function details($id)
    {
        return view('app', compact('id'));
    }
    public function details_fetch($id)
    {
        $custom_page = CustomPage::where('id',$id)->first();
         
        $tours = CustomPageTours::where('custom_page_id', $custom_page->id)->get();
              
        foreach ($tours as &$tour) {  
            $tourObject = Tour::where('id', $tour->tour_id)->first();
            $tour->tour_name = $tourObject->title;   
        }
        
        
        $custom_page->tours_records = $tours;
        $uploaded_image = Upload::where('id', $custom_page->image)->first();
        if ($uploaded_image && $uploaded_image->file_name) {
            $custom_page->image = get_storage_url($uploaded_image->file_name);
        }
        $uploaded_banner = Upload::where('id', $custom_page->banner)->first();
        if ($uploaded_banner && $uploaded_banner->file_name) {
            $custom_page->banner = get_storage_url($uploaded_banner->file_name);
        }
        return $custom_page;
    }


    // external website
     
    
    public function get_custom_pages()
    {
        $custom_pages = CustomPage::all();
        foreach ($custom_pages as $custom_page) {

            $tours = CustomPageTours::where('custom_page_id', $custom_page->id)->count();
            $custom_page->tours_count =  $tours;
             
            $uploaded_image = Upload::where('id', $custom_page->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $custom_page->image = get_storage_url($uploaded_image->file_name);
            }
             
        }
        return $custom_pages;
    }

    public function custom_page_details($name)
    { 
        return view('app', compact('name'));
    }
    public function get_custom_page_details($name)
    { 
        
        $custom_page = CustomPage::where('title',$name)->first();
          
        if ($custom_page->image) {

            $uploaded_image = Upload::where('id', $custom_page->image)->first();
            if ($uploaded_image && $uploaded_image->file_name) {
                $custom_page->image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($custom_page->banner) {
            $uploaded_banner = Upload::where('id', $custom_page->banner)->first();
            if ($uploaded_banner && $uploaded_banner->file_name) {
                $custom_page->banner = get_storage_url($uploaded_banner->file_name);
            }
        }
 
        return $custom_page;
    }
     
    public function get_custom_page_details_tours($name)
    { 
        
        $custom_page = CustomPage::where('title',$name)->first();
        $custom_page_id = $custom_page->id;
        $tour_ids = CustomPageTours::where('custom_page_id', $custom_page->id)->pluck('tour_id');
        $tours = Tour::whereIn('id', $tour_ids)->get();
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

}