<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;

class Subcategory extends Model
{
    protected $fillable = ['category_id','name','slug','language'];
    public $timestamps = false;

    public function childs()
    {
    	return $this->hasMany('App\Models\Childcategory')->where('status','=',1);
    }

    public function category()
    {
    	return $this->belongsTo('App\Models\Category')->withDefault(function ($data) {
			foreach($data->getFillable() as $dt){
				$data[$dt] = __('Deleted');
			}
		});
    }

    public function products()
    {
        return $this->hasMany('App\Models\Product');
    }

    public function setSlugAttribute($value)
    {
        $this->attributes['slug'] = str_replace(' ', '-', $value);
    }

    public function attributes() {
        return $this->morphMany('App\Models\Attribute', 'attributable');
    }


    public function name()
    {
        if(Session::has('language')){
            $language = Language::findOrFail(Session::get('language'));
        }else{
            $language = Language::whereIsDefault(1)->first();
        }
        $names = json_decode($this->language,true);
        if($names){
            foreach($names as $key => $name){
                if($key==$language->id){
                    return $name;
                    break;
                }
            }
        }
       
       return $this->name;
    }

}
