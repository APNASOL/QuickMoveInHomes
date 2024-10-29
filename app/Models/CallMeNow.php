<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CallMeNow extends Model
{
    use HasFactory;
    protected $table ='call_me_now';
    public $incrementing=false;
}
