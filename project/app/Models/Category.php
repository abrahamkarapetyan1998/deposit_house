<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;

class Category extends Model
{
    protected $fillable = ['name','slug','photo','is_featured','image','serial','language'];
    public $timestamps = false;

    public function subs()
    {
    	return $this->hasMany('App\Models\Subcategory')->where('status','=',1);
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
