<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use App\Models\Currency;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\WithdrawMethod;
use Validator;

class WithdrawMethodController extends Controller
{
   public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //*** JSON Request
    public function datatables()
    {
         $datas = WithdrawMethod::orderBy('id')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)

                            ->editColumn('status', function(WithdrawMethod $data) {
                                $class = $data->status == 1 ? 'drop-success' : 'drop-danger';
                                $s = $data->status == 1 ? 'selected' : '';
                                $ns = $data->status == 0 ? 'selected' : '';
                                return '<div class="action-list"><select class="process select droplinks '.$class.'"><option data-val="1" value="'. route('admin-withdraw-method-status',[ $data->id,1]).'" '.$s.'>Showed</option><<option data-val="0" value="'. route('admin-withdraw-method-status',[ $data->id, 0]).'" '.$ns.'>Not Showed</option>/select></div>';
                            })
                            ->addColumn('action', function(WithdrawMethod $data) {
                                
                                return '<div class="action-list"><a data-href="' . route('admin-withdraw-method-edit',$data->id) . '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a><a href="javascript:;" data-href="' . route('admin-withdraw-method-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a></div>';
                            }) 
                            ->rawColumns(['action','status'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** GET Request
    public function index()
    {
        return view('admin.withdraw_method.index');
    }

    //*** GET Request
    public function create()
    {
        return view('admin.withdraw_method.create');
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = ['title' => 'unique:withdraw_methods,title',];
        $customs = ['title.unique' => 'This Title has already been taken.'];
        $validator = Validator::make($request->all(), $rules, $customs);
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new WithdrawMethod();
        $input = $request->all();
        $data->fill($input)->save();
        //--- Logic Section Ends

        //--- Redirect Section        
        $msg = 'New Data Added Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = WithdrawMethod::findOrFail($id);
        return view('admin.withdraw_method.edit',compact('data'));
    }

    //*** POST Request
    public function update(Request $request, $id)
    {
        //--- Validation Section
        $rules = ['title' => 'unique:withdraw_methods,title,'.$id,];
        $customs = ['title.unique' => 'This Title has already been taken.'];
        $validator = Validator::make($request->all(), $rules, $customs);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }                
        //--- Validation Section Ends

        //--- Logic Section
        $data = WithdrawMethod::findOrFail($id);
        $input = $request->all();
        $data->update($input);
        //--- Redirect Section     
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends            
    }

      public function status($id1,$id2)
        {
          
            $data = WithdrawMethod::findOrFail($id1);
            $data->status = $id2;
            $data->update();
       
            $msg = 'Data Updated Successfully.';
            return response()->json($msg);      
            //--- Redirect Section Ends  
        }

    //*** GET Request Delete
    public function destroy($id)
    {
        $data = Currency::findOrFail($id);
        $data->delete();
        $msg = 'Data Deleted Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends     
    }

}