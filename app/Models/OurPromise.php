<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OurPromise extends Model
{
    use HasFactory;
    protected $table ='our_promises';
    public $incrementing = false;
}
