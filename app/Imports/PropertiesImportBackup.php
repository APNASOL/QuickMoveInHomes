<?php

namespace App\Imports;

use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\QuickMoveInHome;
use App\Models\Upload; // Assuming this is the Upload model to handle file uploads
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class PropertiesImport implements ToCollection
{
    public function collection(Collection $rows)
    {
        // Skip the first row (headers)
        $rows->shift();

        $baseDirectory = 'C:/Downloads/'; // Path to the directory containing files

        foreach ($rows as $row) {
            $propertyData = $this->mapRowToPropertyData($row);

            // Handle file uploads
            $folderName = $propertyData['files'] ?? null;
            if ($folderName) {
                $uploadedFileIds = $this->handleFiles($baseDirectory, $folderName);
                $propertyData['files'] = json_encode($uploadedFileIds);
            }

            // Create Property record
            $propertyId = $this->createProperty($propertyData);

            // Create Property Feature if applicable
            if (!empty($propertyData['feature_name'])) {
                $this->createPropertyFeature($propertyId, $propertyData);
            }

            // Create Quick Move-In Home if applicable
            if (!empty($propertyData['move_in_date'])) {
                $this->createQuickMoveInHome($propertyId, $propertyData);
            }
        }
    }

    /**
     * Maps a row from the Excel file to property data.
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
        $property->created_at = Carbon::now();
        $property->updated_at = Carbon::now();
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
        $feature->created_at = Carbon::now();
        $feature->updated_at = Carbon::now();
        $feature->save();
    }

    /**
     * Creates a quick move-in home record in the database.
     */
    private function createQuickMoveInHome($propertyId, $data)
    {
        $quickMoveIn = new QuickMoveInHome();
        $quickMoveIn->property_id = $propertyId;
        $quickMoveIn->move_in_date = Carbon::parse($data['move_in_date']);
        $quickMoveIn->incentives = $data['incentives'];
        $quickMoveIn->main_image = $data['main_image'];
        $quickMoveIn->save();
    }

    /**
     * Handles file uploads for a given folder.
     */
    private function handleFiles($baseDirectory, $folderName)
    {
        Log::info($baseDirectory);
        Log::info($folderName);
        $fileIds = [];
        $folderPath = realpath($baseDirectory . $folderName);

        if (!is_dir($folderPath)) {
            Log::warning("Folder does not exist: " . $folderPath);
            return $fileIds;
        }

        $files = scandir($folderPath);
        foreach ($files as $file) {
            if ($file === '.' || $file === '..') {
                continue;
            }

            $filePath = $folderPath . DIRECTORY_SEPARATOR . $file;
            if (is_file($filePath)) {
                $upload = new Upload();
                $upload->file_original_name = $file;
                $upload->file_name = 'real_public/PropertiesFiles/' . $file;
                $upload->file_size = filesize($filePath);
                $upload->extension = pathinfo($file, PATHINFO_EXTENSION);
                $upload->type = mime_content_type($filePath);
                $upload->save();

                $fileIds[] = $upload->id;
            } else {
                Log::warning("Skipped non-file: " . $filePath);
            }
        }

        return $fileIds;
    }
}
