<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    protected $fillable = ['user_id', 'title', 'subtitle', 'price','form_weght','to_weght','email'];

    public $timestamps = false;

}