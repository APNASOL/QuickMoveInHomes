<?php

namespace App\Imports;

use App\Models\Property;
use App\Models\Upload;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Concerns\Importable;
// use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\ToCollection;
use Storage;

class PropertiesImport implements ToCollection
{
    use Importable;

    protected $extractPath;

    public function __construct($extractPath)
    {
        $this->extractPath = $extractPath; // Store the extraction path
        // Log::info('Extract path: ' . $this->extractPath);
    }

    public function collection(Collection $rows)
    {
        DB::beginTransaction(); // Start a transaction to ensure data consistency

        try {
            // Skip the first row if it's the header row
            $rows = $rows->skip(1); // Skip the first row

            foreach ($rows as $row) { 

                // Check if the row contains valid data
                if (!isset($row[0], $row[1], $row[2], $row[3], $row[4], $row[5])) {
                    // Log::warning('Skipping row due to missing data: ' . json_encode($row));
                    continue; // Skip invalid rows
                }

                // Handle property data
                $property = new Property();
                $property->property_id = Str::orderedUuid();
                $property->user_id = $row[0]; // user_id (first column)
                $property->community_id = $row[1]; // community_id (second column)
                $property->title = $row[2]; // title (third column)
                $property->description = $row[3]; // description (fourth column)
                $property->address = $row[5]; // address (fifth are images and sixth column)
                $property->latitude = $row[6]; // latitude (9th column)
                $property->longitude = $row[7]; // longitude (8th column)
                $property->price = $row[8]; // price (10th column)
                $property->save();

                // Process images
                $imageNames = explode(',', $row[4]); // images (fifth column)
                $uploadedImageIds = [];

                foreach ($imageNames as $imageName) {
                    // Log::info("images ".$imageName);
                    $imageName = trim($imageName); // Remove any extra spaces
                    $imagePath = $this->extractPath . '/' . $imageName; // Get the full path of the image

                    // Check if the image exists in the extracted folder
                    if (file_exists($imagePath)) {
                        // Create a new name for the image and store it
                        $newImageName = 'real_public/PropertiesFiles/' . Str::random(40) . '.' . pathinfo($imageName, PATHINFO_EXTENSION);

                        // Store the image in real_public disk
                        Storage::disk('real_public')->put($newImageName, file_get_contents($imagePath));

                        // Save image details in the Upload model
                        $upload = new Upload();
                        $upload->file_original_name = $imageName;
                        $upload->file_name = $newImageName;
                        $upload->extension = pathinfo($imageName, PATHINFO_EXTENSION);
                        $upload->type = mime_content_type($imagePath);
                        $upload->save();

                        // Add the image ID to the uploaded images array
                        $uploadedImageIds[] = $upload->id;
                    } else {
                        // Log missing image file
                        // Log::error("Image file not found: " . $imagePath);
                    }
                }

                // Associate images with the property
                $property->images = json_encode($uploadedImageIds); // Store image IDs in JSON format
                $property->save();
            }

            DB::commit(); // Commit the transaction
        } catch (\Exception $e) {
            DB::rollBack(); // Rollback the transaction in case of error
            // Log::error('Error importing properties: ' . $e->getMessage());
            throw $e; // Rethrow the exception
        }
    }

}
