<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str; // 🔹 Ensure this is imported

class CommunityNeighborhood extends Model
{
    use HasFactory;

    protected $keyType = 'string';
    public $incrementing = false;

    protected $fillable = ['id', 'community_id', 'neighborhood_id']; // 🔹 Include 'id' in fillable

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            if (empty($model->id)) {
                $model->id = Str::orderedUuid(); // 🔹 Generate a UUID if missing
            }
        });
    }
}
