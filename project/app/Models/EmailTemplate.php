<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmailTemplate extends Model
{
    protected $fillable = ['email_type', 'email_subject', 'email_body', 'status','language_id'];
    public $timestamps = false;

    public function language()
    {
       return $this->belongsTo('App\Models\Language');
    }
}
