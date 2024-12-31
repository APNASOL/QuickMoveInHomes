<?php

namespace App\Http\Controllers;

use App\Imports\PropertiesImport;
use App\Models\Agent;
use App\Models\Community;
use App\Models\CustomerAgentConnection;
use App\Models\CustomerVisitingHomesHistory;
use App\Models\Incentive;
use App\Models\OpenHouse;
use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\PropertyIncentive;
use App\Models\QuickMoveHome; 
use App\Models\Upload;
use App\Models\User;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;
use ZipArchive;

class PropertyController extends Controller
{

    // public function uploadProperties(Request $request)
    // {
    //     $request->validate([
    //         'file' => 'required|file|mimes:xlsx',
    //         'images' => 'required|file|mimes:zip',
    //     ]);
    
    //     try {
    //         // Step 1: Handle Images (Unzip)
    //         $zipPath = $request->file('images')->store('temp', 'real_public');
    //         $extractPath = Storage::disk('real_public')->path('temp/'); // Absolute path for extracting images
    
             
    //         // Ensure the extraction directory exists
    //         if (!File::exists($extractPath)) {
    //             dd("ste");
    //             File::makeDirectory($extractPath, 0755, true);
    //         }
    
    //         // Step 2: Unzip the uploaded file
    //         $zip = new ZipArchive;
    //         $zipFilePath = Storage::disk('real_public')->path('temp/' . basename($zipPath)); // Absolute path for ZIP file
    
    //         if ($zip->open($zipFilePath) === true) {
    //             $zip->extractTo($extractPath); // Extract to local path
    //             $zip->close();
    //         } else {
    //             return response()->json(['error' => 'Failed to unzip the images.'], 500);
    //         }
    
    //         dd($extractPath);
    //         // Step 3: Import Properties from Excel
    //         Excel::import(new PropertiesImport($extractPath), $request->file('file'));
    
    //         // Generate public URL for the extracted images
    //         $imageUrls = [];
    //         $imagePaths = glob($extractPath . '/*'); // Get all files from the extracted folder
    //         foreach ($imagePaths as $imagePath) {
    //             $imageUrl = get_storage_url('temp/' . basename($imagePath)); // Generate public URL
    //             $imageUrls[] = $imageUrl;
    //         }
    
    //         return response()->json(['message' => 'Properties uploaded successfully', 'image_urls' => $imageUrls], 200);
    
    //     } catch (\Exception $e) {
    //         \Log::error('Error uploading properties: ' . $e->getMessage());
    //         return response()->json(['error' => 'An error occurred while uploading properties.'], 500);
    //     }
    // }
    


    // public function uploadProperties(Request $request)
    // {
    //     // Validate the request input
    //     $request->validate([
    //         'file' => 'required|file|mimes:xlsx', // Excel file validation
    //         'images' => 'required|file|mimes:zip', // ZIP file validation
    //     ]);

    //     try {
    //         // Step 1: Handle Images (Unzip)
    //         $zipPath = $request->file('images')->store('real_public/temp/', 'real_public');
    //         $extractPath = public_path('real_public/temp/'); // Extract to temporary folder in real_public

    //         dd(public_path('real_public/temp/'), get_storage_url('real_public/temp/'));
    //         // Ensure the extraction directory exists
    //         if (!File::exists($extractPath)) {
    //             File::makeDirectory($extractPath, 0755, true);
    //         }

    //         // Step 2: Unzip the uploaded file
    //         $zip = new ZipArchive;
    //         $zipFilePath = get_storage_url('real_public/temp/' . basename($zipPath)); // Get full path of ZIP file
    //     // dd($zipFilePath);
    //     //         // Check if the ZIP file exists
    //     //         if (!file_exists($zipFilePath)) {
    //     //             return response()->json(['error' => 'ZIP file does not exist at the path: ' . $zipFilePath], 500);
    //     //         }

