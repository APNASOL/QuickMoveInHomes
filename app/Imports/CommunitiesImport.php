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
        $this->extractPath = rtrim($extractPath, '/');
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

                $community = Community::find($row['id']) ?? new Community();

                if ($community->exists) {
                    CommunityLasVegasRegion::where('community_id', $community->id)->delete();
                    CommunityNeighborhood::where('community_id', $community->id)->delete();
                    CommunityAmenity::where('community_id', $community->id)->delete();

                    if ($community->files) {
                        $oldImageIds = json_decode($community->files, true);
                        Upload::whereIn('id', $oldImageIds)->get()->each(function ($upload) {
                            Storage::delete($upload->file_name);
                            $upload->delete();
                        });
                    }
                } else {
                     $community->id = Str::orderedUuid();
                }

                   Log::info("builder_id: " . $row['builder_id']);
                   Log::info("builder_id: " . $row['builder_id']);


                $community->fill([ 
                    'community_id' => $row['community_id'] ?? null,
                    'builder_id' => $row['builder_id'] ?? null,
                    'name' => $row['name'] ?? null,
                    'description' => $row['description'] ?? null,
                    'location' => $row['location'] ?? null,
                    'longitude' => $row['longitude'] ?? null,
                    'latitude' => $row['latitude'] ?? null,
                    'map_location' => $row['map_location'] ?? null,
                    'legal_subdivision' => $row['legal_subdivision'] ?? null,
                    'nearby_properties' => $row['nearby_properties'] ?? null,
                    'masterplan' => $row['masterplan'] ?? null,
                    'sub_association' => $row['sub_association'] ?? null,
                    'cic' => $row['cic'] ?? null,
                    'lid' => $row['lid'] ?? null,
                    'cid' => $row['cid'] ?? null,
                    'sid_lid_fee' => $row['sid_lid_fee'] ?? null,
                    'sid_lid_payment_frequency' => $row['sid_lid_payment_frequency'] ?? null,
                    'proximity_to_strip' => $row['proximity_to_strip'] ?? null,
                    'proximity_to_airport' => $row['proximity_to_airport'] ?? null,
                    'nearby_attractions' => $row['nearby_attractions'] ?? null,
                    'hoa_id' => $row['hoa_id'] ?? null
                ]);
                $community->save();

                foreach ([
    'las_vegas_region_id' => ['model' => CommunityLasVegasRegion::class, 'column' => 'las_vegas_regions_id', 'refTable' => 'las_vegas_regions'],
    'neighborhood_id' => ['model' => CommunityNeighborhood::class, 'column' => 'neighborhood_id', 'refTable' => 'neighborhoods'],
    'amenity_id' => ['model' => CommunityAmenity::class, 'column' => 'amenity_id', 'refTable' => 'amenities'],
] as $field => $config) {
    Log::info("Model: " . $config['model'] . " for field: " . $field);

    if (!empty($row[$field])) {
        foreach (array_map('trim', explode(',', $row[$field])) as $val) {
            $val = trim($val); // clean spaces
            if (!empty($val) && strtolower($val) !== 'null' && DB::table($config['refTable'])->where('id', $val)->exists()) {
                $config['model']::create([
                    'id' => Str::orderedUuid(),
                    'community_id' => $community->id,
                    $config['column'] => $val,
                ]);
            } else {
                Log::warning("Skipped {$field} value: '{$val}' — invalid or not found in {$config['refTable']}");
            }
        }
    }
}


                // $imageNames = isset($row['files']) ? array_map('trim', explode(',', $row['files'])) : [];
                // $uploadedImageIds = [];

                // foreach ($imageNames as $imageName) {
                //     $imagePath = $this->extractPath . '/' . $imageName;
                //     if (file_exists($imagePath)) {
                //         $newImageName = 'real_public/CommunitiesFiles/' . Str::random(40) . '.' . pathinfo($imageName, PATHINFO_EXTENSION);
                //         Storage::put($newImageName, file_get_contents($imagePath));

                //         $upload = Upload::create([
                //             'file_original_name' => $imageName,
                //             'file_name' => $newImageName,
                //             'file_size' => filesize($imagePath),
                //             'extension' => pathinfo($imageName, PATHINFO_EXTENSION),
                //             'type' => mime_content_type($imagePath),
                //         ]);
                //         $uploadedImageIds[] = $upload->id;
                //     }
                // }
$imageNames = isset($row['files'])
    ? array_filter(array_map('trim', explode(',', preg_replace('/,\s+/', ',', $row['files']))))
    : [];
$mainImageName = trim($row['main_image'] ?? '');
$bannerImageName = trim($row['banner'] ?? '');

$allImages = array_filter(array_merge([$mainImageName, $bannerImageName], $imageNames), function ($img) {
    return !empty($img) && strtolower($img) !== 'null';
});

if (empty($allImages)) {
    Log::info("No valid images found for community: " . ($row['name'] ?? 'N/A') . ", skipping image upload.");
    $community->files = null;
    $community->main_image = null;
    $community->banner = null;
    $community->save();
    continue; // Skip the image upload block
}

$uploadedImageIds = [];

foreach ($allImages as $imageName) {
    $imagePath = $this->extractPath . '/' . $imageName;

    if (file_exists($imagePath)) {
        $newImageName = 'real_public/CommunitiesFiles/' . Str::random(40) . '.' . pathinfo($imageName, PATHINFO_EXTENSION);
        Storage::put($newImageName, file_get_contents($imagePath));

        $upload = Upload::create([
            'file_original_name' => $imageName,
            'file_name' => $newImageName,
            'file_size' => filesize($imagePath),
            'extension' => pathinfo($imageName, PATHINFO_EXTENSION),
            'type' => mime_content_type($imagePath),
        ]);

        $uploadedImageIds[] = $upload->id;
    } else {
        Log::warning("Image not found: {$imagePath}");
    }
}

$community->files = !empty($uploadedImageIds) ? json_encode($uploadedImageIds) : null;
$community->main_image = $uploadedImageIds[0] ?? null;
$community->banner = $uploadedImageIds[1] ?? null;
$community->save();

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