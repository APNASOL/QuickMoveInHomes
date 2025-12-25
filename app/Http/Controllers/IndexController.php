<?php
namespace App\Http\Controllers;

use App\Models\Builder;
use App\Models\Community;
use App\Models\Event;
use App\Models\Incentive;
use App\Models\OpenHouse;
use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\PropertyIncentive;
use App\Models\Upload;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;

class IndexController extends Controller
{

    public function front_homes($type)
    {
        if ($type == 'all') {
            // Get all properties
            $properties = Property::latest()->limit(10)->get();
        } else if ($type == 'open_houses') {
            // Get properties where is_open_house is true
            $properties = Property::where('is_open_house', true)->orWhere('is_open_house', 1)->latest()->limit(10)->get();
        }

        foreach ($properties as $property) {

            $property->main_image = null;
            // $property->bathrooms  = $property->half_bath + $property->full_bath;
            $full = (int) filter_var($property->full_bath, FILTER_SANITIZE_NUMBER_INT);
            $half = (int) filter_var($property->half_bath, FILTER_SANITIZE_NUMBER_INT);
            $property->bathrooms = $full + $half;


            $images = json_decode($property->images);
            if ($images) {
                $uploads     = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();

                if ($firstUpload) {
                    $file_image           = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);
                } else {
                    $property->main_image = '/images/default_image.png';
                }
            }

            $propertyFeature             = PropertyFeature::where('property_id', $property->property_id)->select('parking_enclosure')->first();
            $property->parking_enclosure = $propertyFeature->parking_enclosure ?? 0;

            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if ($PropertyIncentive) {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }

        }

