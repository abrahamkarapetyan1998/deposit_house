<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WithdrawMethod extends Model
{
    public $timestamps = false;
    protected $fillable = ['title', 'status',];

}
