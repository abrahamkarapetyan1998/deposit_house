<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SmsTemplete extends Model
{
    protected $fillable = ['sms_type', 'sms_subject', 'sms_body', 'status','language_id'];
    public $timestamps = false;

    public function language()
    {
       return $this->belongsTo('App\Models\Language');
    }
}
