<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderShippings extends Model
{
    protected $table = "order_shippings";

    protected $fillable = ['order_id', 'vendor_id', 'shipping_id'];

    public $timestamps = false;

    
}
