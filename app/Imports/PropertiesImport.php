<?php

namespace App\Imports;

use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\QuickMoveHome;
use App\Models\Upload;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Storage;

class PropertiesImport implements ToCollection, WithHeadingRow
{
    use Importable;

    protected $extractPath;

    public function __construct($extractPath)
    {
        $this->extractPath = $extractPath;
    }

    public function collection(Collection $rows)
    {
        DB::beginTransaction();

        try {
            foreach ($rows as $row) {
                $property = Property::where('title', $row['title'])->first();
                $isNew = false;

                if (!$property) {
                    $property = new Property();
                    $property->property_id = Str::orderedUuid();
                    $isNew = true;
                }

                $property->user_id = 1;
                $property->community_id = $row['community_id'] ?? null;
                $property->title = $row['title'] ?? null;
                $property->description = $row['description'] ?? null;
                $property->address = $row['address'] ?? null;
                $property->city = $row['city'] ?? null;
                $property->state = $row['state'] ?? null;
                $property->zip_code = $row['zip_code'] ?? null;
                $property->longitude = $row['longitude'] ?? null;
                $property->latitude = $row['latitude'] ?? null;

                $price = $row['price'];
                $price_from = $row['price_from'];
                $price_to = $row['price_to'];

                $cleanedPrice = (int) str_replace([',', '$'], '', $price);
                $cleanedPriceFrom = (int) str_replace([',', '$'], '', $price_from);
                $cleanedPriceTo = (int) str_replace([',', '$'], '', $price_to);

                $property->price = $cleanedPrice;
                $property->price_from = $cleanedPriceFrom;
                $property->price_to = $cleanedPriceTo;

                $property->full_bath = $row['full_bath'] ?? null;
                $property->half_bath = $row['half_bath'] ?? null;
                $property->average_price_per_square = $row['average_price_per_square'] ?? null;
                $property->listing_status = $row['listing_status'] ?? null;
                $property->construction_status = $row['construction_status'] ?? null;
                $property->size_from = $row['size_from'] ?? null;
                $property->size_to = $row['size_to'] ?? null;

                $property->bedrooms = $row['bedrooms'] ?? null;
                $property->square_feet = isset($row['square_feet'])
                    ? (float) preg_replace('/[^\d.]/', '', $row['square_feet'])
                    : null;

                $property->lot_size = $row['lot_size'] ?? null;
                $property->property_type = $row['property_type'] ?? null;
                $property->listing_type = $row['listing_type'] ?? null;
                $property->year_built = $row['year_built'] ?? null;
                $property->hoa_id = $row['hoa_id'] ?? null;
                $property->association_fee = $row['association_fee'] ?? null;
                $property->cic = $row['cic'] ?? null;
                $property->school_id = $row['school_id'] ?? null;
                $property->is_open_house = $row['is_open_house'] ?? null;

                $imageNames = isset($row['images']) ? explode(',', $row['images']) : [];
                $uploadedImageIds = [];

                foreach ($imageNames as $imageName) {
                    $imageName = trim($imageName);
                    $imagePath = $this->extractPath . '/' . $imageName;

                    if (file_exists($imagePath)) {
                        $newImageName = 'real_public/PropertiesFiles/' . Str::random(40) . '.' . pathinfo($imageName, PATHINFO_EXTENSION);
                        Storage::disk('real_public')->put($newImageName, file_get_contents($imagePath));

                        $upload = new Upload();
                        $upload->file_original_name = $imageName;
                        $upload->file_name = $newImageName;
                        $upload->extension = pathinfo($imageName, PATHINFO_EXTENSION);
                        $upload->type = mime_content_type($imagePath);
                        $upload->save();

                        $uploadedImageIds[] = $upload->id;
                    }
                }

                $property->images = !empty($uploadedImageIds) ? json_encode($uploadedImageIds) : null;
                $property->main_image = $uploadedImageIds[0] ?? null;
                $property->banner = $uploadedImageIds[1] ?? null;
                $property->save();

                $propertyFeature = PropertyFeature::where('property_id', $property->property_id)->first();
                if (!$propertyFeature) {
                    $propertyFeature = new PropertyFeature();
                    $propertyFeature->property_id = $property->property_id;
                }

                $propertyFeature->name = $row['feature_name'] ?? null;
                $propertyFeature->description = $row['feature_description'] ?? null;
                $propertyFeature->fireplace_type = $row['fireplace_type'] ?? null;
                $propertyFeature->kitchen_pantry_type = $row['kitchen_pantry_type'] ?? null;
                $propertyFeature->reach_in = $row['reach_in'] ?? null;
                $propertyFeature->walk_in = $row['walk_in'] ?? null;
                $propertyFeature->laundry_closet = $row['laundry_closet'] ?? null;
                $propertyFeature->closet_location = $row['closet_location'] ?? null;
                $propertyFeature->bedroom_location = $row['bedroom_location'] ?? null;
                $propertyFeature->bathroom_type = $row['bathroom_type'] ?? null;
                $propertyFeature->bathroom_status = $row['bathroom_status'] ?? null;
                $propertyFeature->pool_shape = $row['pool_shape'] ?? null;
                $propertyFeature->water_features = $row['water_features'] ?? null;
                $propertyFeature->pool_status = $row['pool_status'] ?? null;
                $propertyFeature->spa = $row['spa'] ?? null;
                $propertyFeature->fencing_material = $row['fencing_material'] ?? null;
                $propertyFeature->fencing_status = $row['fencing_status'] ?? null;
                $propertyFeature->parking_enclosure = $row['parking_enclosure'] ?? null;
                $propertyFeature->private_bath = $row['private_bath'] ?? null;
                $propertyFeature->outdoor_shower = $row['outdoor_shower'] ?? null;
                $propertyFeature->landscape_maintenance = $row['landscape_maintenance'] ?? null;
                $propertyFeature->foundation_conditions = $row['foundation_conditions'] ?? null;
                $propertyFeature->save();

                $quickMoveInHome = QuickMoveHome::where('property_id', $property->property_id)->first();
                if (!$quickMoveInHome) {
                    $quickMoveInHome = new QuickMoveHome();
                    $quickMoveInHome->id = Str::orderedUuid();
                    $quickMoveInHome->property_id = $property->property_id;
                }

                $quickMoveInHome->move_in_date = now();
                $quickMoveInHome->incentives = null;
                $quickMoveInHome->main_image = null;
                $quickMoveInHome->save();
            }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }
}
