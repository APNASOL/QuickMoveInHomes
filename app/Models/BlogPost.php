<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory; 

class BlogPost extends Model
{ 
    protected $table ='blog_posts';
    public $incrementing=false;
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
}
