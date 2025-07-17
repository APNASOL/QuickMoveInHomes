<?php

namespace App\Imports;

use App\Models\Community;
use App\Models\Upload;
use App\Models\CommunityLasVegasRegion;
use App\Models\CommunityNeighborhood;
use App\Models\CommunityAmenity;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class CommunitiesImport implements ToCollection, WithHeadingRow
{
    use Importable;

    protected $extractPath;

    public function __construct($extractPath)
    {
        $this->extractPath = rtrim($extractPath, '/'); // Ensure clean path format
        Log::info("CommunitiesImport initialized with extract path: " . $this->extractPath);
    }

    public function collection(Collection $rows)
    {
        Log::info("Starting communities import process.");
        DB::beginTransaction();

        try {
            foreach ($rows as $row) {
                if (empty($row['name'])) {
                    Log::warning("Skipping row with missing name: " . json_encode($row->toArray()));
                    continue;
                }

                Log::info("Processing row: " . json_encode($row->toArray()));

                $community = new Community();
                $community->id = Str::orderedUuid();
                $community->name = $row['name'] ?? null;
                $community->description = $row['description'] ?? null;
                $community->location = $row['location'] ?? null;
                $community->longitude = $row['longitude'] ?? null;
                $community->latitude = $row['latitude'] ?? null;
                $community->map_location = $row['map_location'] ?? null;
                $community->legal_subdivision = $row['legal_subdivision'] ?? null;
                $community->nearby_properties = $row['nearby_properties'] ?? null;
                $community->masterplan = $row['masterplan'] ?? null;
                $community->sub_association = $row['sub_association'] ?? null;
                $community->cic = $row['cic'] ?? null;
                $community->lid = $row['lid'] ?? null;
                $community->cid = $row['cid'] ?? null;
                $community->sid_lid_fee = $row['sid_lid_fee'] ?? null;
                $community->sid_lid_payment_frequency = $row['sid_lid_payment_frequency'] ?? null;
                $community->proximity_to_strip = $row['proximity_to_strip'] ?? null;
                $community->proximity_to_airport = $row['proximity_to_airport'] ?? null;
                $community->nearby_attractions = $row['nearby_attractions'] ?? null;
                $community->hoa_id = $row['hoa_id'] ?? null;
                // $community->las_vegas_region_id = $row['las_vegas_region_id'] ?? null;
                // $community->neighborhood_id = $row['neighborhood_id'] ?? null;
                // $community->amenity_id = $row['amenity_id'] ?? null;
                $community->save();
                Log::info("Community saved: " . $community->id);

                // if (!empty($row['las_vegas_region_id'])) {
                //     CommunityLasVegasRegion::create([
                //         'id' => Str::orderedUuid(), // Ensure 'id' is set
                //         'community_id' => $community->id,
                //         'las_vegas_regions_id' => $row['las_vegas_region_id'],
                //     ]);
                // }
                
                
                // if (!empty($row['neighborhood_id'])) {
                //     CommunityNeighborhood::create([
                //         'id' => Str::orderedUuid(), // Generate a new UUID for the id
                //         'community_id' => $community->id,
                //         'neighborhood_id' => $row['neighborhood_id'],
                //     ]);
                // }
                
                // if (!empty($row['amenity_id'])) {
                //     CommunityAmenity::create([
                //         'id' => Str::orderedUuid(), // Generate a new UUID for the id
                //         'community_id' => $community->id,
                //         'amenity_id' => $row['amenity_id'],
                //     ]);
                // }

                 // Handle las_vegas_region_id (multiple values possible)
                 if (!empty($row['las_vegas_region_id'])) {
                    $regions = array_map('trim', explode(',', $row['las_vegas_region_id']));
                    foreach ($regions as $region) {
                        CommunityLasVegasRegion::create([
                            'id' => Str::orderedUuid(), // Generate a new UUID for the id
                            'community_id' => $community->id,
                            'las_vegas_regions_id' => $region,
                        ]);
                    }
                }

                // Handle neighborhood_id (multiple values possible)
                if (!empty($row['neighborhood_id'])) {
                    $neighborhoods = array_map('trim', explode(',', $row['neighborhood_id']));
                    foreach ($neighborhoods as $neighborhood) {
                        CommunityNeighborhood::create([
                            'id' => Str::orderedUuid(), // Generate a new UUID for the id
                            'community_id' => $community->id,
                            'neighborhood_id' => $neighborhood,
                        ]);
                    }
                }

                // Handle amenity_id (multiple values possible)
                if (!empty($row['amenity_id'])) {
                    $amenities = array_map('trim', explode(',', $row['amenity_id']));
                    foreach ($amenities as $amenity) {
                        CommunityAmenity::create([
                            'id' => Str::orderedUuid(), // Generate a new UUID for the id
                            'community_id' => $community->id,
                            'amenity_id' => $amenity,
                        ]);
                    }
                }
                

                // Handle files
                $imageNames = isset($row['files']) ? array_map('trim', explode(',', $row['files'])) : [];
                $uploadedImageIds = [];

                foreach ($imageNames as $imageName) {
                    $imagePath = $this->extractPath . '/' . $imageName;
                    if (file_exists($imagePath)) {
                        $newImageName = 'real_public/CommunitiesFiles/' . Str::random(40) . '.' . pathinfo($imageName, PATHINFO_EXTENSION);
                        Storage::put($newImageName, file_get_contents($imagePath));

                        $upload = new Upload();
                        $upload->file_original_name = $imageName;
                        $upload->file_name = $newImageName;
                        $upload->file_size = filesize($imagePath);
                        $upload->extension = pathinfo($imageName, PATHINFO_EXTENSION);
                        $upload->type = mime_content_type($imagePath);
                        $upload->save();
                        $uploadedImageIds[] = $upload->id;
                    }
                }

                $community->files = !empty($uploadedImageIds) ? json_encode($uploadedImageIds) : null;
                $community->main_image = $uploadedImageIds[0] ?? null;
                $community->banner = $uploadedImageIds[1] ?? null;
                // $community->save();
            }
            
            DB::commit();
            Log::info("Communities import process completed successfully.");
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Error during import: " . $e->getMessage());
            throw $e;
        }
    }
}
