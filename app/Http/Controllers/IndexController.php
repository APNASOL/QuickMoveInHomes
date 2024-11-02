<?php

namespace App\Http\Controllers;

use App\Models\Community;
use App\Models\Event;
use App\Models\Incentive;
use App\Models\Property;
use App\Models\PropertyIncentive;
use App\Models\QuickMoveHome;
use App\Models\Upload;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function front_homes($type)
    {
        if ($type == 'all') {
            // Get all homes
            $homes = QuickMoveHome::all()->filter(function ($home) {
                $property = Property::first();
                return $property && $property->is_open_house;
            });
        } else if ($type == 'open_houses') {
            // Get homes where the related property's is_open_house field is true
            $homes = QuickMoveHome::all()->filter(function ($home) {
                $property = Property::where('property_id', $home->property_id)->first();
                return $property && $property->is_open_house == 'true';
            });

        }

        foreach ($homes as $home) {
            // Fetch related property record
            $property = Property::where('property_id', $home->property_id)->first();
            $home->property_record = $property;

            // Process main image
            if ($home->main_image) {
                $uploaded_image = Upload::find($home->main_image);

                if ($uploaded_image) {
                    $home->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $homes;
    }

    public function communities(Request $request)
    {
        // Start the query on the communities table
        $communities = DB::table('communities');

        // Apply filter based on the request if a name is provided
        if ($request->name !== null && $request->name !== "null") {
            $communities->where(function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            });
        }

        // Retrieve all communities
        $communities = $communities->get(); // Use ->get() instead of ->all()

        // Loop through each community
        foreach ($communities as $community) {

            $community->homes_count = Property::where('community_id', $community->id)->count();

            // Handle the main image
            if ($community && $community->main_image) {
                $uploaded_image = Upload::where('id', $community->main_image)->first();
                if ($uploaded_image && $uploaded_image->file_name) {
                    $community->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $communities;
    }

    public function all_events()
    {
        $currentDate = Carbon::now();
        $events = Event::where('date', '>', $currentDate)->get();
        foreach($events as $event)
        {
            if ($event->image) {
                $uploaded_image = Upload::where('id', $event->image)->first();
                if ($uploaded_image) {
                    $event->image = get_storage_url($uploaded_image->file_name);
                }
            } else {
                $event->image = get_storage_url('');
            }
        }
        return  $events;
    }
    public function incentives_list()
    {

        return Incentive::where('status', 1)->get();
    }
    public function incentive_details($id)
    {
        return view('app', compact('id'));
    }
    public function incentives_properties()
    {
        // Fetch all properties
        $properties = Property::all();

        // Initialize an empty array to store properties with valid incentives
        $properties_with_incentives = [];

        foreach ($properties as $property) {
            // Initialize variable to store total 'interest_rate_first_year' (percentage) value
            $total_incentives_percentage = 0;
            $current_date = now();

            // Fetch related incentives for the property
            $incentives_ids = PropertyIncentive::where('property_id', $property->property_id)
                ->pluck('incentive_id');
            $incentives = Incentive::whereIn('id', $incentives_ids)->get();

            // Initialize an empty array to hold valid incentives
            $valid_incentives = [];

            foreach ($incentives as $incentive) {
                // Check if current date is within the start_date and end_date range
                if ($current_date->between($incentive->start_date, $incentive->end_date)) {
                    // Add the 'interest_rate_first_year' percentage to the total incentives percentage
                    $total_incentives_percentage += $incentive->interest_rate_first_year;

                    // Add the incentive record to the valid incentives array
                    $valid_incentives[] = $incentive;
                }
            }

            // If there are valid incentives, process the property further
            if (count($valid_incentives) > 0) {
                // Calculate the new price after applying the total incentives percentage
                if ($property->price) {
                    $original_price = $property->price;

                    // Apply the incentive percentage: (Price - (Price * (Percentage / 100)))
                    $discount = $original_price * ($total_incentives_percentage / 100);
                    $new_price_after_incentive = $original_price - $discount;

                    // Store the new price in the property object
                    $property->new_price_after_incentive = $new_price_after_incentive;
                }

                // Store valid incentives in the property object
                $property->valid_incentives = $valid_incentives;

                // Process main image (if applicable)
                $home = QuickMoveHome::where('property_id', $property->property_id)->first();
                if ($home->main_image) {
                    $uploaded_image = Upload::find($home->main_image);
                    if ($uploaded_image) {
                        $property->main_image = get_storage_url($uploaded_image->file_name);
                    }
                }

                // Add the property with valid incentives to the result array
                $properties_with_incentives[] = $property;
            }
        }

        // Return the properties with their details and valid incentives
        return $properties_with_incentives; // Correct return value
    }
    public function selected_incentives_properties($id)
    {

        $incentive = Incentive::where('id', $id)->first();
        $property_ids = PropertyIncentive::where('incentive_id', $id)
            ->pluck('property_id');

        // Fetch all properties
        $properties = Property::whereIn('property_id', $property_ids)->get();

        // Initialize an empty array to store properties with valid incentives
        $properties_with_incentives = [];

        foreach ($properties as $property) {

            // Initialize variable to store total 'interest_rate_first_year' (percentage) value
            $total_incentives_percentage = 0;
            $current_date = now();

            // Fetch related incentives for the property
            $incentives_ids = PropertyIncentive::where('property_id', $property->property_id)
                ->pluck('incentive_id');
            $incentives = Incentive::whereIn('id', $incentives_ids)->get();

            // Initialize an empty array to hold valid incentives
            $valid_incentives = [];

            foreach ($incentives as $incentive) {
                // Check if current date is within the start_date and end_date range
                if ($current_date->between($incentive->start_date, $incentive->end_date)) {
                    // Add the 'interest_rate_first_year' percentage to the total incentives percentage
                    $total_incentives_percentage += $incentive->interest_rate_first_year;

                    // Add the incentive record to the valid incentives array
                    $valid_incentives[] = $incentive;
                }
            }

            // If there are valid incentives, process the property further
            if (count($valid_incentives) > 0) {
                // Calculate the new price after applying the total incentives percentage
                if ($property->price) {
                    $original_price = $property->price;

                    // Apply the incentive percentage: (Price - (Price * (Percentage / 100)))
                    $discount = $original_price * ($total_incentives_percentage / 100);
                    $new_price_after_incentive = $original_price - $discount;

                    // Store the new price in the property object
                    $property->new_price_after_incentive = $new_price_after_incentive;
                }

                // Store valid incentives in the property object
                $property->valid_incentives = $valid_incentives;

                // Process main image (if applicable)
                $home = QuickMoveHome::where('property_id', $property->property_id)->first();
                if ($home->main_image) {
                    $uploaded_image = Upload::find($home->main_image);
                    if ($uploaded_image) {
                        $property->main_image = get_storage_url($uploaded_image->file_name);
                    }
                }

                // Add the property with valid incentives to the result array
                $properties_with_incentives[] = $property;
            }
        }

        // Return the properties with their details and valid incentives
        return ['properties_with_incentives' => $properties_with_incentives, 'incentive_title' => $incentive->title]; // Correct return value
    }

    public function communities_for_navbar()
    {
        // Fetch all communities
        $communities = Community::all();

        // Return as JSON response
        return response()->json($communities);
    }

    public function openhouses_for_navbar()
    {
        // Fetch properties where 'is_open_house' is true
        $properties = Property::where('is_open_house', 'true')->orWhere('is_open_house', true)->get();

        return $properties;
    }
}
