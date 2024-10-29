<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyFeature extends Model
{
    use HasFactory;

    protected $table = 'property_features'; // Specify the table name
    protected $primaryKey = 'feature_id'; // Set the primary key
    public $incrementing = false; // Disable auto-incrementing for UUID
    protected $keyType = 'uuid'; // Set the key type to UUID

    protected $fillable = [
        'property_id',
        'name',
        'description',
        'fireplace_type',
        'kitchen_pantry_type',
        'reach_in',
        'walk_in',
        'laundry_closet',
        'closet_location',
        'bedroom_location',
        'bathroom_type',
        'bathroom_status',
        'pool_shape',
        'water_features',
        'pool_status',
        'spa',
        'fencing_material',
        'fencing_status',
        'parking_enclosure',
        'private_bath',
        'outdoor_shower',
        'landscape_maintenance',
        'foundation_conditions',
    ];

    
    // Define the relationship with Property
    public function property()
    {
        return $this->belongsTo(Property::class, 'property_id', 'property_id');
    }
}
