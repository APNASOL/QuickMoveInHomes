<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Property extends Model
{
    use HasUuids;

    protected $primaryKey = 'property_id';
    public $incrementing = false;
    protected $keyType = 'uuid';

   
    protected $fillable = [
        'property_id', 'user_id', 'community_id', 'title', 'description', 'address', 'city',
        'state', 'zip_code', 'longitude', 'latitude', 'price', 'bedrooms', 'square_feet',
        'lot_size', 'property_type', 'listing_type', 'year_built', 'hoa_id', 'association_fee',
        'cic', 'school_id', 'files', 'is_open_house', 'created_at', 'updated_at'
    ];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

     
    public function feature()
    {
        return $this->hasOne(PropertyFeature::class, 'property_id');
    }

     
    public function hoa()
    {
        return $this->belongsTo(HOA::class, 'hoa_id');
    }

    public function school()
    {
        return $this->belongsTo(School::class, 'school_id');
    }

     
    public function quickMoveInHomes(): HasMany
    {
        return $this->hasMany(QuickMoveInHome::class, 'property_id', 'property_id');
    }
}
