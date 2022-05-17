<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductClick extends Model
{
	protected $table = 'product_clicks';
	protected $fillable = ['product_id'];
	public $timestamps = false;
    public function product()
    {
        return $this->belongsTo('App\Models\Product')->withDefault();
    }


	public static function Click_Sale_Count($product_id,$type)
	{
		if(ProductClick::whereProductId($product_id)->exists()){
			$data = ProductClick::whereProductId($product_id)->first();
			if(($type == 'click')){
				$data->click_count = $data->click_count + 1;
			}else{
				$data->sale_count = $data->sale_count + 1;
			}
			$data->update();
		}else{
			$product_click =  new ProductClick;
			$product_click->product_id = $product_id;
			$product_click->click_count = 1;
			if(($type == 'click')){
				$product_click->click_count =  1;
			}else{
				$product_click->sale_count =  1;
			}
			$product_click->save();
		}
		
	}


	public static function saleCount($cart)
	{
		foreach($cart['items'] as $item){
			self::Click_Sale_Count($item['item']['id'],'sale');
		}
	}
}
