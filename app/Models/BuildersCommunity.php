<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BuildersCommunity extends Model
{
    use HasFactory;

    protected $table = 'builders_communities';

    // If you want to define relationships:
    public function builder()
    {
        return $this->belongsTo(Builder::class, 'builder_id');
    }

    public function community()
    {
        return $this->belongsTo(Community::class, 'community_id');
    }
}

