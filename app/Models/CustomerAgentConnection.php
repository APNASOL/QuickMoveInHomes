<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerAgentConnection extends Model
{
    use HasFactory;

     // Indicate that the primary key is not auto-incrementing.
     public $incrementing = false;
     protected $table = 'customer_agents_connections';
}
