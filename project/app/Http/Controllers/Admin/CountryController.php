<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\Currency;
use App\Models\State;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class CountryController extends Controller
{
    public function manageCountry()
    {
        return view('admin.country.index');
    }


      //*** JSON Request
      public function datatables()
      {
           $datas = Country::orderBy('id','desc');
           //--- Integrating This Collection Into Datatables
           return DataTables::of($datas)
                              ->addColumn('action', function(Country $data) {
                                $class = $data->status == 1 ? 'drop-success' : 'drop-danger';
                                $s = $data->status == 1 ? 'selected' : '';
                                $ns = $data->status == 0 ? 'selected' : '';
                                return '<div class="action-list"><select class="process select droplinks '.$class.'"><option data-val="1" value="'. route('admin-country-status',[ $data->id,1]).'" '.$s.'>Activated</option><option data-val="0" value="'. route('admin-country-status',[$data->id, 0]).'" '.$ns.'>Deactivated</option>/select></div>';
                            })

                              ->rawColumns(['action','status'])
                              ->toJson();
                              
      }



    //*** GET Request Status
    public function status($id1,$id2)
    {
        Country::findOrFail($id1)->update([
            'status' => $id2
        ]);
    }




}
