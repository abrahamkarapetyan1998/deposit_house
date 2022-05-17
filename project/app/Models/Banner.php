<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $fillable = ['photo','link','type','language_id'];
    public $timestamps = false;

    public function language()
    {
        return $this->belongsTo('App\Models\Language')->withDefault();
    }
}