    //                 $zipFilePath = public_path('real_public/temp/' . basename($zipPath));
    //     // Open and extract the ZIP file
    //         if ($zip->open($zipFilePath) === true) {
    //             \Log::info('Zip file opened successfully');
    //             $zip->extractTo($extractPath); // Extract to local path within real_public
    //             $zip->close();
    //         } else {
    //             \Log::error('Failed to open ZIP file: ' . $zipFilePath);
    //             dd('Failed to open zip file');
    //             return response()->json(['error' => 'Failed to unzip the images.'], 500);
    //         }

    //         // Step 3: Process images dynamically

    //         // Get all files in the extracted folder
    //         $extractedFiles = File::files($extractPath);

    //         foreach ($extractedFiles as $file) {
    //             // Get the image name and use the helper to get its full path
    //             $imageName = basename($file);
    //             $imagePath = get_storage_url($imageName);

    //             // Check if the image exists at the specified path
    //             if (file_exists($imagePath)) {
    //                 // Process the image (e.g., store it in a database or perform other actions)
    //                 dd('Processing image: ' . $imageName);
    //             } else {
    //                 // Log an error if the image does not exist
    //                 dd("Image file not found: " . $imagePath);
    //             }
    //         }
    //         dd($extractedFiles);

    //         // Step 4: Import Properties from Excel
    //         Excel::import(new PropertiesImport($extractPath), $request->file('file'));

    //         // Clean up temporary files
    //         // Storage::disk('real_public')->delete($zipPath); // Delete the ZIP from real_public disk
    //         // File::deleteDirectory($extractPath); // Delete extracted images directory

    //         // Return success response
    //         return response()->json(['message' => 'Properties uploaded successfully'], 200);

    //     } catch (\Exception $e) {
    //         // Log and return an error message in case of exception
    //         \Log::error('Error uploading properties: ' . $e->getMessage());
    //         return response()->json(['error' => 'An error occurred while uploading properties. Details: ' . $e->getMessage()], 500);
    //     }
    // }

    // public function uploadProperties(Request $request)
    // {
    //     $request->validate([
    //         'file' => 'required|file|mimes:xlsx',
    //     ]);

    //     Excel::import(new PropertiesImport, $request->file('file'));
    //     return 'success';
    // }

    // upto here code is working
    public function uploadProperties(Request $request)
    { 
        $request->validate([
            'file' => 'required|file|mimes:xlsx',
            'images' => 'required|file|mimes:zip',
        ]);

        try {
            // Step 1: Handle Images (Unzip)
            $zipPath = $request->file('images')->store('real_public/temp', 'real_public');
            $extractPath = public_path('real_public/temp/'); // Extract to temporary folder in real_public

            // Ensure the extraction directory exists
            if (!File::exists($extractPath)) {
                File::makeDirectory($extractPath, 0755, true);
            }

            // Step 2: Unzip the uploaded file
            $zip = new ZipArchive;
            $zipFilePath = public_path('real_public/temp/' . basename($zipPath)); // Get full path of ZIP file

            // Check if the ZIP file exists
            if (!file_exists($zipFilePath)) {
                return response()->json(['error' => 'ZIP file does not exist at the path: ' . $zipFilePath], 500);
            }

            // Open and extract the ZIP file
            if ($zip->open($zipFilePath) === true) {
                $zip->extractTo($extractPath); // Extract to local path within real_public
                $zip->close();
            } else {
                return response()->json(['error' => 'Failed to unzip the images.'], 500);
            }

            // Step 3: Import Properties from Excel
            Excel::import(new PropertiesImport($extractPath), $request->file('file'));


            // Clean up temporary files
            Storage::disk('real_public')->delete($zipPath); // Delete the ZIP from real_public disk
            File::deleteDirectory($extractPath); // Delete extracted images directory

            return response()->json(['message' => 'Properties uploaded successfully'], 200);

        } catch (\Exception $e) {
            // Log and return an error message
            // \Log::error('Error uploading properties: ' . $e->getMessage());
            return response()->json(['error' => 'An error occurred while uploading properties. Details: ' . $e->getMessage()], 500);
        }
    }

    // this code are working
    // public function uploadProperties(Request $request)
    // {
    //     $request->validate([
    //         'file' => 'required|file|mimes:xlsx',
    //         'images' => 'required|file|mimes:zip',
    //     ]);

