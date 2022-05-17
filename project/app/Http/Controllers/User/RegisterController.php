<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Generalsetting;
use App\Models\User;
use App\Classes\GeniusMailer;
use App\Classes\SMS;
use App\Models\Notification;
use Auth;
use Illuminate\Support\Str;
use Validator;
use App\Models\Subscription;
use App\Models\UserSubscription;
use Illuminate\Support\Carbon;

class RegisterController extends Controller
{
	public function __construct()
    {
      parent::__construct();
    }
    public function register(Request $request)
    {

    	$gs = Generalsetting::findOrFail(1);

    	if($gs->is_capcha == 1)
        {
            $rules = [
                'g-recaptcha-response' => 'required'
            ];
            $customs = [
                'g-recaptcha-response.required' => __("Please verify that you are not a robot."),
            ];

            $validator = Validator::make($request->all(), $rules, $customs);
            if ($validator->fails()) {
              return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
            }
        }


        //--- Validation Section

        $rules = [
		        'email'   => 'required|email|unique:users',
		        'password' => 'required|confirmed',
		        'city' => 'required',
		        'country' => 'required',

		      //  'terms' => 'required'
                ];

		$customs = [
			'email.unique' => __('This Email Has Already Been Taken.'),
			'password.confirmed' => __('Password confirmation field is required.')
		];

        $validator = Validator::make($request->all(), $rules, $customs);

        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends


	        $input = $request->all();
	        $input['password'] = bcrypt($request['password']);
	        $token = md5(time().$request->name.$request->email);
	        $input['verification_link'] = $token;
	        $input['affilate_code'] = md5($request->name.$request->email);
			$input['sms_otp'] = rand(10001,99999);

            if(!empty($request->vendor))
            {
					//--- Validation Section
					$rules = [
						'shop_name' => 'unique:users,shop_name',
						'shop_number'  => 'max:10'
							];
                            $customs = [
                                'shop_name.unique' => __('This Shop Name has already been taken.'),
                                'shop_number.max'  => __('Shop Number Must Be Less Then 10 Digit.')
					];

					$validator = Validator::make($request->all(), $rules, $customs);
					if ($validator->fails()) {
                        return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
					}
					$input['is_vendor'] = 1;
					$input['shop_slug'] = Str::slug($request->shop_name);

			  }
              $user = User::create($input);
              if(!empty($request->vendor))
              {
                $user->is_vendor = 2;
                $subs = Subscription::findOrFail(8);
                $sub = new UserSubscription;
                $sub->user_id = $user->id;
                $date = Carbon::now()->addDays($subs->days)->format('Y-m-d');
                $user->date = $date;
                $sub->subscription_id = $subs->id;
                $sub->title = $subs->title;
                $sub->currency = $subs->currency;
                $sub->currency_code = $subs->currency_code;
                $sub->price = $subs->price;
                $sub->days = $subs->days;
                $sub->allowed_products = $subs->allowed_products;
                $sub->details = $subs->details;
                $sub->method = 'Free';
                $sub->status = 1;
                $sub->save();
                $user->save();


                $sms = new SMS();

                $data = [

                    'to' => $user->email,

                    'type' => "vendor_accept",

                    'cname' => $user->name,

                    'oamount' => "",

                    'aname' => "",

                    'aemail' => "",

                    'onumber' => "",

                ];

                $sms->sendSingleMessage($user->phone, $data);
              }
            if($gs->is_verification_email == 1)
	        {
                $to = $request->email;
	        $subject = __('Verify your email address.');
	        $msg = __("Dear Customer,<br> We noticed that you need to verify your email address.")." <a href=".url('user/register/verify/'.$token)."> ".__('Simply click here to verify.')." </a>";
	        //Sending Email To Customer


			$data = [
	            'to' => $to,
				'type' => "new_registration",
				'cname' => $user->name,
				'damount' => '',
				'wbalance' => '',
	            'verify_link' => "<a href=".url('user/register/verify/'.$token).">Simply click here to verify. </a>",
				'oamount' => "",
				'aname' => "",
				'aemail' => "",
				'onumber' => "",
				'otp' => $input['sms_otp'],
	        ];



	        if($gs->is_smtp == 1)
	        {


	        $mailer = new GeniusMailer();
	        $mailer->sendRegisterCustomMail($data);
	        }
	        else
	        {
	        $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
	        mail($to,$subject,$msg,$headers);
	        }
          	return response()->json(__('We need to verify your email address. We have sent an email to') . ' '.$to.  ' '.__('to verify your email address. Please click link in that email to continue.'));
	        }
	        else {

            $user->email_verified = 'Yes';
            $user->update();
	        $notification = new Notification;
	        $notification->user_id = $user->id;
	        $notification->save();
            Auth::guard('web')->login($user);
        
          	return response()->json(1);
	        }

    }

