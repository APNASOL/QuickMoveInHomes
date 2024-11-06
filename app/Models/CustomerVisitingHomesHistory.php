<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerVisitingHomesHistory extends Model
{
    use HasFactory; 
    public $incrementing = false;
    protected $table = 'customer_visiting_homes_history';
}
