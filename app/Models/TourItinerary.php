<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TourItinerary extends Model
{
    use HasFactory;
    // for uuid
    public $incrementing = false;
    protected $table ='tours_itinerary';
    
    
}