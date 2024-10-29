<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{
    use HasFactory;

     // Indicate that the primary key is not auto-incrementing.
     public $incrementing = false;
    protected $fillable = [
        'agent_name',
        'agency_name',
        'license_number',
        'specialties',
        'biography',
        'experience',
        'languages',
        'contact',
    ];
}
