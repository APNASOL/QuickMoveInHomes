<?php
namespace App\Http\Controllers;

use App\Models\Agent;
use App\Models\Amenity;
use App\Models\Builder;
use App\Models\BuildersCommunity;
use App\Models\Community;
use App\Models\CommunityAmenity;
use App\Models\CommunityLasVegasRegion;
use App\Models\CommunityNeighborhood;
use App\Models\Contact;
use App\Models\CustomerAgentConnection;
use App\Models\CustomerVisitingHomesHistory;
use App\Models\HOA;
use App\Models\Incentive;
use App\Models\PropertyIncentive;
use App\Models\LasVegasRegion;
use App\Models\Neighborhood;
use App\Models\OpenHouse;
use App\Models\Property;
use App\Models\QuickMoveHome;
use App\Models\Upload;
use App\Models\User;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Models\PropertyFeature;

class HomeController extends Controller
{

    public function visit_all_homes()
    {
        return view('app');
    }
    public function search_homes()
    {
        return view('app');
    }

    public function contact_us()
    {
        return view('app');
    }
    public function blogs()
    {
        return view('app');
    }

    public function contact_store(Request $request)
    {
        $request->validate([
            'name'    => 'required|string|max:255',
            'email'   => 'required',
            'phone'   => 'required',
            'message' => 'required',
        ]);

        $contact                 = new Contact;
        $contact->id             = Str::orderedUuid();
        $contact->name           = $request->name;
        $contact->email          = $request->email;
        $contact->phone          = $request->phone;
        $contact->message        = $request->message;
        $contact->contacted_from = $request->contacted_from;
        $contact->save();
        return 'success';
    }

    public function countries_pluck()
    {
        $country = Country::pluck('name', 'id');
        return $country;
    }

    public function home_details($id)
    {

        return view('app', compact('id'));
    }

    public function getPropertyDetails($id)
    {

        $currentDate = now()->format('Y-m-d');
        // Fetch the property along with its relationships

        $property = Property::with(['feature', 'hoa', 'school'])->findOrFail($id);


        $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->get();
        if($PropertyIncentive)
        { 
            $property_incentive_status = 1;
            foreach($PropertyIncentive as $incentive)
            {
                $incentive_record = Incentive::where('id', $incentive->incentive_id)->select('id','title')->first();
              
                $incentive->incentive = $incentive_record;
            }
            
            
        }


        // Initialize variables
        $property_main_image = null;
        $openHouseData       = [];

        $new_price_after_incentive   = null;
        $total_incentives_percentage = 0;
        $current_date                = now();

        $images = json_decode($property->images);
        if (is_array($images) && count($images) > 0) {
            $uploads     = Upload::whereIn('id', $images)->get();
            $firstUpload = $uploads->first();
            $lastUpload  = $uploads->last();

            // Check if the first upload exists, then assign its file_name to the property
            if ($firstUpload) {
                $file_image          = $firstUpload->file_name;
                $property_main_image = get_storage_url($file_image);

            }
            if ($lastUpload) {
                $file_image      = $lastUpload->file_name;
                $property_banner = get_storage_url($file_image);
            }
        }
        // $uploads = Upload::whereIn('id', $images)->get();
        // $firstUpload = $uploads->first();
        // $lastUpload = $uploads->last();

        // // Check if the first upload exists, then assign its file_name to the property
        // if ($firstUpload) {
        //     $file_image = $firstUpload->file_name;
        //     $property_main_image = get_storage_url($file_image);

        // }
        // if ($lastUpload) {
        //     $file_image = $lastUpload->file_name;
        //     $property_banner = get_storage_url($file_image);
        // }

        // Fetch Open House details if the property is marked as an open house
        if ($property->is_open_house) {
            $openHouse = OpenHouse::where('property_id', $id)->first();

            if ($openHouse) {
                // Get the current date and time
                $currentDateTime = now();

                // Combine date and time to create full datetime strings for comparison
                $openHouseStartDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $openHouse->date . ' ' . $openHouse->start_time);
                $openHouseEndDateTime   = Carbon::createFromFormat('Y-m-d H:i:s', $openHouse->date . ' ' . $openHouse->end_time);

                // Check if the open house end time has expired
                if ($currentDateTime->greaterThan($openHouseEndDateTime)) {
                    $property->update(['is_open_house' => false]); // Set is_open_house to false
                    $openHouse->delete();                          // Delete the expired open house record
                } else {
                    // Prepare the valid open house data
                    $openHouseData = [
                        'open_house_date'        => $openHouse->date,
                        'open_house_start_time'  => $openHouse->start_time,
                        'open_house_end_time'    => $openHouse->end_time,
                        'open_house_description' => $openHouse->description,
                    ];
                }
            }
        }

