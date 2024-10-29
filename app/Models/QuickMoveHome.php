<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuickMoveHome extends Model
{
    use HasFactory;
    protected $table ='quick_move_in_homes';
    public $incrementing=false;
    
}
