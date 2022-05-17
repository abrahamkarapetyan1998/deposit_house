<?php

namespace App\Http\Controllers\Admin;
use App\Models\Pagesetting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use App\Models\SideBanner;
use App\Models\Language;
use Illuminate\Support\Str;
use Validator;


class PageSettingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }


    protected $rules =
    [
        'best_seller_banner' => 'mimes:jpeg,jpg,png,svg',
        'big_save_banner'    => 'mimes:jpeg,jpg,png,svg',
        'best_seller_banner1' => 'mimes:jpeg,jpg,png,svg',
        'big_save_banner1'    => 'mimes:jpeg,jpg,png,svg'
    ];


    protected $customs =
    [
        'best_seller_banner.mimes'  => 'Photo type must be in jpeg, jpg, png, svg.',
        'big_save_banner.mimes'     => 'Photo type must be in jpeg, jpg, png, svg.',
        'best_seller_banner1.mimes' => 'Photo type must be in jpeg, jpg, png, svg.',
        'big_save_banner1.mimes'    => 'Photo type must be in jpeg, jpg, png, svg.'
      
    ];


    // Page Settings All post requests will be done in this method
    public function update(Request $request)
    {

        //--- Validation Section
        $validator = Validator::make($request->all(), $this->rules,$this->customs);

        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Pagesetting::findOrFail(1);
        $input = $request->all();
        
            if ($file = $request->file('best_seller_banner')) 
            {              
                $name = time().str_replace(' ', '', $file->getClientOriginalName());
                $data->upload($name,$file,$data->best_seller_banner);
                $input['best_seller_banner'] = $name;
            }    
            if ($file = $request->file('big_save_banner')) 
            {              
                $name = time().str_replace(' ', '', $file->getClientOriginalName());
                $data->upload($name,$file,$data->big_save_banner);           
                $input['big_save_banner'] = $name;
            } 

            if ($file = $request->file('best_seller_banner1')) 
            {              
                $name = time().str_replace(' ', '', $file->getClientOriginalName());
                $data->upload($name,$file,$data->best_seller_banner1);
                $input['best_seller_banner1'] = $name;
            }    
            if ($file = $request->file('big_save_banner1')) 
            {              
                $name = time().str_replace(' ', '', $file->getClientOriginalName());
                $data->upload($name,$file,$data->big_save_banner1);           
                $input['big_save_banner1'] = $name;
            } 


        $data->update($input);
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);      
    }


    public function homeupdate(Request $request)
    {
        $data = Pagesetting::findOrFail(1);
        $input = $request->all();
        
        if ($request->slider == ""){
            $input['slider'] = 0;
        }
        if ($request->service == ""){
            $input['service'] = 0;
        }
        if ($request->featured == ""){
            $input['featured'] = 0;
        }
        if ($request->small_banner == ""){
            $input['small_banner'] = 0;
        }
        if ($request->best == ""){
            $input['best'] = 0;
        }
        if ($request->top_rated == ""){
            $input['top_rated'] = 0;
        }
        if ($request->large_banner == ""){
            $input['large_banner'] = 0;
        }
        if ($request->big == ""){
            $input['big'] = 0;
        }
        if ($request->hot_sale == ""){
            $input['hot_sale'] = 0;
        }
        if ($request->review_blog == ""){
            $input['review_blog'] = 0;
        }
        if ($request->partners == ""){
            $input['partners'] = 0;
        }
        if ($request->bottom_small == ""){
            $input['bottom_small'] = 0;
        }
        if ($request->flash_deal == ""){
            $input['flash_deal'] = 0;
        }
        if ($request->featured_category == ""){
            $input['featured_category'] = 0;
        }
        $data->update($input);
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);      
    }


    public function contact()
    {
        $data = Pagesetting::find(1);   
        return view('admin.pagesetting.contact',compact('data'));
    }

    public function customize()
    {
        $data = Pagesetting::find(1);   
        return view('admin.pagesetting.customize',compact('data'));
    }

    public function best_seller(Request $request)
    {
        if($request->language){
            $language = $request->language;
        }else{
            $language = Language::whereIsDefault(1)->first()->id;
        }
        
        $data = SideBanner::where('language_id',$language)->first(); 
       
        return view('admin.pagesetting.best_seller',compact('data','language'));
    }


    public function sideBannerSubmit(Request $request)
    {
        $input = $request->except('_token');
       
        $data = SideBanner::where('language_id',$request->language_id)->first();
        
        if($data){
            if ($file = $request->file('best_seller_banner')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->best_seller_banner);
                $input['best_seller_banner'] = $name;
            }    
            if ($file = $request->file('big_save_banner')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->big_save_banner);           
                $input['big_save_banner'] = $name;
            } 

            if ($file = $request->file('best_seller_banner1')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->best_seller_banner1);
                $input['best_seller_banner1'] = $name;
            }    
            if ($file = $request->file('big_save_banner1')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->big_save_banner1);           
                $input['big_save_banner1'] = $name;
            } 

            $data->update($input);
        }else{
            $data = new SideBanner();
            if ($file = $request->file('best_seller_banner')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->best_seller_banner);
                $input['best_seller_banner'] = $name;
            }    
            if ($file = $request->file('big_save_banner')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->big_save_banner);           
                $input['big_save_banner'] = $name;
            } 

            if ($file = $request->file('best_seller_banner1')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->best_seller_banner1);
                $input['best_seller_banner1'] = $name;
            }    
            if ($file = $request->file('big_save_banner1')) 
            {              
                $name = Str::random(5).time().str_replace(' ', '', $file->getClientOriginalName());
                $data->bannerupload($name,$file,$data->big_save_banner1);           
                $input['big_save_banner1'] = $name;
            } 
           
            $data::create($input);

            
        }
       $msg = 'Data Updated Successfully.';
        return response()->json($msg);  

           
        
    }

    public function big_save(Request $request)
    {
        if($request->language){
            $language = $request->language;
        }else{
            $language = Language::whereIsDefault(1)->first()->id;
        }
        $data = SideBanner::where('language_id',$language)->first(); 

        return view('admin.pagesetting.big_save',compact('data','language'));
    }

    //Upadte About Page Section Settings

    //Upadte FAQ Page Section Settings
    public function faqupdate($status)
    {
        $page = Pagesetting::findOrFail(1);
        $page->f_status = $status;
        $page->update();
        Session::flash('success', 'FAQ Status Upated Successfully.');
        return redirect()->back();
    }

    public function contactup($status)
    {
        $page = Pagesetting::findOrFail(1);
        $page->c_status = $status;
        $page->update();
        Session::flash('success', 'Contact Status Upated Successfully.');
        return redirect()->back();
    }

    //Upadte Contact Page Section Settings
    public function contactupdate(Request $request)
    {
        $page = Pagesetting::findOrFail(1);
        $input = $request->all();
        $page->update($input);
        Session::flash('success', 'Contact page content updated successfully.');
        return redirect()->route('admin-ps-contact');;
    }

}
