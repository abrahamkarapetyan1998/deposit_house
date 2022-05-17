<?php

namespace App\Http\Controllers\Admin;


use App\Models\Seotool;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use App\Models\ProductClick;
use Illuminate\Support\Facades\DB;

class SeoToolController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function analytics()
    {
        $tool = Seotool::find(1);
        return view('admin.seotool.googleanalytics',compact('tool'));
    }

    public function analyticsupdate(Request $request)
    {
        $tool = Seotool::findOrFail(1);
        $tool->update($request->all());
        cache()->forget('seotools');
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);  
    }  

    public function keywords()
    {
        $tool = Seotool::find(1);
        return view('admin.seotool.meta-keywords',compact('tool'));
    }

    public function keywordsupdate(Request $request)
    {
        $tool = Seotool::findOrFail(1);
        $tool->update($request->all());
        cache()->forget('seotools');
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);  
    }
     
    public function popular(Request $request)
    {
        $check = [];
        if($request->sort){
            if($request->sort == 'click_low_to_high'){
                $type = 'asc';
                $sort = 'click_count';
                $check = [$type,$sort];
            }elseif($request->sort == 'click_high_to_low'){
                $type = 'desc';
                $sort = 'click_count';
                $check = [$type,$sort];
            }
            if($request->sort == 'sale_low_to_high'){
                $type = 'asc';
                $sort = 'sale_count';
                $check = [$type,$sort];
            }elseif($request->sort == 'sale_high_to_low'){
                $type = 'desc';
                $sort = 'sale_count';
                $check = [$type,$sort];
            }
        }
        // dd($check);
 
        $productss = ProductClick::when($check, function ($query, $check)  {
          
            return $query->orderby($check[1], $check[0]);
        })
        ->get();
       

        return view('admin.seotool.popular',compact('productss'));
    }  

}
