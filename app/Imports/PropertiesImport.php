<?php

namespace App\Imports;

use App\Models\Property;
use App\Models\Upload; // Assuming this is the Upload model to handle file uploads
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\File\File; // Import the correct File class
use Carbon\Carbon;
use App\Models\PropertyFeature;
use App\Models\QuickMoveInHome;   
// use Carbon\Carbon;  
class PropertiesImport implements ToCollection
{
    /**
     * Process each row from the excel file.
     *
     * @param Collection $rows
     */
    public function collection(Collection $rows)
    {
        $rows->shift(); // Skip headers
        $baseDirectory = 'C:/Users/Lenovo/Downloads/'; // Root folder for property images

        foreach ($rows as $row) {
            $propertyData = $this->mapRowToPropertyData($row);

            try {
                // Handle file uploads and retrieve file IDs
                $folderName = $propertyData['files'] ?? null;
                if ($folderName) {
                    $uploadedFileIds = $this->handleFiles($baseDirectory, $folderName);
                    // Store file IDs in JSON format in the database
                    $propertyData['files'] = json_encode($uploadedFileIds); 
                }
 
                // Create the property record only once
                $propertyId = $this->createProperty($propertyData);
                // $this->createProperty($propertyData);
                // Create Property Feature if applicable
                if (!empty($propertyData['feature_name'])) {
                    $this->createPropertyFeature($propertyId, $propertyData);
                }

                // Create Quick Move-In Home if applicable
                if (!empty($propertyData['move_in_date'])) {
                    $this->createQuickMoveInHome($propertyId, $propertyData, $baseDirectory);
                }
                
            } catch (\Exception $e) {
                Log::error("Error processing row: " . json_encode($row) . " - " . $e->getMessage());
            }

            // Create Property record
            // $propertyId = $this->createProperty($propertyData);

            // // Create Property Feature if applicable
            // if (!empty($propertyData['feature_name'])) {
            //     $this->createPropertyFeature($propertyId, $propertyData);
            // }

            // // Create Quick Move-In Home if applicable
            // if (!empty($propertyData['move_in_date'])) {
            //     $this->createQuickMoveInHome($propertyId, $propertyData,$baseDirectory);
            // }
        }
    }

    /**
     * Map the row data to the Property model attributes.
     *
     * @param array $row
     * @return array
     */
    private function mapRowToPropertyData($row)
    {
        return [
            'user_id' => $row[0],
            'community_id' => $row[1],
            'title' => $row[2],
            'description' => $row[3] ?? null,
            'address' => $row[4],
            'city' => $row[5],
            'state' => $row[6],
            'zip_code' => $row[7],
            'longitude' => $row[8],
            'latitude' => $row[9],
            'price' => $row[10],
            'bedrooms' => $row[11],
            'square_feet' => $row[12],
            'lot_size' => $row[13],
            'property_type' => $row[14],
            'listing_type' => $row[15],
            'year_built' => $row[16],
            'hoa_id' => $row[17],
            'association_fee' => $row[18],
            'cic' => $row[19] ?? null,
            'school_id' => $row[20],
            'files' => $row[21] ?? null, // Folder name for files
            'is_open_house' => $row[22] ?? 0,
            'feature_name' => $row[23] ?? null,
            'feature_description' => $row[24] ?? null,
            'fireplace_type' => $row[25] ?? null,
            'kitchen_pantry_type' => $row[26] ?? null,
            'reach_in' => $row[27] ?? null,
            'walk_in' => $row[28] ?? null,
            'laundry_closet' => $row[29] ?? null,
            'closet_location' => $row[30] ?? null,
            'bedroom_location' => $row[31] ?? null,
            'bathroom_type' => $row[32] ?? null,
            'bathroom_status' => $row[33] ?? null,
            'pool_shape' => $row[34] ?? null,
            'water_features' => $row[35] ?? null,
            'pool_status' => $row[36] ?? null,
            'spa' => $row[37] ?? 0,
            'fencing_material' => $row[38] ?? null,
            'fencing_status' => $row[39] ?? null,
            'parking_enclosure' => $row[40] ?? null,
            'private_bath' => $row[41] ?? 0,
            'outdoor_shower' => $row[42] ?? 0,
            'landscape_maintenance' => $row[43] ?? null,
            'foundation_conditions' => $row[44] ?? null,
            'move_in_date' => $row[45] ?? null,
            'incentives' => $row[46] ?? null,
            'main_image' => $row[47] ?? null
        ];
    }

     /**
     * Creates a property record in the database.
     */
    private function createProperty($data)
    {
        $property = new Property();
        $property->property_id = (string) Str::uuid(); // Generate UUID
        $property->fill($data);
        // $property->created_at = Carbon::now();
        // $property->updated_at = Carbon::now();
        $property->save();

        return $property->property_id;
    }

