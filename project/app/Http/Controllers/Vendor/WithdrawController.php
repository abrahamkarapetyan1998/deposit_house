<?php

namespace App\Http\Controllers\Vendor;

use App\Models\User;
use App\Models\Withdraw;
use App\Models\Generalsetting;
use Auth;
use App\Classes\GeniusMailer;
use App\Classes\SMS;
use App\Models\Currency;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class WithdrawController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware('auth');
    }

  	public function index()
    {
        $withdraws = Withdraw::where('user_id','=',Auth::guard('web')->user()->id)->where('type','=','vendor')->orderBy('id','desc')->get();
        $sign = Currency::where('is_default','=',1)->first();        
        return view('vendor.withdraw.index',compact('withdraws','sign'));
    }


    public function create()
    {
        $sign = Currency::where('is_default','=',1)->first();
        return view('vendor.withdraw.create' ,compact('sign'));
    }


    public function store(Request $request)
    {

        $from = User::findOrFail(Auth::guard('web')->user()->id);
        $curr = Currency::where('is_default','=',1)->first(); 
        $withdrawcharge = Generalsetting::findOrFail(1);
        $charge = $withdrawcharge->withdraw_fee;

        if($request->amount > 0){

            $amount = $request->amount;
            $amount = $amount / $curr->value;
            $fee = (($withdrawcharge->withdraw_charge / 100) * $amount) ;
            $finalamount = $amount - $fee;
            if ($from->current_balance >= $finalamount){
                $from->current_balance = $from->current_balance - $finalamount;
                $from->update();

                
                $newwithdraw = new Withdraw();
                $newwithdraw['user_id'] = Auth::user()->id;
                $newwithdraw['method'] = $request->methods;
                $newwithdraw['acc_email'] = $request->acc_email;
                $newwithdraw['iban'] = $request->iban;
                $newwithdraw['country'] = $request->acc_country;
                $newwithdraw['acc_name'] = $request->acc_name;
                $newwithdraw['address'] = $request->address;
                $newwithdraw['swift'] = $request->swift;
                $newwithdraw['reference'] = $request->reference;
                $newwithdraw['amount'] = $finalamount;
                $newwithdraw['fee'] = $fee;
                $newwithdraw['type'] = 'vendor';
                $newwithdraw->save();
                
                $dats = [
                    'to' => $from->email,
                    'type' => "vendor_withdraw",
                    'oamount' => $finalamount,
                     'aname' => $from->name,
                     'aemail' => $from->email,
                     'onumber' => '',
                    'currency' => $curr->sign,
                    'vendor_name' => $from->name,
                ];

                if($withdrawcharge->is_sms == 1){
                    $sms = new SMS();
                    $msg = $sms->sendSingleMessage($from->phone, $dats);
                }
                        
                
                
                if($withdrawcharge->is_smtp == 1)
                {
                $data = [
                    'to' => $from->email,
                    'type' => "vendor_withdraw",
                    'cname' => $from->name,
                    'oamount' => $finalamount,
                    'currency' => $curr->sign,
                    'onumber' => '',
                     'aemail' => $from->email,
                    'vendor_name' => $from->name,
                   
                ];    
                $mailer = new GeniusMailer();
                $mailer->sendAutoMail($data);        
                }
                else
                {
                $headers = "From: ".$withdrawcharge->from_name."<".$withdrawcharge->from_email.">";
                mail($user->email,__('Withdraw'),__('Your withdraw request is sent.'),$headers);
                }

                return response()->json(__('Withdraw Request Sent Successfully.')); 

            }else{
                 return response()->json(array('errors' => [ 0 => __('Insufficient Balance.') ])); 
            }
        }
            return response()->json(array('errors' => [ 0 => __('Please enter a valid amount.') ])); 

    }
}