        // Fetch community details
        $community = Community::find($property->community_id);
        if ($community && $community->main_image) {
            $community_upload = Upload::find($community->main_image);
            if ($community_upload) {
                $community->main_image = get_storage_url($community_upload->file_name);
            }
        }
        if ($community && $community->banner) {
            $community_upload = Upload::find($community->banner);
            if ($community_upload) {
                $community->banner = get_storage_url($community_upload->file_name);
            }
        }
        if ($community) {

            $community_builder = BuildersCommunity::where('community_id', $community->id)->first();
            if ($community_builder) {
                $builder = Builder::where('id', $community_builder->builder_id)->first();
                // if ($builder) {
                //     $incentive = Incentive::where('builder_id', $builder->id)->where('end_date', '>=', $currentDate)->first();
                // }
            }
        }
        // Prepare property data
        $propertyData = [
            'id'                  => $property->id,
            'title'               => $property->title,
            'is_open_house'       => $property->is_open_house,
            'description'         => $property->description,
            'average_price_per_square'         => $property->average_price_per_square,
            'address'             => $property->address,
            'city'                => $property->city,
            'state'               => $property->state,
            'zip_code'            => $property->zip_code,
            'price'               => $property->price,
            'price_from'          => $property->price_from,
            'price_to'            => $property->price_to,
            'full_bath'           => $property->full_bath,
            'half_bath'           => $property->half_bath,
            'construction_status' => $property->construction_status,
            'incentive' => $property_incentive_status ?? "",
            'property_incentives' =>$PropertyIncentive ?? "",
            'bedrooms'            => $property->bedrooms,
            'square_feet'         => $property->square_feet,
            'lot_size'            => $property->lot_size,
            'property_type'       => $property->property_type,
            'listing_type'        => $property->listing_type,
            'year_built'          => $property->year_built,
            'community_id'        => $property->community_id,
            'community_name'      => $community->name ?? "",
            'longitude'           => $property->longitude ?? "",
            'latitude'            => $property->latitude ?? "",
            'property_main_image' => $property_main_image ?? "",
            'property_banner'     => $property_banner ?? "",
            'hoa_name'            => optional($property->hoa)->name,
            'association_fee'     => $property->association_fee,
            'school_name'         => optional($property->school)->name,
            'feature'             => [
                'fireplace_type'        => optional($property->feature)->fireplace_type,
                'kitchen_pantry_type'   => optional($property->feature)->kitchen_pantry_type,
                'reach_in'              => optional($property->feature)->reach_in,
                'walk_in'               => optional($property->feature)->walk_in,
                'laundry_closet'        => optional($property->feature)->laundry_closet,
                'closet_location'       => optional($property->feature)->closet_location,
                'bedroom_location'      => optional($property->feature)->bedroom_location,
                'bathroom_type'         => optional($property->feature)->bathroom_type,
                'bathroom_status'       => optional($property->feature)->bathroom_status,
                'pool_shape'            => optional($property->feature)->pool_shape,
                'water_features'        => optional($property->feature)->water_features,
                'pool_status'           => optional($property->feature)->pool_status,
                'spa'                   => optional($property->feature)->spa,
                'fencing_material'      => optional($property->feature)->fencing_material,
                'fencing_status'        => optional($property->feature)->fencing_status,
                'parking_enclosure'     => optional($property->feature)->parking_enclosure,
                'private_bath'          => optional($property->feature)->private_bath,
                'outdoor_shower'        => optional($property->feature)->outdoor_shower,
                'landscape_maintenance' => optional($property->feature)->landscape_maintenance,
                'foundation_conditions' => optional($property->feature)->foundation_conditions,
            ],
            // 'incentive'           => $incentive ?? '',
        ];

        // Merge the open house data into property data if available
        if (! empty($openHouseData)) {
            $propertyData = array_merge($propertyData, $openHouseData);
        }

                                     // Process additional files
        $propertyData['files'] = []; // Initialize files array
        if ($property->images) {
            $uploads = Upload::whereIn('id', json_decode($property->images))->orderBy('extension')->get(['file_original_name', 'file_name', 'extension', 'type']);
            foreach ($uploads as $upload) {
                $upload->file_name       = get_storage_url($upload->file_name);
                $propertyData['files'][] = $upload;
            }
        }