    /**
     * Creates a property feature record in the database.
     */
    private function createPropertyFeature($propertyId, $data)
    {
        $feature = new PropertyFeature();
        $feature->property_id = $propertyId;
        $feature->fill([
            'name' => $data['feature_name'],
            'description' => $data['feature_description'],
            'fireplace_type' => $data['fireplace_type'],
            'kitchen_pantry_type' => $data['kitchen_pantry_type'],
            'reach_in' => $data['reach_in'],
            'walk_in' => $data['walk_in'],
            'laundry_closet' => $data['laundry_closet'],
            'closet_location' => $data['closet_location'],
            'bedroom_location' => $data['bedroom_location'],
            'bathroom_type' => $data['bathroom_type'],
            'bathroom_status' => $data['bathroom_status'],
            'pool_shape' => $data['pool_shape'],
            'water_features' => $data['water_features'],
            'pool_status' => $data['pool_status'],
            'spa' => $data['spa'],
            'fencing_material' => $data['fencing_material'],
            'fencing_status' => $data['fencing_status'],
            'parking_enclosure' => $data['parking_enclosure'],
            'private_bath' => $data['private_bath'],
            'outdoor_shower' => $data['outdoor_shower'],
            'landscape_maintenance' => $data['landscape_maintenance'],
            'foundation_conditions' => $data['foundation_conditions']
        ]);
       //  $feature->created_at = Carbon::now();
        // $feature->updated_at = Carbon::now();
        $feature->save();
    }

    /**
     * Creates a quick move-in home record in the database.
     */
    private function createQuickMoveInHome($propertyId, $data,$baseDirectory)
{
    $fileName = $data['main_image']; // Get the image file name from the data
    $folderPath = $baseDirectory . $fileName; // Path to the file in the specified folder

    // Ensure the file exists
    if (file_exists($folderPath)) {
        // Read the file contents into a base64 encoded string
        $fileContents = file_get_contents($folderPath);
        $base64EncodedFile = base64_encode($fileContents);

        // Generate a new unique image name with path
        $image_name_with_path = 'real_public/PropertiesFiles/' . Str::random(40) . '.png';

        // Save the file to storage as base64 decoded
        Storage::put($image_name_with_path, base64_decode($base64EncodedFile));

        // Save file details in the Upload model
        $upload = new Upload();
        $upload->file_original_name = $fileName; // Store the original file name
        $upload->extension = 'png'; // Set file extension (assuming it's a PNG)
        $upload->type = 'image/png'; // Set MIME type for image
        $upload->file_name = $image_name_with_path; // Save the new file path in storage
        $upload->save();
 
        // Create the QuickMoveInHome record with the uploaded image ID
        $quickMoveIn = new QuickMoveInHome();
        $quickMoveIn->property_id = $propertyId; 
        $quickMoveIn->move_in_date = Carbon::parse($data['move_in_date']);
        $quickMoveIn->incentives = $data['incentives'];
        $quickMoveIn->main_image = $upload->id; // Store the file ID
        $quickMoveIn->save();
    } else {
        // Log error or handle file not found situation
        Log::error("File not found: " . $folderPath);
    }
}


    
    /**
     * Handle file uploads from a given folder and return their IDs.
     *
     * @param string $baseDirectory
     * @param string|null $folderName
     * @return array
     */
    private function handleFiles($baseDirectory, $folderName)
    {
        $folderPath = $baseDirectory . $folderName;
         
        $uploadedFileIds = [];

        // Check if the folder exists
        if (!is_dir($folderPath)) {
            Log::error("Folder not found: " . $folderPath);
            return [];
        }

        // Iterate through all files in the folder
        $files = scandir($folderPath);
        foreach ($files as $file) {
            if ($file === '.' || $file === '..') {
                continue;
            }

            $filePath = $folderPath . '/' . $file;

            try {
                // Read the file contents into a base64 encoded string
                $fileContents = file_get_contents($filePath);
                $base64EncodedFile = base64_encode($fileContents);
    
                // Create a new image name with path
            $image_name_with_path = 'real_public/PropertiesFiles/' . Str::random(40) . '.png';
    
                // Save the file to storage
                Storage::put($image_name_with_path, base64_decode($base64EncodedFile));
    
                // Save file details in the Upload model
                $upload = new Upload();
                $upload->file_original_name = $image_name_with_path;
                $upload->extension = 'png';
                $upload->type = 'image/png';
                $upload->file_name = $image_name_with_path;
                $upload->save();
                 
                // Store the file ID
                $uploadedFileIds[] = $upload->id;
    
            }  catch (\Exception $e) {
                Log::error("Error uploading file: " . $filePath . " - " . $e->getMessage());
            }
        }  
        return $uploadedFileIds;
    }
}
