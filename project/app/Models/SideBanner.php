<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SideBanner extends Model
{
    
    protected $fillable = ['best_seller_banner','best_seller_banner_link','best_seller_banner1','best_seller_banner_link1','big_save_banner','big_save_banner_link','big_save_banner1','big_save_banner_link1','language_id'];
    public $timestamps = false;
    public function bannerupload($name,$file,$oldname)
    {
                $file->move('assets/images/test',$name);
                if($oldname != null)
                {
                    if (file_exists(public_path().'/assets/images/'.$oldname)) {
                        unlink(public_path().'/assets/images/'.$oldname);
                    }
                }  
    }

}
