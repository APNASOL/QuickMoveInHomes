<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Amenity extends Model
{
    use HasFactory;
    protected $table = 'amenities';
    
    // The attributes that are mass assignable.
    protected $fillable = [
        'id', 'name', 'description',
    ];

    // Automatically generate UUID for the primary key.
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->id)) {
                $model->id = (string) Str::orderedUuid();
            }
        });
    }

    // Indicate that the primary key is not auto-incrementing.
    public $incrementing = false;

    // The "type" of the primary key ID.
    protected $keyType = 'string';

    // Relationships
    public function communities()
    {
        return $this->hasMany(Community::class, 'amenity_id');
    }
}