    //     try {
    //         // Step 1: Handle Images (Unzip)
    //         // Store the ZIP file in real_public/temp directory
    //         $zipPath = $request->file('images')->store('real_public/temp', 'real_public');
    //         $extractPath = public_path('real_public/temp_images'); // Extract to temporary folder in real_public

    //         // Ensure the extraction directory exists
    //         if (!File::exists($extractPath)) {
    //             File::makeDirectory($extractPath, 0755, true);
    //         }

    //         // Step 2: Unzip the uploaded file
    //         $zip = new ZipArchive;
    //         $zipFilePath = public_path('real_public/temp/' . basename($zipPath)); // Get full path of ZIP file

    //         // Check if the ZIP file exists
    //         if (!file_exists($zipFilePath)) {
    //             return response()->json(['error' => 'ZIP file does not exist at the path: ' . $zipFilePath], 500);
    //         }

    //         // Open and extract the ZIP file
    //         if ($zip->open($zipFilePath) === true) {
    //             $zip->extractTo($extractPath); // Extract to local path within real_public
    //             $zip->close();
    //         } else {
    //             return response()->json(['error' => 'Failed to unzip the images.'], 500);
    //         }

    //         // Step 3: Import Properties from Excel
    //         Excel::import(new PropertiesImport($extractPath), $request->file('file'));

    //         // Clean up temporary files
    //         Storage::disk('real_public')->delete($zipPath); // Delete the ZIP from real_public disk
    //         File::deleteDirectory($extractPath); // Delete extracted images directory

    //         return response()->json(['message' => 'Properties uploaded successfully'], 200);

    //     } catch (\Exception $e) {
    //         // Log and return an error message
    //         \Log::error('Error uploading properties: ' . $e->getMessage());
    //         return response()->json(['error' => 'An error occurred while uploading properties. Details: ' . $e->getMessage()], 500);
    //     }
    // }

    public function upload()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    public function index()
    {
        $name = 'index';
        return view('app', compact('name'));
    }

    // public function fetchProperties(Request $request)
    // {
    //     // Start building the properties query
    //     $propertiesQuery = DB::table('properties');

    //     // Filter by title if provided
    //     if ($request->filled('name') && $request->name !== "null") {
    //         $propertiesQuery->where('title', 'LIKE', '%' . $request->name . '%');
    //     }

    //     // Paginate the results
    //     $properties = $propertiesQuery->paginate(15);

    //     // Process each property
    //     $properties->getCollection()->transform(function ($property) {
    //         // Initialize main_image to null
    //         $property->main_image = null;

    //         // Check if files are available and decode them
    //         if ($property->images) {
    //             $files = json_decode($property->images, true);

    //             // Fetch uploaded images if any
    //             $uploads = Upload::whereIn('id', $files)->get();

    //             // Filter for images (JPEG, PNG, etc.) and assign the first one to main_image
    //             $image = $uploads->first(function ($upload) {
    //                 return in_array($upload->type, ['image/jpeg', 'image/png', 'image/gif']);
    //             });

    //             if ($image) {
    //                 $property->main_image = get_storage_url($image->file_name);
    //             }
    //         }

    //         return $property;
    //     });

    //     return response()->json($properties);
    // }

