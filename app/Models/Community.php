<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Community extends Model
{
    use HasFactory;

    protected $table = 'communities';
    // The attributes that are mass assignable.
    protected $fillable = [
        'id', 'builder_id','community_id','name', 'description', 'location', 'amenity_id', 'hoa_id', 'neighborhood_id', 'las_vegas_region_id','longitude','latitude',
        'files', 'map_location', 'legal_subdivision', 'nearby_properties', 'masterplan', 'sub_association', 'cic',
        'lid', 'cid', 'sid_lid_fee', 'sid_lid_payment_frequency', 'proximity_to_strip', 'proximity_to_airport',
        'nearby_attractions',
    ];
    // Automatically generate UUID for the primary key.
    // protected static function boot()
    // {
    //     parent::boot();

    //     static::creating(function ($model) {
    //         if (empty($model->id)) {
    //             $model->id = (string) Str::orderedUuid();
    //         }
    //     });
    // }

    // Indicate that the primary key is not auto-incrementing.
    public $incrementing = false;

    // The "type" of the primary key ID.
    protected $keyType = 'string';

    // Relationships
    public function amenity()
    {
        return $this->belongsTo(Amenity::class, 'amenity_id');
    }

    public function hoa()
    {
        return $this->belongsTo(Hoa::class, 'hoa_id');
    }

    public function neighborhood()
    {
        return $this->belongsTo(Neighborhood::class, 'neighborhood_id');
    }

    public function lasVegasRegion()
    {
        return $this->belongsTo(LasVegasRegion::class, 'las_vegas_region_id');
    }

    // Define the relationship with the Builder model
    public function builders()
    {
        return $this->belongsToMany(Builder::class, 'builders_communities', 'community_id', 'builder_id');
    }

    public function properties()
    {
        return $this->hasMany(Property::class, 'community_id');
    }
}
