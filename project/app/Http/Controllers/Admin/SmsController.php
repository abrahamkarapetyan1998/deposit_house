<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use App\Classes\GeniusMailer;
use App\Models\SmsTemplete;
use App\Models\Generalsetting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Subscriber;
use App\Models\User;

class SmsController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //*** JSON Request
    public function datatables()
    {
         $datas = SmsTemplete::orderBy('id','desc')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->editColumn('language_id', function(SmsTemplete $data) {
                                return $data->language->language;
                            }) 
                            ->addColumn('action', function(SmsTemplete $data) {
                                return '<div class="action-list"><a href="' . route('admin-sms-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a></div>';
                            }) 
                            ->rawColumns(['language_id','action'])
                            ->toJson();//--- Returning Json Data To Client Side
    }

    public function index()
    {
        return view('admin.sms.index');
    }

    public function config()
    {
        return view('admin.sms.config');
    }

    public function edit($id)
    {
        $data = SmsTemplete::findOrFail($id);
        return view('admin.sms.edit',compact('data'));
    }


    

    public function update(Request $request, $id)
    {
        $data = SmsTemplete::findOrFail($id);
        $input = $request->all();
        
        if(SmsTemplete::whereSmsType($request->sms_type)->whereLanguageId($request->language_id)->exists()){
            $data->update($input);
        }else{
            $new = new SmsTemplete();
            $new->create($input);
        }
        
        //--- Redirect Section          
        $msg = 'Data Updated Successfully.'.'<a href="'.route("admin-mail-index").'">View Template Lists</a>';
        return response()->json($msg);  
    }

}