        if (auth()->check() && auth()->user()->role == 'customer') {
            // Fetch the most recent agreement for the logged-in user
            $agreement = CustomerAgentConnection::where('customer_id', auth()->user()->id)->first();

            if ($agreement) {

                $existing_customer_history_record = CustomerVisitingHomesHistory::where('customer_id', auth()->user()->id)->where('home_id', $id)->first();
                if (! $existing_customer_history_record) {
                    $customer_history              = new CustomerVisitingHomesHistory;
                    $customer_history->id          = Str::orderedUuid();
                    $customer_history->customer_id = auth()->user()->id;
                    $customer_history->home_id     = $id;
                    $customer_history->ip_address  = request()->ip(); // Capture the user's IP address
                    $customer_history->save();
                }
            }
        }

        // Return property, community, and incentives data
        return [
            'property_info'  => $propertyData,
            'community_info' => $community,
            'incentive'      => $incentive ?? '',
        ];
    }

    public function community_all_homes($community_id)
    {
        $properties = Property::where('community_id', $community_id)
            ->inRandomOrder()  // Orders the results randomly
            ->limit(8)->get(); // Limit the results to 8 records

        foreach ($properties as $property) {

            // Check if the property has an open house
            if ($property->is_open_house) {

                $open_house = OpenHouse::where('property_id', $property->property_id)->first();

                if ($open_house) {
                    // Get the current date and time
                    $currentDateTime = now();

                    // Combine date and time for comparison
                    $openHouseEndDateTime = Carbon::createFromFormat('Y-m-d H:i:s', $open_house->date . ' ' . $open_house->end_time);

                    // Check if the open house is expired
                    if ($currentDateTime->greaterThan($openHouseEndDateTime)) {
                        // Expired: Delete the open house record and update the property
                        $open_house->delete();
                        $property->update(['is_open_house' => 0]);
                    } else {
                        // Not expired: Attach the open house data to the property
                        $property->is_open_house = 1;
                    }
                }
            } else {
                $property->open_house_data = 0;
            }
            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if($PropertyIncentive)
            {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }

            $property->banner     = null;
            $property->main_image = null;

            $images = json_decode($property->images);
            if (is_array($images) && count($images) > 0) {
                $uploads     = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();
                $lastUpload  = $uploads->last();

                // Check if the first upload exists, then assign its file_name to the property
                if ($firstUpload) {
                    $file_image           = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);

                }
                if ($lastUpload) {
                    $file_image       = $lastUpload->file_name;
                    $property->banner = get_storage_url($file_image);
                }
            }
            // $uploads = Upload::whereIn('id', $images)->get();
            // $firstUpload = $uploads->first();
            // $lastUpload = $uploads->last();

            // // Check if the first upload exists, then assign its file_name to the property
            // if ($firstUpload) {
            //     $file_image = $firstUpload->file_name;
            //     $property->main_image = get_storage_url($file_image);

            // }
            // if ($lastUpload) {
            //     $file_image = $lastUpload->file_name;
            //     $property->banner = get_storage_url($file_image);
            // }

        }

        return $properties;
    }

    public function detailed_community($community_id)
    {
        return view('app', compact('community_id'));
    }
    public function all_communities()
    {
        $name = 'all-communities';
        return view('app', compact('name'));
    }
    public function all_open_houses()
    {
        $name = 'all-open-houses';
        
        return view('app', compact('name'));
    }
    public function get_community_details($id)
    {
        // Get the community
        $community = Community::find($id);

        $community_builders_ids = BuildersCommunity::where('community_id', $community->id)->pluck('builder_id');

        if ($community_builders_ids) {

            $builders_data = Builder::whereIn('id', $community_builders_ids)->pluck('name', 'description');

            $community->builders = $builders_data;
        }

        if (! $community) {
            return response()->json(['message' => 'Community not found'], 404);
        }
        // Get amenities
        $communityAmenities = CommunityAmenity::where('community_id', $id)->pluck('amenity_id');
        if ($communityAmenities->isNotEmpty()) {
            $community->amenities = Amenity::whereIn('id', $communityAmenities)->pluck('name');
        } else {
            $community->amenities = [];
        }

        if ($community->hoa_id) {

            $communityHoa = HOA::where('id', $community->hoa_id)->first();
            if ($communityHoa) {
                $community->hoa = $communityHoa->name;
            }
        }
        // Get regions
        $communityRegions = CommunityLasVegasRegion::where('community_id', $id)->pluck('las_vegas_regions_id');
        if ($communityRegions->isNotEmpty()) {
            $community->regions = LasVegasRegion::whereIn('id', $communityRegions)->pluck('name');
        } else {
            $community->regions = [];
        }

        // Get neighborhoods
        $communityNeighborhoods = CommunityNeighborhood::where('community_id', $id)->pluck('neighborhood_id');
        if ($communityNeighborhoods->isNotEmpty()) {
            $community->neighborhoods = Neighborhood::whereIn('id', $communityNeighborhoods)->pluck('name');
        } else {
            $community->neighborhoods = [];
        }

        if ($community && $community->main_image) {
            $uploaded_image = Upload::where('id', $community->main_image)->first();

            if ($uploaded_image) {
                $community->main_image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($community && $community->banner) {
            $uploaded_image = Upload::where('id', $community->banner)->first();

            if ($uploaded_image) {
                $community->banner = get_storage_url($uploaded_image->file_name);
            }
        }

        if ($community->files) {

            $uploads          = Upload::whereIn('id', json_decode($community->files))->orderBy('extension')->get(['file_original_name', 'file_name', 'extension', 'type']);
            $more_info_files  = [];
            $more_info_images = [];
            $more_info_videos = [];
            foreach ($uploads as $key => $upload) {
                if (preg_match("/image/", $upload->type)) {
                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_images[]  = $upload;
                } else if (preg_match("/video/", $upload->type)) {

                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_videos[]  = $upload;
                } else {
                    $upload['file_name'] = $upload['file_name'] ? get_storage_url($upload['file_name']) : '';
                    $more_info_files[]   = $upload;
                }

            }

            $community->files = $uploads;

        }

        // Return the community details with related records
        return $community;
    }

    public function sortProperties(Request $request)
    {
        $total_homes = 0;
        $properties  = DB::table('properties'); // Start from properties table

        // Get the sort_by value from the request
        $sort_by = $request->input('sort_by');

        // Sort based on the selected option
        switch ($sort_by) {
            case 'Price (High to Low)':
                $properties = $properties->orderBy('price', 'desc');
                break;
            case 'Price (Low to High)':
                $properties = $properties->orderBy('price', 'asc');
                break;
            case 'Newest':
                $properties = $properties->orderBy('created_at', 'desc');
                break;
            case 'Bedrooms':
                $properties = $properties->orderBy('bedrooms', 'asc');
                break;
            case 'Square Feet':
                $properties = $properties->orderBy('square_feet', 'asc');
                break;
            case 'Lot Size':
                $properties = $properties->orderBy('lot_size', 'asc');
                break;
            case 'Homes for You':
            default:
                // Default sorting by property_id or any other logic for 'Homes for You'
                $properties = $properties->orderBy('property_id', 'asc');
                break;
        }

        // Fetch the sorted properties
        $properties  = $properties->get();
        $total_homes = $properties->count();

        foreach ($properties as $property) {
            $property->banner     = null;
            $property->main_image = null;
    
            $property->bathrooms = $property->half_bath +  $property->full_bath;
            $propertyFeature = PropertyFeature::where('property_id', $property->property_id)->select('parking_enclosure')->first();
            $property->parking_enclosure = $propertyFeature->parking_enclosure ?? 0;
            // Fetch related property record
            if ($property->is_open_house) {
                $open_house                = OpenHouse::where('property_id', $property->property_id)->first();
                $property->open_house_data = $open_house;
            }

            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if($PropertyIncentive)
            {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }
            // Process main image
            $images = json_decode($property->images);
            if (is_array($images) && count($images) > 0) {
                $uploads     = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();
                $lastUpload  = $uploads->last();

                // Check if the first upload exists, then assign its file_name to the property
                if ($firstUpload) {
                    $file_image           = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);

                }
                if ($lastUpload) {
                    $file_image       = $lastUpload->file_name;
                    $property->banner = get_storage_url($file_image);
                }
            }
            // $uploads = Upload::whereIn('id', $images)->get();
            // $firstUpload = $uploads->first();
            // $lastUpload = $uploads->last();

            // // Check if the first upload exists, then assign its file_name to the property
            // if ($firstUpload) {
            //     $file_image = $firstUpload->file_name;
            //     $property->main_image = get_storage_url($file_image);

            // }
            // if ($lastUpload) {
            //     $file_image = $lastUpload->file_name;
            //     $property->banner = get_storage_url($file_image);
            // }

        }

        return ['properties' => $properties, 'total_homes' => $total_homes];
    }

    public function quickSearch(Request $request)
    {
        $currentDate = now()->format('Y-m-d');
        // Validate request
        $request->validate([
            'main_search_field' => 'nullable|string',
            'bathroom'          => 'nullable|integer',
            'bedrooms'          => 'nullable|integer',

            // Only validate max_price if min_price is provided
            'min_price'         => 'nullable|integer|min:0',
            'max_price'         => [
                'nullable',
                'integer',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->min_price && $value && $value <= $request->min_price) {
                        $fail('The max price must be greater than the min price.');
                    }
                },
            ],

            'min_square_feet'   => 'nullable|integer|min:0',
            'max_square_feet'   => [
                'nullable',
                'integer',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->min_square_feet && $value && $value <= $request->min_square_feet) {
                        $fail('The max square feet must be greater than the min square feet.');
                    }
                },
            ],

            'min_lot_size'      => 'nullable|integer|min:0',
            'max_lot_size'      => [
                'nullable',
                'integer',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->min_lot_size && $value && $value <= $request->min_lot_size) {
                        $fail('The max lot size must be greater than the min lot size.');
                    }
                },
            ],
        ]);

        $properties = DB::table('properties')
            ->leftJoin('property_features', 'properties.property_id', '=', 'property_features.property_id'); // Join property_features

        if ($request->main_search_field) {
            $searchTerm = $request->main_search_field;

            // Check if the search term is not null and not the string "null"
            if ($searchTerm !== null && $searchTerm !== "null") {
                $properties->where(function ($query) use ($searchTerm) {
                    $query->where('properties.address', 'LIKE', '%' . $searchTerm . '%')
                        ->orWhere('properties.city', 'LIKE', '%' . $searchTerm . '%')
                        ->orWhere('properties.zip_code', 'LIKE', '%' . $searchTerm . '%');
                });
            }
        }

        if ($request->is_open_house === true || $request->is_open_house === "true") {
            $properties->where('is_open_house', $request->is_open_house);

        }

        // Apply price filtering
        if ($request->min_price && $request->max_price) {
            $properties->whereBetween('properties.price', [$request->min_price, $request->max_price]);
        } elseif ($request->min_price) {
            $properties->where('properties.price', '>=', $request->min_price);
        } elseif ($request->max_price) {
            $properties->where('properties.price', '<=', $request->max_price);
        }

        // Apply square feet filtering
        if ($request->min_square_feet && $request->max_square_feet) {
            $properties->whereBetween('properties.square_feet', [$request->min_square_feet, $request->max_square_feet]);
        } elseif ($request->min_square_feet) {
            $properties->where('properties.square_feet', '>=', $request->min_square_feet);
        } elseif ($request->max_square_feet) {
            $properties->where('properties.square_feet', '<=', $request->max_square_feet);
        }

        // Apply lot size filtering
        if ($request->min_lot_size && $request->max_lot_size) {
            $properties->whereBetween('properties.lot_size', [$request->min_lot_size, $request->max_lot_size]);
        } elseif ($request->min_lot_size) {
            $properties->where('properties.lot_size', '>=', $request->min_lot_size);
        } elseif ($request->max_lot_size) {
            $properties->where('properties.lot_size', '<=', $request->max_lot_size);
        }

        // Apply bedrooms filtering
        if ($request->bedrooms) {
            $properties->where('properties.bedrooms', $request->bedrooms);
        }

        // Apply bathroom filtering
        if ($request->bathroom !== null && $request->bathroom !== "null") {
            $properties->where('property_features.private_bath', $request->bathroom);
        }

        // Fetch properties
        $properties  = $properties->get();
        $total_homes = $properties->count();

        foreach ($properties as $property) {
            // Fetch related property record

            $property->banner     = null;
            $property->main_image = null;
            $property->bathrooms = $property->half_bath +  $property->full_bath;
            $propertyFeature = PropertyFeature::where('property_id', $property->property_id)->select('parking_enclosure')->first();
            $property->parking_enclosure = $propertyFeature->parking_enclosure ?? 0;

            $images = json_decode($property->images);
            if (is_array($images) && count($images) > 0) {
                $uploads     = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();
                $lastUpload  = $uploads->last();

                // Check if the first upload exists, then assign its file_name to the property
                if ($firstUpload) {
                    $file_image           = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);

                }
                if ($lastUpload) {
                    $file_image       = $lastUpload->file_name;
                    $property->banner = get_storage_url($file_image);
                }
            }
            // $uploads = Upload::whereIn('id', $images)->get();
            // $firstUpload = $uploads->first();
            // $lastUpload = $uploads->last();

            // // Check if the first upload exists, then assign its file_name to the property
            // if ($firstUpload) {
            //     $file_image = $firstUpload->file_name;
            //     $property->main_image = get_storage_url($file_image);

            // }
            // if ($lastUpload) {
            //     $file_image = $lastUpload->file_name;
            //     $property->banner = get_storage_url($file_image);
            // }

            if ($property->is_open_house) {
                $open_house = OpenHouse::where('property_id', $property->property_id)->first();
                dd("ind");
                $property->open_house_data = $open_house;
            }

            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if($PropertyIncentive)
            {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }
            // Fetch community details
            $community = Community::find($property->community_id);
            if ($community && $community->banner) {
                $community_upload = Upload::find($community->banner);
                if ($community_upload) {
                    $community->banner = get_storage_url($community_upload->file_name);
                }
            }
            if ($community) {
                $community_builder = BuildersCommunity::where('community_id', $community->id)->first();

                if ($community_builder) {
                    $builder = Builder::where('id', $community_builder->builder_id)->first();
                    if ($builder) {
                        $incentive_record = Incentive::where('builder_id', $builder->id)->where('end_date', '>=', $currentDate)->first();
                        if ($incentive_record) {
                            $property->incentive = $incentive_record->title ?? "";

                        }
                    }
                }
            }

        }

        return ['properties' => $properties ?? "", 'total_homes' => $total_homes ?? ""];
    }

    public function searchProperties(Request $request)
    {
        $total_homes = 0;
        $properties  = DB::table('properties')
            ->leftJoin('property_features', 'properties.property_id', '=', 'property_features.property_id'); // Join property_features

        // Search in the properties table using null checks
        if ($request->address !== null && $request->address !== "null") {
            $properties->where('properties.address', 'LIKE', '%' . $request->address . '%');
        }

        if ($request->city !== null && $request->city !== "null") {
            $properties->where('properties.city', 'LIKE', '%' . $request->city . '%');
        }

        if ($request->state !== null && $request->state !== "null") {
            $properties->where('properties.state', $request->state);
        }

        if ($request->zip_code !== null && $request->zip_code !== "null") {
            $properties->where('properties.zip_code', $request->zip_code);
        }

        if ($request->price !== null && $request->price !== "null") {
            $properties->where('properties.price', '<', $request->price);
        }

        if ($request->bedrooms !== null && $request->bedrooms !== "null") {
            $properties->where('properties.bedrooms', $request->bedrooms);
        }

        if ($request->square_feet !== null && $request->square_feet !== "null") {
            $properties->where('properties.square_feet', '>=', $request->square_feet);
        }

        if ($request->lot_size !== null && $request->lot_size !== "null") {
            $properties->where('properties.lot_size', '>=', $request->lot_size);
        }

        if ($request->property_type !== null && $request->property_type !== "null") {
            $properties->where('properties.property_type', 'LIKE', '%' . $request->property_type . '%');
        }

        if ($request->listing_type !== null && $request->listing_type !== "null") {
            $properties->where('properties.listing_type', 'LIKE', '%' . $request->listing_type . '%');
        }

        if ($request->hoa_id !== null && $request->hoa_id !== "null") {
            $properties->where('properties.hoa_id', $request->hoa_id);
        }

        if ($request->cic !== null && $request->cic !== "null") {
            $properties->where('properties.cic', $request->cic);
        }

        if ($request->school_id !== null && $request->school_id !== "null") {
            $properties->where('properties.school_id', $request->school_id);
        }

        if ($request->community_id !== null && $request->community_id !== "null") {
            $properties->where('properties.community_id', $request->community_id);
        }

// Now checking single fields in the property_features table
        if ($request->fireplace_type !== null && $request->fireplace_type !== "null") {
            $properties->where('property_features.fireplace_type', 'LIKE', '%' . $request->fireplace_type . '%');
        }

        if ($request->kitchen_pantry_type !== null && $request->kitchen_pantry_type !== "null") {
            $properties->where('property_features.kitchen_pantry_type', 'LIKE', '%' . $request->kitchen_pantry_type . '%');
        }

// Boolean-like fields (1 = Yes, 0 = No)
        if ($request->reach_in !== null && in_array($request->reach_in, ['Yes', 'No'])) {
            $properties->where('property_features.reach_in', $request->reach_in === 'Yes' ? 1 : 0);
        }

        if ($request->walk_in !== null && in_array($request->walk_in, ['Yes', 'No'])) {
            $properties->where('property_features.walk_in', $request->walk_in === 'Yes' ? 1 : 0);
        }

        if ($request->parking_enclosure !== null && in_array($request->parking_enclosure, ['Yes', 'No'])) {
            $properties->where('property_features.parking_enclosure', $request->parking_enclosure === 'Yes' ? 1 : 0);
        }

        if ($request->private_bath !== null && in_array($request->private_bath, ['Yes', 'No'])) {
            $properties->where('property_features.private_bath', $request->private_bath === 'Yes' ? 1 : 0);
        }

        if ($request->outdoor_shower !== null && in_array($request->outdoor_shower, ['Yes', 'No'])) {
            $properties->where('property_features.outdoor_shower', $request->outdoor_shower === 'Yes' ? 1 : 0);
        }

        if ($request->spa !== null && in_array($request->spa, ['Yes', 'No'])) {
            $properties->where('property_features.spa', $request->spa === 'Yes' ? 1 : 0);
        }
        if ($request->laundry_closet !== null && in_array($request->laundry_closet, ['Yes', 'No'])) {
            $properties->where('property_features.laundry_closet', $request->laundry_closet === 'Yes' ? 1 : 0);
        }

        if ($request->bedroom_location !== null && $request->bedroom_location !== "null") {
            $properties->where('property_features.bedroom_location', 'LIKE', '%' . $request->bedroom_location . '%');
        }

        if ($request->bathroom_type !== null && $request->bathroom_type !== "null") {
            $properties->where('property_features.bathroom_type', 'LIKE', '%' . $request->bathroom_type . '%');
        }

        if ($request->pool_shape !== null && $request->pool_shape !== "null") {
            $properties->where('property_features.pool_shape', 'LIKE', '%' . $request->pool_shape . '%');
        }

        if ($request->water_features !== null && $request->water_features !== "null") {
            $properties->where('property_features.water_features', 'LIKE', '%' . $request->water_features . '%');
        }

        if ($request->fencing_material !== null && $request->fencing_material !== "null") {
            $properties->where('property_features.fencing_material', 'LIKE', '%' . $request->fencing_material . '%');
        }

        if ($request->fencing_status !== null && $request->fencing_status !== "null") {
            $properties->where('property_features.fencing_status', 'LIKE', '%' . $request->fencing_status . '%');
        }

// Finally, get the results
        $properties  = $properties->get();
        $total_homes = $properties->count();

        foreach ($properties as $property) {
            $property->banner     = null;
            $property->main_image = null;

            $property->bathrooms = $property->half_bath +  $property->full_bath;
            $propertyFeature = PropertyFeature::where('property_id', $property->property_id)->select('parking_enclosure')->first();
            $property->parking_enclosure = $propertyFeature->parking_enclosure ?? 0;

            // Fetch related property record
            $home = QuickMoveHome::where('property_id', $property->property_id)->first();
            if ($property->is_open_house) {

                $open_house                = OpenHouse::where('property_id', $property->property_id)->first();
                $property->open_house_data = $open_house;
            }
            $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->first();
            if($PropertyIncentive)
            {
                // $incentive = Incentive::where('id', $PropertyIncentive->incentive_id)->first();
                // $property->incentive = $incentive;
                $property->incentive = 1;
            }
            // Process main image
            $images = json_decode($property->images);
            if (is_array($images) && count($images) > 0) {
                $uploads     = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();
                $lastUpload  = $uploads->last();

                // Check if the first upload exists, then assign its file_name to the property
                if ($firstUpload) {
                    $file_image           = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);

                }
                if ($lastUpload) {
                    $file_image       = $lastUpload->file_name;
                    $property->banner = get_storage_url($file_image);
                }
            }
            // $uploads = Upload::whereIn('id', $images)->get();
            // $firstUpload = $uploads->first();
            // $lastUpload = $uploads->last();

            // // Check if the first upload exists, then assign its file_name to the property
            // if ($firstUpload) {
            //     $file_image = $firstUpload->file_name;
            //     $property->main_image = get_storage_url($file_image);

            // }
            // if ($lastUpload) {
            //     $file_image = $lastUpload->file_name;
            //     $property->banner = get_storage_url($file_image);
            // }

            $property->home_data = $home;
        }

        return ['properties' => $properties, 'total_homes' => $total_homes];
    }
    public function all_incentvives()
    {
        return view('app');
    }
    public function all_events()
    {
        return view('app');
    }
    public function about_us()
    {
        return view('app');
    }
    public function agents($property_id)
    {
        return view('app', compact('property_id'));
    }

    public function fetchAllAgents()
    {

        $agents = Agent::all();
        foreach ($agents as $key => $agent) {

            $agreements_count = CustomerAgentConnection::where('agent_id', $agent->id)->where('current_status', '!=', 'Completed')->count();
            // if ($agreements_count > 2) {
            //     $agents = $agents->forget($key);
            // }
            $user = User::where('id', $agent->user_id)->first();
            if ($user) {
                $uploaded_image = Upload::where('id', $user->image)->first();
                if ($uploaded_image && $uploaded_image->file_name) {
                    $agent->image = get_storage_url($uploaded_image->file_name);
                }
            }
        }

        return $agents;
    }
    // public function connect_customer_agents(Request $request)
    // {
    //     $existing_record = CustomerAgentConnection::where('agent_id', $request->agent_id)->where('customer_id', auth()->user()->id)->where('property_id', $request->property_id)->first();
    //     if ($existing_record) {
    //         return response()->json([

    //             'message' => ("Already connected to this Agent, He will contact you soon."),
    //         ], 422);
    //     } else {

    //         $Agent = new CustomerAgentConnection;
    //         $Agent->id = Str::orderedUuid();

    //         $Agent->agent_id = $request->agent_id;
    //         $Agent->property_id = $request->property_id;
    //         $Agent->customer_id = auth()->user()->id;
    //         $Agent->date = Carbon::now();
    //         $Agent->current_status = 'Pending';
    //         $Agent->terms_agreed = $request->terms_agreed;
    //         $Agent->agreement_type = $request->agreement_type;
    //         $Agent->save();
    //         return 'success';
    //     }

    //     $Agent = new CustomerAgentConnection;
    //     $Agent->id = Str::orderedUuid();

    //     $Agent->agent_id = $request->agent_id;
    //     $Agent->property_id = $request->property_id;
    //     $Agent->customer_id = auth()->user()->id;
    //     $Agent->date = Carbon::now();
    //     $Agent->current_status = 'Pending';
    //     $Agent->terms_agreed = $request->terms_agreed;
    //     $Agent->agreement_type = $request->agreement_type;
    //     $Agent->save();
    //     return 'success';
    // }
    public function connect_customer_agents(Request $request)
    { 
        // Validate the request
        $request->validate([
            'name'        => 'required|string|max:255',
            'email'       => 'required|email',
            'phone'       => 'required|string|max:20',
            'property_id' => 'required',
            'agent_id'    => 'required',
        ]);

        // Check if user exists
        $user = User::where('email', $request->email)->first();

        $isNewUser = false;
        $password = Str::random(10); // Generate a random password

        if (!$user) {
            // Create new user if not found
            $user = new User();
            $user->name     = $request->name;
            $user->email    = $request->email;
            $user->phone    = $request->phone;
            $user->role    = 'customer';
            $user->email_verified_at    =  Carbon::now();
            $user->password = bcrypt($password); // Encrypt password
            $user->save();
            
            $isNewUser = true;
        }

        // Store in CustomerAgentConnection
        $agentConnection = new CustomerAgentConnection();
        $agentConnection->id = Str::orderedUuid();
        $agentConnection->agent_id = $request->agent_id;
        $agentConnection->property_id = $request->property_id;
        $agentConnection->customer_id = $user->id;
        $agentConnection->date = Carbon::now();
        $agentConnection->current_status = 'Pending';
        $agentConnection->save();

        // Fetch Property and Agent Information
        $property = Property::where('property_id', $request->property_id)
                            ->select('title')
                            ->first();
                            $agent = Agent::where('id', $request->agent_id)
                            ->select('name','license_number')
                            ->first();
                        

        // Prepare email data
        $emailData = [
            'name'     => $request->name,
            'property' => $property,
            'agent'    => $agent,
        ];

        if ($isNewUser) {
            // If new user, include login credentials
            $emailData['email']    = $request->email;
            $emailData['password'] = $password;

            Mail::send('Emails.new_user_interest', $emailData, function ($message) use ($request) {
                $message->to($request->email)
                        ->subject('Welcome! Your Account & Property Interest Details');
            });
        } else {
            // If existing user, send only property and agent details
            Mail::send('Emails.existing_user_interest', $emailData, function ($message) use ($request) {
                $message->to($request->email)
                        ->subject('Property Interest Confirmation');
            });
        }

        return response()->json(['message' => 'Success', 'customer_id' => $user->id], 201);
    }

    public function homes_search_by_location($location = null)
    {
        $location = $location;
        return view('app', compact('location'));
    }


    // privary_policy
    public function privacy_policy()
    {
        return view('app');
    }
    // terms_of_policy
    public function terms_of_policy()
    {
        return view('app');
    }
    // cookie_policy
    public function cookie_policy()
    {
        return view('app');
    }
}
