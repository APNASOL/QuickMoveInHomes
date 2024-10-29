<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class School extends Model
{
    use HasFactory;
    // The table associated with the model.
    protected $table = 'schools';

    // The attributes that are mass assignable.
    protected $fillable = [
        'id', 'name', 'type', 'directions_and_details',
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

    public function properties()
    {
        return $this->hasMany(Property::class);
    }
 
}
