<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class QuickMoveInHome extends Model
{
    // Use UUIDs instead of auto-incrementing integers
    protected $keyType = 'string';
    public $incrementing = false;

    // Specify fillable fields
    protected $fillable = ['id', 'property_id', 'move_in_date', 'incentives'];

    // Automatically generate a UUID when creating a new record
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = (string) Str::uuid();
            }
        });
    }

    /**
     * Relationship: Each QuickMoveInHome belongs to a Property
     */
    public function property(): BelongsTo
    {
        return $this->belongsTo(Property::class, 'property_id', 'property_id');
    }
}
