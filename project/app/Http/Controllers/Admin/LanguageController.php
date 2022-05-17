<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Session;

class LanguageController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //*** JSON Request
    public function datatables()
    {
         $datas = Language::orderBy('id')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->addColumn('action', function(Language $data) {
                                $delete = $data->id == 1 ? '':'<a href="javascript:;" data-href="' . route('admin-lang-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                                $default = $data->is_default == 1 ? '<a><i class="fa fa-check"></i> Default</a>' : '<a class="status" data-href="' . route('admin-lang-st',['id1'=>$data->id,'id2'=>1]) . '">Set Default</a>';
                                return '<div class="action-list"><a href="' . route('admin-lang-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a>'.$delete.$default.'</div>';
                            })
                            ->rawColumns(['action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** GET Request
    public function index()
    {
        return view('admin.language.index');
    }

    //*** GET Request
    public function create()
    {
        return view('admin.language.create');
    }

    //*** POST Request
    public function store(Request $request)
    {

        //--- Logic Section
        $input = $request->all();
        $data = new Language();
        $data->language = $input['language'];
        $data->file = Str::random(10).'.json';
        $data->save();
        unset($input['_token']);
        unset($input['language']);
        $mydata = json_encode($input);

        file_put_contents(resource_path().'/lang/'.$data->file, $mydata);
        //--- Logic Section Ends
        cache()->forget('default_language');
        cache()->forget('languages');
        //--- Redirect Section
        $msg = 'New Data Added Successfully.';
        return response()->json($msg);
        //--- Redirect Section Ends
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Language::findOrFail($id);
        $data_results = file_get_contents(resource_path().'/lang/'.$data->file);
        $lang = json_decode($data_results);

        return view('admin.language.edit',compact('data','lang'));
    }

    public function paginate($items, $perPage = 20, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

    public function update(Request $request, $id)
    {
        //--- Logic Section
        $input = $request->all();
        if($input['keys']&&$input['values']){
            $combine_array = array_combine($request->keys,$request->values);
            $input = array_merge($input,$combine_array);
        }


        $data = Language::findOrFail($id);
        $data->language = $input['language'];
        $data->update();

        unset($input['keys']);
        unset($input['values']);
        unset($input['_token']);
        unset($input['language']);

        $mydata = json_encode($input);

        file_put_contents(resource_path().'/lang/'.$data->file , '');

         $file_new_data = [];

        foreach($input as $json_key => $json_value){
            $file_new_data[$json_key] = $json_value;
        }
        
        $mydata = json_encode($file_new_data);

        file_put_contents(resource_path().'/lang/'.$data->file, $mydata);
        //--- Logic Section Ends
        cache()->forget('default_language');
        cache()->forget('languages');
        //--- Redirect Section
        $msg = 'Data Updated Successfully.';
        return response()->json($msg);
        //--- Redirect Section Ends
    }
      public function status($id1,$id2)
        {
            $data = Language::findOrFail($id1);
            $data->is_default = $id2;
            $data->update();
            $data = Language::where('id','!=',$id1)->update(['is_default' => 0]);
            cache()->forget('default_language');
            cache()->forget('languages');
            //--- Redirect Section
            $msg = 'Data Updated Successfully.';
            return response()->json($msg);
            //--- Redirect Section Ends
        }

    //*** GET Request Delete
    public function destroy($id)
    {
        if($id == 1)
        {
        return "You don't have access to remove this language";
        }
        $data = Language::findOrFail($id);
        if($data->is_default == 1)
        {
        return "You can not remove default language.";
        }


        if (file_exists(resource_path().'/lang/'.$data->file)) {
            unlink(resource_path().'/lang/'.$data->file);
        }
        $data->delete();
        Session::forget('language');
        cache()->forget('default_language');
        cache()->forget('session_language');
        //--- Redirect Section
        $msg = 'Data Deleted Successfully.';
        return response()->json($msg);
        //--- Redirect Section Ends
    }
}
