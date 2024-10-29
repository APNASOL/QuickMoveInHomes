<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommunityLasVegasRegion extends Model
{
    use HasFactory;
    protected $keyType = 'string';
    public $incrementing = false;

    protected $fillable = ['community_id', 'las_vegas_regions_id'];
}
