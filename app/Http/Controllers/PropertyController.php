<?php

namespace App\Http\Controllers;

use App\Models\Community;
use App\Models\OpenHouse;
use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\QuickMoveHome;
use App\Models\QuickMoveInHome;
use App\Models\Incentive;
use App\Models\PropertyIncentive;
use App\Models\Upload;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PropertyController extends Controller
{

    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function fetchProperties(Request $request)
    {
        // Start building the properties query
        $propertiesQuery = DB::table('properties');

        // Filter by title if provided
        if ($request->filled('name') && $request->name !== "null") {
            $propertiesQuery->where('title', 'LIKE', '%' . $request->name . '%');
        }

        // Paginate the results
        $properties = $propertiesQuery->paginate(45);

        // Process each property
        $properties->getCollection()->transform(function ($property) {
            // Initialize main_image to null
            $property->main_image = null;

            // Check if files are available and decode them
            if ($property->files) {
                $files = json_decode($property->files, true);

                // Fetch uploaded images if any
                $uploads = Upload::whereIn('id', $files)->get();

                // Filter for images (JPEG, PNG, etc.) and assign the first one to main_image
                $image = $uploads->first(function ($upload) {
                    return in_array($upload->type, ['image/jpeg', 'image/png', 'image/gif']);
                });

                if ($image) {
                    $property->main_image = get_storage_url($image->file_name);
                }
            }

            return $property;
        });

        return response()->json($properties);
    }

    public function create()
    {
        $name = 'create';
        return view('app', compact('name'));
    }
    public function store(Request $request)
    {
        // Validate the incoming request
        $request->validate([
            // Property Fields
            'user_id' => 'nullable',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'address' => 'required|string|max:255',
            'city' => 'nullable|string|max:255',
            'state' => 'nullable|string|max:255',
            'zip_code' => 'nullable|string|max:255',
            'latitude' => 'required|string|max:255',
            'longitude' => 'required|string|max:255',
            'price' => 'required|numeric',
            'bedrooms' => 'nullable|integer|min:0',
            'square_feet' => 'nullable|numeric',
            'lot_size' => 'nullable|numeric',
            'property_type' => 'nullable|string|max:255',
            'listing_type' => 'nullable|string|max:255',
            'year_built' => 'nullable|integer|digits:4',
            'hoa_id' => 'required',
            'association_fee' => 'nullable|numeric',
            'cic' => 'nullable',
            'school_id' => 'required',
            'community_id' => 'required',
            'home_main_image' => 'required',

            // Property Features Fields
            'feature.name' => 'nullable|string|max:255',
            'feature.description' => 'nullable|string',
            'feature.fireplace_type' => 'nullable|string|max:255',
            'feature.kitchen_pantry_type' => 'nullable|string|max:255',
            'feature.reach_in' => 'nullable',
            'feature.walk_in' => 'nullable',
            'feature.laundry_closet' => 'nullable|string|max:255',
            'feature.closet_location' => 'nullable|string|max:255',
            'feature.bedroom_location' => 'nullable|string|max:255',
            'feature.bathroom_type' => 'nullable|string|max:255',
            'feature.bathroom_status' => 'nullable|string|max:255',
            'feature.pool_shape' => 'nullable|string|max:255',
            'feature.water_features' => 'nullable|string|max:255',
            'feature.pool_status' => 'nullable|string|max:255',
            'feature.spa' => 'nullable|boolean',
            'feature.fencing_material' => 'nullable|string|max:255',
            'feature.fencing_status' => 'nullable|string|max:255',
            'feature.parking_enclosure' => 'nullable|string|max:255',
            'feature.private_bath' => 'nullable',
            'feature.outdoor_shower' => 'nullable',
            'feature.landscape_maintenance' => 'nullable|string|max:255',
            'feature.foundation_conditions' => 'nullable|string|max:255',
        ]);

        // Create or update the property
        if ($request->property_id && $request->property_id != null && $request->property_id != "null") {

            $property = Property::where('property_id', $request->property_id)->first();
            $propertyFeature = PropertyFeature::where('property_id', $property->property_id)->first();
            $quickMoveInHome = QuickMoveInHome::where('property_id', $property->property_id)->first();
        } else {
            $property = new Property();
            $property->property_id = Str::orderedUuid();

            $propertyFeature = new PropertyFeature();
            // $propertyFeature->feature_id = Str::orderedUuid();

            $quickMoveInHome = new QuickMoveInHome();
            $quickMoveInHome->id = Str::orderedUuid();
        }

        // Assign values from the request to the Property model
        $property->user_id = auth()->user()->id;
        $property->title = $request->title;
        $property->description = $request->description;
        $property->address = $request->address;
        $property->city = $request->city;
        $property->state = $request->state;
        $property->zip_code = $request->zip_code;
        $property->latitude = $request->latitude;
        $property->longitude = $request->longitude;
        $property->price = $request->price;
        $property->bedrooms = $request->bedrooms;
        $property->square_feet = $request->square_feet;
        $property->lot_size = $request->lot_size;
        $property->property_type = $request->property_type;
        $property->listing_type = $request->listing_type;
        $property->year_built = $request->year_built;

        $property->hoa_id = $request->hoa_id;
        $property->community_id = $request->community_id;
        $property->association_fee = $request->association_fee;
        $property->cic = $request->cic ? 1 : 0;
        $property->school_id = $request->school_id;

         // Handle amenities
         if ($request->incentives) {
            PropertyIncentive::where('property_id', $property->property_id)->delete();
            $requested_incentives = json_decode($request->incentives);

            foreach ($requested_incentives as $incentive) {
                $incentive_record = new PropertyIncentive();
                $incentive_record->id = Str::orderedUuid();
                $incentive_record->property_id = $property->property_id; // Use the new community ID
                $incentive_record->incentive_id = $incentive;
                $incentive_record->save();
            }
        }else
        {
            PropertyIncentive::where('property_id', $property->property_id)->delete();
        }

        // Handle file uploads
        if ($request->file('files')) {
            $files_ids = [];
            foreach ($request->file('files') as $file) {
                $file_name_with_path = $file->store('real_public/PropertiesFiles/');

                $upload = new Upload();
                $upload->file_original_name = $file->getClientOriginalName();
                $upload->file_name = $file_name_with_path;
                $upload->file_size = $file->getSize();
                $upload->extension = $file->extension();
                $upload->type = $file->getClientMimeType();
                $upload->save();

                $files_ids[] = $upload->id;
            }
            // Assuming you want to save these file IDs in the community object (or an event)
            $property->files = json_encode($files_ids);
        }

        // Save the property
        $property->save();

        $listingDate = $request->listing_date;
        // Remove the timezone part for parsing using regular expression
        $cleanedDate = preg_replace('/ GMT[+-]\d{4} \(.*\)/', '', $listingDate);

        // Convert to Carbon and format to 'Y-m-d'
        $formattedDate = Carbon::parse($cleanedDate)->format('Y-m-d');

        // Now save the formatted date in the database

        $quickMoveInHome->property_id = $property->property_id;
        $quickMoveInHome->move_in_date = $formattedDate;
        $quickMoveInHome->incentives = $request->incentives;
        if ($request->home_main_image) {

            $existingInUploads = Upload::where('id', $quickMoveInHome->home_main_image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->home_main_image, strpos($request->home_main_image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/quickMoveInHomeMainImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $quickMoveInHome->main_image = $Upload->id;
        }
        $quickMoveInHome->save();

        // Below code is for feature, storing...
        $propertyFeature->property_id = $property->property_id; // Set the property_id
        $propertyFeature->name = $request->name;
        $propertyFeature->description = $request->description;
        $propertyFeature->fireplace_type = $request->fireplace_type;
        $propertyFeature->kitchen_pantry_type = $request->kitchen_pantry_type;
        $propertyFeature->reach_in = $request->reach_in ? 1 : 0;
        $propertyFeature->walk_in = $request->walk_in ? 1 : 0;
        $propertyFeature->laundry_closet = $request->laundry_closet ? 1 : 0;
        $propertyFeature->closet_location = $request->closet_location;
        $propertyFeature->bedroom_location = $request->bedroom_location;
        $propertyFeature->bathroom_type = $request->bathroom_type;
        $propertyFeature->bathroom_status = $request->bathroom_status;
        $propertyFeature->pool_shape = $request->pool_shape;
        $propertyFeature->water_features = $request->water_features;
        $propertyFeature->pool_status = $request->pool_status;
        $propertyFeature->spa = $request->spa ? 1 : 0;
        $propertyFeature->fencing_material = $request->fencing_material;
        $propertyFeature->fencing_status = $request->fencing_status;
        $propertyFeature->parking_enclosure = $request->parking_enclosure ? 1 : 0;
        $propertyFeature->private_bath = $request->private_bath ? 1 : 0;
        $propertyFeature->outdoor_shower = $request->outdoor_shower ? 1 : 0;
        $propertyFeature->landscape_maintenance = $request->landscape_maintenance;
        $propertyFeature->foundation_conditions = $request->foundation_conditions;

        $propertyFeature->save(); // Save the new property feature record

        return 'success';
    }

    public function edit($id)
    {
        return view('app', compact('id'));
    }

    public function getProperty($id)
    {
        $property = Property::findOrFail($id);
        $features = PropertyFeature::where('property_id', $property->property_id)->first();
        $QuickMoveInHome = QuickMoveInHome::where('property_id', $property->property_id)->first();

        $PropertyIncentive = PropertyIncentive::where('property_id', $property->property_id)->pluck('incentive_id');

        if ($PropertyIncentive) {
            $property->incentives = $PropertyIncentive;
        }

        $property->cic = $property->cic == 1 ? "Yes" : "No";
        $property->feature['reach_in'] = $features->reach_in == 1 ? "Yes" : "No";
        $property->feature['walk_in'] = $features->walk_in == 1 ? "Yes" : "No";
        $property->feature['laundry_closet'] = $features->laundry_closet == 1 ? "Yes" : "No";
        $property->feature['spa'] = $features->spa == 1 ? "Yes" : "No";
        $property->feature['parking_enclosure'] = $features->parking_enclosure == 1 ? "Yes" : "No";
        $property->feature['private_bath'] = $features->private_bath == 1 ? "Yes" : "No";
        $property->feature['outdoor_shower'] = $features->outdoor_shower == 1 ? "Yes" : "No";

        $property->listing_date = $QuickMoveInHome->move_in_date;
    
        if ($QuickMoveInHome->main_image) {
            $uploads = Upload::where('id', $QuickMoveInHome->main_image)->first();

        }

        if ($QuickMoveInHome->main_image) {
            $uploaded_image = Upload::find($QuickMoveInHome->main_image);

            if ($uploaded_image) {
                $property->home_main_image = get_storage_url($uploaded_image->file_name);
            }
        }

        return response()->json($property);
    }

    public function delete($id)
    {
        $property = Property::findOrFail($id);
        $upload = Upload::where('id', $property->image)->first();
        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        $property->delete();

        return 'success';
    }

    public function details($id)
    {
        return view('app', compact('id'));
    }
    public function getPropertyDetails($id)
    {
        // Fetch the property along with its relationships
        $property = Property::with(['feature', 'hoa', 'school'])->findOrFail($id);
        // Initialize OpenHouse data
        $openHouseData = [];

        if ($property->is_open_house) {
            $OpenHouse = OpenHouse::where('property_id', $id)->first();
            if ($OpenHouse) {
                $openHouseData = [
                    'open_house_date' => $OpenHouse->date,
                    'open_house_start_time' => $OpenHouse->start_time,
                    'open_house_end_time' => $OpenHouse->end_time,
                    'open_house_description' => $OpenHouse->description,
                ];
            }
        }
        if ($property) {
            $community = Community::where('id', $property->community_id)->first();
        }

         // Get amenities
         $PropertyIncentivesIds = PropertyIncentive::where('property_id', $id)->pluck('incentive_id');
         if ($PropertyIncentivesIds->isNotEmpty()) {
         
             $property->incentives = Incentive::whereIn('id', $PropertyIncentivesIds)->pluck('title');
             
         } else {
             $property->incentives = [];
         }

 
        // Initialize the property data array
        $propertyData = [
            'id' => $property->id,
            'title' => $property->title,
            'is_open_house' => $property->is_open_house,
            'description' => $property->description,
            'address' => $property->address,
            'city' => $property->city,
            'state' => $property->state,
            'zip_code' => $property->zip_code,
            'price' => $property->price,
            'bedrooms' => $property->bedrooms,
            'square_feet' => $property->square_feet,
            'lot_size' => $property->lot_size,
            'property_type' => $property->property_type,
            'listing_type' => $property->listing_type,
            'year_built' => $property->year_built,
            'community_id' => $property->community_id,
            'community_name' => $community->name ?? "",

            'hoa_name' => optional($property->hoa)->name,
            'association_fee' => $property->association_fee,
            'cic' => $property->cic,
            'school_name' => optional($property->school)->name,
            'school_id' => $property->school_id,
            'feature_id' => optional($property->feature)->id,
            // Use optional helper to avoid null errors
            'name' => optional($property->feature)->name,
            'fireplace_type' => optional($property->feature)->fireplace_type,
            'kitchen_pantry_type' => optional($property->feature)->kitchen_pantry_type,
            'reach_in' => optional($property->feature)->reach_in,
            'walk_in' => optional($property->feature)->walk_in,
            'laundry_closet' => optional($property->feature)->laundry_closet,
            'closet_location' => optional($property->feature)->closet_location,
            'bedroom_location' => optional($property->feature)->bedroom_location,
            'bathroom_type' => optional($property->feature)->bathroom_type,
            'bathroom_status' => optional($property->feature)->bathroom_status,
            'pool_shape' => optional($property->feature)->pool_shape,
            'water_features' => optional($property->feature)->water_features,
            'pool_status' => optional($property->feature)->pool_status,
            'spa' => optional($property->feature)->spa,
            'fencing_material' => optional($property->feature)->fencing_material,
            'fencing_status' => optional($property->feature)->fencing_status,
            'parking_enclosure' => optional($property->feature)->parking_enclosure,
            'private_bath' => optional($property->feature)->private_bath,
            'outdoor_shower' => optional($property->feature)->outdoor_shower,
            'landscape_maintenance' => optional($property->feature)->landscape_maintenance,
            'foundation_conditions' => optional($property->feature)->foundation_conditions,
            'hoa' => optional($property->hoa)->name,
            'school' => optional($property->school)->name,
            'incentives' => $property->incentives,
        ];

        // Merge the open house data into property data if available
        if (!empty($openHouseData)) {
            $propertyData = array_merge($propertyData, $openHouseData);
        }

        // Process additional files
        $propertyData['files'] = []; // Initialize files array

        if ($property->files) {
            $uploads = Upload::whereIn('id', json_decode($property->files))->orderBy('extension')->get(['file_original_name', 'file_name', 'extension', 'type']);

            foreach ($uploads as $upload) {
                $upload->file_name = get_storage_url($upload->file_name); // Update the file name with the storage URL
                $propertyData['files'][] = $upload; // Append each upload to the files array
            }
        }

        return response()->json($propertyData);
    }

    public function properties_pluck()
    {
        return Property::pluck('title', 'property_id');
    }
    public function fetchHomes()
    {
        $homes = QuickMoveHome::paginate(7);
        foreach ($homes as $home) {

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

    // property as open house store
    public function store_property_as_open_house(Request $request)
    {
        $request->validate([
            'date' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'description' => 'required',
        ]);

        if ($request->id) {
            $OpenHouse = OpenHouse::where('id', $id)->first();

        } else {
            $OpenHouse = new OpenHouse();
            $OpenHouse->id = Str::orderedUuid();
        }
        $property = Property::where('property_id', $request->property_id)->first();

        $property->is_open_house = $request->status;
        $property->save();
        $OpenHouse->property_id = $request->property_id;
        $OpenHouse->date = Carbon::parse($request->date);
        $OpenHouse->start_time = $request->start_time;
        $OpenHouse->end_time = $request->end_time;
        $OpenHouse->description = $request->description;
        $OpenHouse->save();
        return 'success';

    }

    public function getPropertyOpenHouse($id)
    {
        $OpenHouse = OpenHouse::where('id', $id)->first();
        return $OpenHouse;
    }
    public function removePropertyOpenHouse($property_id)
    {
        $OpenHouse = OpenHouse::where('property_id', $property_id)->first();

        $property = Property::where('property_id', $property_id)->first();

        $property->is_open_house = null;
        $property->save();

        $OpenHouse->delete();
        return 'success';
    }

}
