<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyIncentive extends Model
{
    use HasFactory;
    protected $table ='property_incentives';
    public $incrementing=false;
}
