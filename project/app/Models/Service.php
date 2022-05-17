<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable = ['user_id','title','details','photo','language_id'];
    public $timestamps = false;
    
      public function language()
    {
        return $this->belongsTo('App\Models\Language')->withDefault();
    }
}