    public function token($token)
    {
        $gs = Generalsetting::findOrFail(1);

        if($gs->is_verification_email == 1)
	   {
        $user = User::where('verification_link','=',$token)->first();

            if(isset($user))
            {
                $user->email_verified = 'Yes';
                $user->update();
    	        $notification = new Notification;
    	        $notification->user_id = $user->id;
    	        $notification->save();
            }
    	}
    		else {
    		return redirect()->back();
    		}


			$otp = rand(10001,99999);
			$user->update();
			$data = [
	            'to' => '',
				'type' => "new_registration",
				'cname' => $user->name,
				'damount' => '',
				'wbalance' => '',
	            'verify_link' => "",
				'oamount' => "",
				'aname' => "",
				'aemail' => "",
				'onumber' => "",
				'otp' => $otp,
	        ];

			if($gs->is_sms_verification == 1){
				return redirect()->route('user-verify-otp',$user->email)->with('success',__('Email Verified Successfully'));
			}
			return redirect()->route('user-dashboard')->with('success','Email Verified Successfully');




    }

	public function otp_verify ($email)
	{
		$user = User::where('email',$email)->first();
		$otp = rand(10001,99999);
		$user->sms_otp = $otp;
		$user->update();
			$data = [
	            'to' => '',
				'type' => "new_registration",
				'cname' => $user->name,
				'damount' => '',
				'wbalance' => '',
	            'verify_link' => "",
				'oamount' => "",
				'aname' => "",
				'aemail' => "",
				'onumber' => "",
				'otp' => $otp,
	        ];

		$sms = new SMS();
		$sms->sendSingleMessage($user->phone, $data);
		return view('user.otp_verify',compact('email'));
	}


	public function otp_verify_submit(Request $request)
	{
		if(User::where('sms_otp',$request->otp)->exists()){
			$user = User::where('sms_otp',$request->otp)->first();
			$user->sms_verifiy = 1;
			$user->sms_otp = null;
			$user->update();
			return response()->json(__('OTP Verification Successfully. Please Login your account'));
		}

		return response()->json(['errors' => [0 => __('OTP Invalid')]]);
	}


	public function otp_verify_resend($email)
	{
		if(User::where('email',$email)->exists()){
			$gs = Generalsetting::findOrFail(1);
			$user = User::where('email',$email)->first();
			$otp = rand(10001,99999);
			$user->sms_otp = $otp;
			$user->update();
			$data = [
	            'to' => '',
				'type' => "new_registration",
				'cname' => $user->name,
				'damount' => '',
				'wbalance' => '',
	            'verify_link' => "",
				'oamount' => "",
				'aname' => "",
				'aemail' => "",
				'onumber' => "",
				'otp' => $otp,
	        ];

				$sms = new SMS();
        		$sms->sendSingleMessage($user->phone, $data);

				return back()->with('success',__('Otp send successfully'));

		}
		return back()->with('unsuccess','Something is wrong');

	}
}
