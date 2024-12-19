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

                // Create Property record
                $this->createProperty($propertyData);
            } catch (\Exception $e) {
                Log::error("Error processing row: " . json_encode($row) . " - " . $e->getMessage());
            }
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
            'files' => $row[21] ?? null, // files column to be updated with file IDs
            'is_open_house' => $row[22] ?? 0,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }

    /**
     * Create a Property record from the given data.
     *
     * @param array $data
     */
    private function createProperty($data)
    {
        $property = new Property();
        $property->property_id = (string) Str::uuid(); // Generate unique UUID
        $property->fill($data);
        $property->save();
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
        Log::info("Processing files from folder: " . $folderPath);
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

        Log::info('File ids');
        Log::info($uploadedFileIds);
        return $uploadedFileIds;
    }
}
