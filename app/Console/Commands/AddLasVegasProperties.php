<?php

// app/Console/Commands/AddLasVegasProperties.php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\QuickMoveInHome;
use Illuminate\Support\Str;
use Carbon\Carbon;

class AddLasVegasProperties extends Command
{
    // The name and signature of the console command
    protected $signature = 'add:lasvegas-properties';

    // The console command description
    protected $description = 'Add dummy Las Vegas properties and their features into the database';

    // Execute the console command
    public function handle()
    {
        // Base latitude and longitude values for Las Vegas
        $baseLatitude = 36.1147; // Your initial latitude
        $baseLongitude = -115.1728; // Your initial longitude

        // Create locations with random offsets
        $locations = [];
        for ($i = 0; $i < 8; $i++) {
            $offsetLat = rand(-5, 5) / 10000; // Adjust the range for latitude
            $offsetLng = rand(-5, 5) / 10000; // Adjust the range for longitude
            $locations[] = [
                'latitude' => $baseLatitude + $offsetLat,
                'longitude' => $baseLongitude + $offsetLng,
            ];
        }

        // Insert 30 property records with features
        for ($i = 1; $i <= 45; $i++) {
            // Get a random location from the array
            $location = $locations[array_rand($locations)];

            // Create a new property record
            $property = Property::create([
                'property_id' => Str::orderedUuid(),  // Unique UUID for each property
                'user_id' => 1,
                'community_id' => '9d264764-2e21-4869-b7e6-692c38c02bbd',
                'title' => 'Beautiful Las Vegas Home ' . $i,
                'description' => 'This is a dummy description for home ' . $i,
                'address' => '123 Las Vegas St ' . $i,
                'city' => 'Las Vegas',
                'state' => 'NV',
                'zip_code' => rand(89101, 89199),
                'longitude' => $location['longitude'],
                'latitude' => $location['latitude'],
                'price' => rand(250000, 900000),
                'bedrooms' => rand(2, 6),
                'square_feet' => rand(1500, 4000),
                'lot_size' => rand(1, 10) / 10,  // Example: 0.1 to 1 acre
                'property_type' => 'single-family',
                'listing_type' => 'sale',
                'year_built' => rand(1990, 2020),
                'hoa_id' => '9d09b3e5-20ea-4ad4-a16d-6d328bc8750e',
                'association_fee' => rand(100, 500),
                'cic' => 1,
                'school_id' => '9d09a857-3d19-40a3-ad82-8fb3731c7fcd',
                'files' => json_encode(['file1.jpg', 'file2.jpg']),
                'is_open_house' => rand(0, 1),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);

            // Add features to the property
             
                PropertyFeature::create([
                    'property_id' => $property->property_id,  // FK from property
                    'name' => 'Feature ' . $i . ' for Home ' ,
                    'description' => 'Description for Feature ' . $i . ' of Home ',
                    'fireplace_type' => rand(0, 1) ? 'gas' : 'wood',
                    'kitchen_pantry_type' => rand(0, 1) ? 'walk-in' : 'reach-in',
                    'reach_in' => rand(0, 1),
                    'walk_in' => rand(0, 1),
                    'laundry_closet' => rand(0, 1),
                    'closet_location' => rand(0, 1) ? 'bedroom' : 'hallway',
                    'bedroom_location' => rand(0, 1) ? 'first floor' : 'second floor',
                    'bathroom_type' => rand(0, 1) ? 'full' : 'half',
                    'bathroom_status' => rand(0, 1) ? 'new' : 'renovated',
                    'pool_shape' => rand(0, 1) ? 'rectangle' : 'oval',
                    'water_features' => rand(0, 1) ? 'fountain' : 'waterfall',
                    'pool_status' => rand(0, 1) ? 'operational' : 'under maintenance',
                    'spa' => rand(0, 1),
                    'fencing_material' => rand(0, 1) ? 'wood' : 'vinyl',
                    'fencing_status' => rand(0, 1) ? 'new' : 'repaired',
                    'parking_enclosure' => rand(0, 1),
                    'private_bath' => rand(0, 1),
                    'outdoor_shower' => rand(0, 1),
                    'landscape_maintenance' => rand(0, 1),
                    'foundation_conditions' => rand(0, 1) ? 'new' : 'settled',
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
           
            
            // Insert into quick_move_in_homes
            QuickMoveInHome::create([
                'property_id' => $property->property_id,
                'move_in_date' => Carbon::now(), // or set a specific date
                'incentives' => null, // as you specified
                'main_image' => '1', // fixed main image
            ]);
        }

        $this->info('Successfully added 30 properties with features for Las Vegas homes.');
    }
}