        return $properties;
    }

    public function communities(Request $request)
    {
        $communities = DB::table('communities')
            ->when($request->name !== null && $request->name !== "null", function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->name . '%');
            })
            ->whereExists(function ($query) {
                $query->select(DB::raw(1))
                    ->from('properties')
                    ->whereRaw('properties.community_id = communities.community_id');
            })
            ->latest('id')
            ->take(3)
            ->get()
            ->shuffle();

        foreach ($communities as $community) {
            $community->homes_count = Property::where('community_id', $community->community_id)->count();

            if ($community->main_image) {
                $uploaded_image = Upload::find($community->main_image);
                if ($uploaded_image) {
                    $community->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $communities;
    }

    public function all_communities(Request $request)
    {
        // Start the query on the communities table
        $communities = DB::table('communities');

        // Apply filter based on the request if a name is provided
        if ($request->name !== null && $request->name !== "null") {
            $communities->where('name', 'LIKE', '%' . $request->name . '%');
        }

        // Retrieve the last 3 communities randomly
        $communities = $communities->latest('id')->get()->shuffle();

        // Loop through each community
        foreach ($communities as $community) {
            $community->homes_count = Property::where('community_id', $community->community_id)->count();

            // Handle the main image
            if ($community->main_image) {
                $uploaded_image = Upload::find($community->main_image);
                if ($uploaded_image) {
                    $community->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $communities;
    }

    public function all_open_houses(Request $request)
    {
        // Get the current date and time
        $currentDate = now();
        $currentTime = $currentDate->format('H:i:s');

        // Fetch properties where 'is_open_house' is true
        $properties = Property::where('is_open_house', 'true')
            ->orWhere('is_open_house', true)
            ->get();

        // Filter properties based on open house availability
        $filteredProperties = $properties->reject(function ($property) use ($currentDate, $currentTime) {
            $open_house_record = OpenHouse::where('property_id', $property->property_id)->first();

            if (! $open_house_record) {
                return true; // Exclude if no open house record
            }

            if ($open_house_record->date > $currentDate->toDateString()) {
                return false; // Include if future date
            } elseif ($open_house_record->date == $currentDate->toDateString()) {
                if ($open_house_record->end_time >= $currentTime) {
                    return false; // Include if today and time valid
                }
            }

            // Otherwise, mark property and delete open house
            $property->update(['is_open_house' => false]);
            $open_house_record->delete();

            return true; // Exclude from final list
        });

        // Add main_image to each property
        $filteredProperties->map(function ($property) {
            $images = json_decode($property->images);

            if ($property->main_image) {
                $uploaded_image = Upload::find($property->main_image);
                if ($uploaded_image) {
                    $property->main_image = get_storage_url($uploaded_image->file_name);
                }
            }

            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if ($PropertyIncentive) {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }


            return $property;
        });

        return $filteredProperties->values(); // reindex the collection before returning
    }

    public function all_events()
    {
        $events = Event::orderBy('date', 'asc')->get();

        foreach ($events as $event) {
            if ($event->image) {
                $uploaded_image = Upload::find($event->image);
                if ($uploaded_image) {
                    $event->image = get_storage_url($uploaded_image->file_name);
                }
            } else {
                $event->image = get_storage_url('');
            }
        }

        return $events;
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
            $current_date                = now();

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
                    $discount                  = $original_price * ($total_incentives_percentage / 100);
                    $new_price_after_incentive = $original_price - $discount;

                    // Store the new price in the property object
                    $property->new_price_after_incentive = $new_price_after_incentive;
                }

                // Store valid incentives in the property object
                $property->valid_incentives = $valid_incentives;

                // Process main image (if applicable)
                if ($property->main_image) {
                    $uploaded_image = Upload::find($property->main_image);
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

    public function fetch_incentives()
    {

        $incentives = Incentive::orderBy('created_at', 'desc')->where('status', 1)->get();

        foreach ($incentives as $incentive) {

            // Fetch and set builder name
            $builder = Builder::where('id', $incentive->builder_id)->first();
            if ($builder) {
                $incentive->builder_name = $builder->name;
            }

            // Format incentive_banner image URL
            if ($incentive && $incentive->incentive_banner) {
                $uploaded_image = Upload::where('id', $incentive->incentive_banner)->first();
                if ($uploaded_image) {
                    $incentive->incentive_banner = get_storage_url($uploaded_image->file_name);
                }
            }

            // Format created_at and updated_at dates
            $incentive->created_at = Carbon::parse($incentive->created_at)->format('d-m-Y');
            $incentive->updated_at = Carbon::parse($incentive->updated_at)->format('d-m-Y');
        }

        return $incentives;

    }
    public function fetch_sorted_incentives($sort_by)
    {

        $currentDate = now()->format('Y-m-d');

        // Initialize the query
        $query = Incentive::where('status', 1)
            ->where('end_date', '>=', $currentDate); // Filter out past incentives

        // Apply sorting based on the $sort_by parameter
        if ($sort_by === 'Name') {
            $query->orderBy('title', 'asc'); // Sort by title in ascending order
        } elseif ($sort_by === 'Interest rate') {
            $query->orderBy('interest_rate_first_year', 'asc'); // Low to High
        } elseif ($sort_by === 'Low to Hight') {
            $query->orderBy('interest_rate_first_year', 'asc'); // Low to High
        } elseif ($sort_by === 'Hight to Low') {
            $query->orderBy('interest_rate_first_year', 'desc'); // High to Low
        } else {
            // Default sorting (latest first) if the sort_by parameter is invalid
            $query->orderBy('created_at', 'desc');
        }

        // Execute the query and get the results
        $incentives = $query->get();

        foreach ($incentives as $incentive) {
            // Fetch and set builder name
            $builder = Builder::where('id', $incentive->builder_id)->first();
            if ($builder) {
                $incentive->builder_name = $builder->name;
            }

            // Format incentive_banner image URL
            if ($incentive && $incentive->incentive_banner) {
                $uploaded_image = Upload::where('id', $incentive->incentive_banner)->first();
                if ($uploaded_image) {
                    $incentive->incentive_banner = get_storage_url($uploaded_image->file_name);
                }
            }

            // Format created_at and updated_at dates
            $incentive->created_at = Carbon::parse($incentive->created_at)->format('d-m-Y');
            $incentive->updated_at = Carbon::parse($incentive->updated_at)->format('d-m-Y');
        }

        return $incentives;
    }
    public function detailed_incentive($id)
    {
        return view('app', compact('id'));
    }
    public function selected_incentives_properties($id)
    {

        $incentive        = Incentive::where('id', $id)->first();
        $incentive_banner = '';
        // Format incentive_banner image URL
        if ($incentive && $incentive->incentive_banner) {
            $uploaded_image = Upload::where('id', $incentive->incentive_banner)->first();
            if ($uploaded_image) {
                $incentive_banner = get_storage_url($uploaded_image->file_name);
            }
        }

        $property_ids = PropertyIncentive::where('incentive_id', $id)
            ->pluck('property_id');

        // Fetch all properties
        $properties = Property::whereIn('property_id', $property_ids)->get();

        // Initialize an empty array to store properties with valid incentives
        $properties_with_incentives = [];

        foreach ($properties as $property) {

            // Initialize variable to store total 'interest_rate_first_year' (percentage) value
            $total_incentives_percentage = 0;
            $current_date                = now();

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
                    $discount                  = $original_price * ($total_incentives_percentage / 100);
                    $new_price_after_incentive = $original_price - $discount;

                    // Store the new price in the property object
                    $property->new_price_after_incentive = $new_price_after_incentive;
                }

                // Store valid incentives in the property object
                $property->valid_incentives = $valid_incentives;

                // Process main image (if applicable)
                if ($property->main_image) {
                    $uploaded_image = Upload::find($property->main_image);
                    if ($uploaded_image) {
                        $property->main_image = get_storage_url($uploaded_image->file_name);
                    }
                }

                // Add the property with valid incentives to the result array
                $properties_with_incentives[] = $property;
            }
        }

                                                                                                                                                  // Return the properties with their details and valid incentives
        return ['properties_with_incentives' => $properties_with_incentives, 'incentive' => $incentive, 'incentive_banner' => $incentive_banner]; // Correct return value
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
        // Get the current date and time
        $currentDate = now();
        $currentTime = $currentDate->format('H:i:s');

        // Fetch properties where 'is_open_house' is true
        $properties = Property::where('is_open_house', 'true')
            ->orWhere('is_open_house', true)
            ->get();

        // Filter properties based on open house availability
        $filteredProperties = $properties->reject(function ($property) use ($currentDate, $currentTime) {
            // Fetch the open house record for the property
            $open_house_record = OpenHouse::where('property_id', $property->property_id)->first();

            // Check if open house record exists
            if (! $open_house_record) {
                return true; // Exclude if no open house record
            }

            // Check if the open house date is in the future or if it is today and the current time is within the open house hours
            if ($open_house_record->date > $currentDate->toDateString()) {
                return false; // Include property if the open house date is in the future
            } elseif ($open_house_record->date == $currentDate->toDateString()) {
                // If the open house is today, ensure the current time is within the start and end times
                if ($open_house_record->end_time >= $currentTime) {
                    return false; // Include property if within today's open house hours
                }
            }

            // If conditions are not met, update the property and delete the open house record
            $property->update(['is_open_house' => false]);
            $open_house_record->delete();

            return true; // Exclude property from the final result
        });

        return $filteredProperties;
    }

    public function check_incentives()
    {
        $currentDate = now()->format('Y-m-d');

        // Fetch all active incentives that have not expired
        $incentives = Incentive::where('status', 1)
            ->where('end_date', '>=', $currentDate)
            ->get();

        // Check if any incentives were found
        if ($incentives->isNotEmpty()) {
            return 1;
        } else {
            return 0;
        }
    }

}
