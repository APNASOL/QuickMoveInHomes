<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Builder extends Model
{
    use HasFactory;
    protected $table = 'builders';
    
    // The attributes that are mass assignable.
    protected $fillable = [
        'id', 'name', 'description', 'communities',
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
    // public $incrementing = false;

    // The "type" of the primary key ID.
    protected $keyType = 'string';

  

    
}
