<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;

class BlogCategory extends Model
{
    protected $fillable = ['name', 'slug','language'];
    public $timestamps = false;

    public function blogs()
    {
    	return $this->hasMany('App\Models\Blog','category_id');
    }

    public function setSlugAttribute($value)
    {
    	$this->attributes['slug'] = str_replace(' ', '-', $value);
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