    public function fetchProperties(Request $request)
    {
        $propertiesQuery = DB::table('properties')
        ->select('property_id', 'title', 'community_id', DB::raw('COALESCE(images, \'[]\') as images'));
    
    if ($request->filled('name') && $request->name !== "null") {
        $propertiesQuery->where('title', 'LIKE', '%' . $request->name . '%');
    }
    
    // Paginate the results
    $properties = $propertiesQuery->paginate(15);
    

        foreach ($properties as $property) {
            
            $property->banner =NULL;
            $property->main_image =NULL;
            $images = json_decode($property->images);
            if (is_array($images) && count($images) > 0) { 
                $uploads = Upload::whereIn('id', $images)->get();
                $firstUpload = $uploads->first();
                $lastUpload = $uploads->last();

                // Check if the first upload exists, then assign its file_name to the property
                if ($firstUpload) {
                    $file_image = $firstUpload->file_name;
                    $property->main_image = get_storage_url($file_image);
                    
                }
                if ($lastUpload) {
                    $file_image = $lastUpload->file_name; 
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
             
             
            $property->community = Community::where('id', $property->community_id)->first() ?? "";

        }

        // Return the properties as JSON response
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
            'city' => 'required|string|max:255',
            'state' => 'required|string|max:255',
            'zip_code' => 'required|string|max:255',
            'latitude' => 'required|string|max:255',
            'longitude' => 'required|string|max:255',
            'price' => 'required|numeric',
            'bedrooms' => 'required|integer|min:0',
            'square_feet' => 'required|numeric',
            'lot_size' => 'required|numeric',
            'property_type' => 'required|string|max:255',
            'listing_type' => 'required|string|max:255',
            'year_built' => 'required|integer|digits:4',
            'hoa_id' => 'required',
            'association_fee' => 'required|numeric',
            'cic' => 'required',
            'school_id' => 'required',
            'community_id' => 'required',
            'home_main_image' => 'nullable',
            'banner' => 'nullable',

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
            $quickMoveInHome = QuickMoveHome::where('property_id', $property->property_id)->first();
        } else {
            $property = new Property();
            $property->property_id = Str::orderedUuid();

            $propertyFeature = new PropertyFeature();
            // $propertyFeature->feature_id = Str::orderedUuid();

            $quickMoveInHome = new QuickMoveHome();
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
        } else {
            PropertyIncentive::where('property_id', $property->property_id)->delete();
        }

        // Handle file uploads
        if ($request->file('files')) {
            $files_ids = [];

            // If there are existing file IDs in the property, decode them
            if ($property->images) {
                $existing_files_ids = json_decode($property->images, true);
            } else {
                $existing_files_ids = [];
            }

            // Loop through new files and add their IDs
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

            // Merge the new file IDs with the existing ones
            $all_files_ids = array_merge($existing_files_ids, $files_ids);

            // Save the updated file IDs as a JSON string
            $property->images = json_encode($all_files_ids);

        }

        if ($request->home_main_image) {

            $existingInUploads = Upload::where('id', $property->home_main_image)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->home_main_image, strpos($request->home_main_image, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/PropertyMainImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $property->main_image = $Upload->id;
        }
        if ($request->banner) {

            $existingInUploads = Upload::where('id', $property->banner)->first();
            if ($existingInUploads) {
                Storage::delete($existingInUploads->file_name);
                $existingInUploads->delete();
            }

            $data = substr($request->banner, strpos($request->banner, ',') + 1);
            $data = base64_decode($data);

            $image_name_with_path = 'real_public/PropertyBannerImages/' . Str::random(40) . '.png';
            Storage::put($image_name_with_path, $data);

            $Upload = new Upload;
            $Upload->file_original_name = $image_name_with_path;

            $Upload->extension = 'png';
            $Upload->type = 'image/png';
            $Upload->file_name = $image_name_with_path;

            $Upload->save();

            $property->banner = $Upload->id;
        }
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
        $QuickMoveHome = QuickMoveHome::where('property_id', $property->property_id)->first();

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

        $property->listing_date = $QuickMoveHome->move_in_date;
 
        if ($property->main_image) {
            $uploaded_image = Upload::find($property->main_image);

            if ($uploaded_image) {
                $property->home_main_image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($property->banner) {
            $uploaded_image = Upload::find($property->banner);

            if ($uploaded_image) {
                $property->banner = get_storage_url($uploaded_image->file_name);
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

        $property_main_image = '';
        $property_banner = '';
        // Fetch the property along with its relationships
        $property = Property::with(['feature', 'hoa', 'school'])->findOrFail($id);

      
        if ($property->main_image) {
            $uploaded_image = Upload::find($property->main_image);

            if ($uploaded_image) {
                $property_main_image = get_storage_url($uploaded_image->file_name);
            }
        }
        if ($property->banner) {
            $uploaded_image = Upload::find($property->banner);

            if ($uploaded_image) {
                $property_banner = get_storage_url($uploaded_image->file_name);
            }
        }

        // $quickMove = QuickMoveHome::where('property_id', $property->property_id)->first();
        // if ($quickMove) {
        //     // $property->home_main_image = $property;

        //     // Process main image
        //     if ($quickMove->main_image) {
        //         $uploaded_image = Upload::find($quickMove->main_image);

        //         if ($uploaded_image) {
        //             $property_main_image = get_storage_url($uploaded_image->file_name);
        //         }
        //     }

        // }

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
            'is_open_house' => $property->is_open_house ? true : false,
            'description' => $property->description,
            'address' => $property->address,
            'city' => $property->city,
            'state' => $property->state,
            'zip_code' => $property->zip_code,
            'latitude' => $property->latitude,
            'longitude' => $property->longitude,
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
            'main_image' => $property_main_image,
            'banner' => $property_banner,
        ];

        // Merge the open house data into property data if available
        if (!empty($openHouseData)) {
            $propertyData = array_merge($propertyData, $openHouseData);
        }

        // Process additional files
        $propertyData['files'] = []; // Initialize files array

        if ($property->images) {
            $uploads = Upload::whereIn('id', json_decode($property->images))->orderBy('extension')->get(['id', 'file_original_name', 'file_name', 'extension', 'type']);

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
            if ($property->main_image) {
                $uploaded_image = Upload::find($property->main_image);

                if ($uploaded_image) {
                    $property->main_image = get_storage_url($uploaded_image->file_name);
                }
            }
            if ($property->banner) {
                $uploaded_image = Upload::find($property->banner);

                if ($uploaded_image) {
                    $property->banner = get_storage_url($uploaded_image->file_name);
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

        $property->is_open_house = $request->status == 'true' ? 1 : 0;
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

        $property->is_open_house = 0;
        $property->save();

        $OpenHouse->delete();
        return 'success';
    }
    public function fetch_customer_visits(Request $request)
    {
        // Step 1: Get distinct customer IDs
        $distinctCustomerIds = CustomerVisitingHomesHistory::select('customer_id')
            ->distinct()
            ->pluck('customer_id');

        $customerVisitsData = [];

        // Step 2: Loop through each distinct customer ID and fetch related visit records
        foreach ($distinctCustomerIds as $customerId) {
            // Fetch the customer record to get the name
            $customer_record = User::find($customerId);

            if ($customer_record) {
                // Fetch visit records for the customer
                $visits = CustomerVisitingHomesHistory::where('customer_id', $customerId)
                    ->get(['id', 'home_id', 'ip_address', 'created_at', 'customer_id']);

                // Attach the home title to each visit
                foreach ($visits as $visit) {
                    $property_record = Property::where('property_id', $visit->home_id)->first();
                    $visit->home_title = $property_record ? $property_record->title : "N/A";
                }

                // Step 3: Store the data in a structured format, including customer name
                $customerVisitsData[] = [
                    'customer_id' => $customerId,
                    'customer_name' => $customer_record->name,
                    'visits' => $visits,
                ];
            }
        }

        return $customerVisitsData;
    }

    public function clear_visited_customer_list($customer_id)
    {
        CustomerVisitingHomesHistory::where('customer_id', $customer_id)->delete();
        return "succss";
    }

    public function fetch_customer_agreements()
    {
        $agreements = CustomerAgentConnection::all();
        foreach ($agreements as $agreement) {
            $property_record = Property::where('property_id', $agreement->property_id)->first();
            $agreement->home_title = $property_record ? $property_record->title : "N/A";

            $customer_record = User::where('id', $agreement->customer_id)->first();
            $agreement->customer_name = $customer_record ? $customer_record->name : "N/A";

            $agent_record = Agent::where('id', $agreement->agent_id)->first();
            $agreement->agent_name = $agent_record ? $agent_record->name : "N/A";

        }
        return $agreements;
    }

    public function property_photo_delete($id, $property_id)
    {

        $merged_id = [];
        $property = Property::findOrFail($property_id);

        if ($property->images) {
            $merged_id = array_values(array_diff(json_decode($property->images), array($id)));
        }

        $property->images = json_encode($merged_id);

        $property->save();
        $upload = Upload::where('id', $id)->first();

        if ($upload) {
            Storage::delete($upload->file_name);
            $upload->delete();
        }

        return 'success';
    }

}
