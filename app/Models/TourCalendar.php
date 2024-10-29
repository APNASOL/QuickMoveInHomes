<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TourCalendar extends Model
{
    use HasFactory;
     // for uuid
    public $incrementing=false;
    protected $table = "tours_calendar";
    protected $dates = [
        'start_date',
        'end_date',
    ];
}
