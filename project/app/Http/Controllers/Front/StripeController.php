<?php

namespace App\Http\Controllers\Front;

use App\Classes\GeniusMailer;
use App\Classes\SMS;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Currency;
use App\Models\Generalsetting;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderTrack;
use App\Models\Pagesetting;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\User;
use App\Models\UserNotification;
use App\Models\VendorOrder;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Config;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Redirect;
use Stripe\Error\Card;
use URL;
use Validator;

class StripeController extends Controller
{



    public function __construct()
    {
        parent::__construct();
        //Set Spripe Keys
        $stripe = Generalsetting::findOrFail(1);
        Config::set('services.stripe.key', $stripe->stripe_key);
        Config::set('services.stripe.secret', $stripe->stripe_secret);
    }


    public function store(Request $request){
       
  
        if($request->pass_check) {
            $users = User::where('email','=',$request->personal_email)->get();
            if(count($users) == 0) {
                if ($request->personal_pass == $request->personal_confirm){
                    $user = new User;
                    $user->name = $request->personal_name; 
                    $user->email = $request->personal_email;   
                    $user->password = bcrypt($request->personal_pass);
                    $token = md5(time().$request->personal_name.$request->personal_email);
                    $user->verification_link = $token;
                    $user->affilate_code = md5($request->name.$request->email);
                    $user->email_verified = 'Yes';
                    $user->save();
                    Auth::guard('web')->login($user);                     
                }else{
                    return redirect()->back()->with('unsuccess',__("Confirm Password Doesn't Match."));     
                }
            }
            else {
                return redirect()->back()->with('unsuccess',__("This Email Already Exist."));  
            }
        }
        
        if (!Session::has('cart')) {
            return redirect()->route('front.cart')->with('success',__("You don't have any product to checkout."));
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }

        $settings = Generalsetting::findOrFail(1);
        $order = new Order;
        $success_url = action('Front\PaymentController@payreturn');
        $item_name = $settings->title." Order";
        $item_number = Str::random(10);
        $item_amount = $request->total;

        $validator = Validator::make($request->all(),[
                        'cardNumber' => 'required',
                        'cardCVC' => 'required',
                        'month' => 'required',
                        'year' => 'required',
                    ]);

        if ($validator->passes()) {

            $stripe = Stripe::make(Config::get('services.stripe.secret'));
            try{
                $token = $stripe->tokens()->create([
                    'card' =>[
                            'number' => $request->cardNumber,
                            'exp_month' => $request->month,
                            'exp_year' => $request->year,
                            'cvc' => $request->cardCVC,
                        ],
                    ]);
                if (!isset($token['id'])) {
                    return back()->with('error',__('Token Problem With Your Token.'));
                }

                $charge = $stripe->charges()->create([
                    'card' => $token['id'],
                    'currency' => $curr->name,
                    'amount' => $item_amount,
                    'description' => $item_name,
                    ]);

                if ($charge['status'] == 'succeeded') {
                        $whole_discount  = 0;
                        foreach($cart->items as $key => $prod)
                        {
                            if(isset($prod['discount1'])){
                                $whole_discount += $prod['discount1'];
                            }
                            if(!empty($prod['item']['license']) && !empty($prod['item']['license_qty']))
                            {
                                    foreach($prod['item']['license_qty']as $ttl => $dtl)
                                    {
                                        if($dtl != 0)
                                        {
                                            $dtl--;
                                            $produc = Product::findOrFail($prod['item']['id']);
                                            $temp = $produc->license_qty;
                                            $temp[$ttl] = $dtl;
                                            $final = implode(',', $temp);
                                            $produc->license_qty = $final;
                                            $produc->update();
                                            $temp =  $produc->license;
                                            $license = $temp[$ttl];
                                            $oldCart = Session::has('cart') ? Session::get('cart') : null;
                                            $cart = new Cart($oldCart);
                                            $cart->updateLicense($prod['item']['id'],$license);  
                                            Session::put('cart',$cart);
                                            break;
                                        }                    
                                    }
                            }
                        }

                    $order['user_id'] = $request->user_id;
                    $new_cart['totalQty'] = $cart->totalQty;
                    $new_cart['totalPrice'] = $cart->totalPrice;
                    $new_cart['items'] = $cart->items;
                    $new_cart = json_encode($new_cart,true);
                    $order['cart'] = $new_cart;
                    $order['totalQty'] = $request->totalQty;
                    $order['pay_amount'] = round($item_amount / $curr->value, 2);
                    $order['method'] = "Stripe";
                    $order['totalQty'] = $request->totalQty;
                    $order['customer_email'] = $request->email;
                    $order['customer_name'] = $request->name;
                    $order['customer_phone'] = $request->phone;
                    $order['order_number'] = $item_number;
                    $order['shipping'] = $request->shipping;
                    $order['pickup_location'] = $request->pickup_location;
                    $order['customer_address'] = $request->address;
                    $order['customer_country'] = $request->customer_country;
                    $order['customer_city'] = $request->city;
                    $order['customer_zip'] = $request->zip;
                    $order['shipping_email'] = $request->shipping_email;
                    $order['shipping_name'] = $request->shipping_name;
                    $order['shipping_phone'] = $request->shipping_phone;
                    $order['shipping_address'] = $request->shipping_address;
                    $order['shipping_country'] = $request->shipping_country;
                    $order['whole_discount'] = $whole_discount;
                    $order['shipping_city'] = $request->shipping_city;
                    $order['shipping_zip'] = $request->shipping_zip;
                    $order['order_note'] = $request->order_notes;
                    $order['coupon_code'] = $request->coupon_code;
                    $order['coupon_discount'] = $request->coupon_discount;
                    $order['payment_status'] = "Completed";
                    $order['txnid'] = $charge['balance_transaction'];
                    $order['charge_id'] = $charge['id'];
                    $order['currency_sign'] = $curr->sign;
                    $order['currency_value'] = $curr->value;
                    $order['shipping_cost'] = $request->shipping_cost;
                    $order['packing_cost'] = $request->packing_cost;
                    $order['tax'] = $request->tax;
                    $order['dp'] = $request->dp;
                    $order['vendor_shipping_id'] = $request->vendor_shipping_id;
                    $order['vendor_packing_id'] = $request->vendor_packing_id;
                   
                    if($order['dp'] == 1)
                    {
                        $order['status'] = 'completed';
                    }

                    if (Session::has('affilate')) 
                    {
                        $val = $request->total / $curr->value;
                        $val = $val / 100;
                        $sub = $val * $settings->affilate_charge;
                        $order['affilate_user'] = Session::get('affilate');
                        $order['affilate_charge'] = $sub;
                    }
                    $order->save();


                    $notf = null;
                    $vendor_ids = [];
                    


                    $vendor_shippings_cal = [];
                    $admin_shippings_cal  = [];
            
                    $all_shipping_charge = json_decode($request->vendor_ship_ids,true);
            
                    foreach($all_shipping_charge as $ship_id => $charge_info){
                        if($ship_id == 0){
                            $admin_shippings_cal = $charge_info; 
                        }else{
                            $vendor_shippings_cal[$ship_id] = $charge_info;
                        }
                    }

                    if($admin_shippings_cal){
                        $gs = Generalsetting::findOrfail(1);

                        if($gs->is_smtp == 1)
                        {
                        $ship_man = Shipping::findOrFail($admin_shippings_cal['id']);
                        $data = [
                            'to' => $ship_man->email,
                            'type' => "ship_order",
                            'vendor_name' => '',
                            'oamount' => "",
                            'aname' => "",
                            'aemail' => "",
                            'wtitle' => "",
                            'onumber' => $order->order_number,
                        ];
                
                        $mailer = new GeniusMailer();
                        $mailer->sendAutoOrderMail($data,$order->id);            
                        }
                    }
                
             
                    foreach($cart->items as $prod)
                    {
                        $vendor_price = Product::findOrFail($prod['item']['id']);
                        
                        if($prod['item']['user_id'] != 0)
                        {

                            if(!in_array($prod['item']['user_id'],$vendor_ids)){
                                $vendor_ids[] = $prod['item']['user_id'];
                            }
                            $vendor_order =  new VendorOrder;
                            $vendor_order->order_id = $order->id;
                            $vendor_order->user_id = $prod['item']['user_id'];
                            $notf[] = $prod['item']['user_id'];
                            $vendor_order->qty = $prod['qty'];
                            $vendor_order->shipping_charge = isset($vendor_shippings_cal[$prod['item']['user_id']]) ? (double) $vendor_shippings_cal[$prod['item']['user_id']]['price'] : 0;
                            $vendor_order->price = $vendor_price->price + isset($vendor_shippings_cal[$prod['item']['user_id']]) ? (double) $vendor_shippings_cal[$prod['item']['user_id']]['price'] : 0;
                            $vendor_order->order_number = $order->order_number;             
                            $vendor_order->save();
                        }
    
                    }
                   
                if($order->dp == 1){
                    $track = new OrderTrack;
                    $track->title = 'Completed';
                    $track->text = 'Your order has completed successfully.';
                    $track->order_id = $order->id;
                    $track->save();
                   
                    foreach($order->vendororders as $vorder)
                    {
                       
                        $uprice = User::findOrFail($vorder->user_id);
                        
                        $uprice->current_balance = $uprice->current_balance + $vorder->price;
                        $uprice->update();
                       
                        $vorder->status = 'completed';
                        $vorder->update();
                      
                    }
        
                    if( User::where('id', $order->affilate_user)->exists() ){
                        $auser = User::where('id', $order->affilate_user)->first();
                        $auser->affilate_income += $order->affilate_charge;
                        $auser->update();
                    }

                }
                else {
                    $track = new OrderTrack;
                    $track->title = 'Pending';
                    $track->text = 'You have successfully placed your order.';
                    $track->order_id = $order->id;
                    $track->save();
                }

                    
                    $notification = new Notification;
                    $notification->order_id = $order->id;
                    $notification->save();
                    if($request->coupon_id != "")
                    {
                       $coupon = Coupon::findOrFail($request->coupon_id);
                       $coupon->used++;
                       if($coupon->times != null)
                       {
                            $i = (int)$coupon->times;
                            $i--;
                            $coupon->times = (string)$i;
                       }
                        $coupon->update();

                    }


                    foreach($cart->items as $prod)
                    {
                        $x = (string)$prod['size_qty'];
                        if(!empty($x))
                        {
                            $product = Product::findOrFail($prod['item']['id']);
                            $x = (int)$x;
                            $x = $x - $prod['qty'];
                            $temp = $product->size_qty;
                            $temp[$prod['size_key']] = $x;
                            $temp1 = implode(',', $temp);
                            $product->size_qty =  $temp1;
                            $product->update();               
                        }
                    }


                    foreach($cart->items as $prod)
                    {
                        $x = (string)$prod['stock'];
                        if($x != null)
                        {

                            $product = Product::findOrFail($prod['item']['id']);
                            $product->stock =  $prod['stock'];
                            $product->update();  
                            if($product->stock <= 5)
                            {
                                $notification = new Notification;
                                $notification->product_id = $product->id;
                                $notification->save();                    
                            }              
                        }
                    }

           


        
                    $gs = Generalsetting::find(1);
                    foreach($vendor_ids as $vendor_id){
                        $order_vendor = User::findOrFail($vendor_id);
                        $data = [
                            'to' => $order_vendor->email,
                            'type' => "vendor_order",
                            'vendor_name' => $order_vendor->name,
                            'oamount' => "",
                            'aname' => "",
                            'aemail' => "",
                            'wtitle' => "",
                            'onumber' => $order->order_number,
                        ];
                        if($gs->is_sms == 1){
                        $sms = new SMS();
                        $msg = $sms->sendSingleMessage($order_vendor->phone, $data);
                        }
                        if($gs->is_smtp == 1)
                        {
                        
                
                        $mailer = new GeniusMailer();
                        $mailer->sendAutoOrderMail($data,$order->id);            
                        }
                        else
                        {
                        $to = $order_vendor->email;
                        $subject = __("Your Order Placed!!");
                        $msg = __("Hello ").$order_vendor->name.__("!\nYou have placed a new order.\nYour order number is ").$order->order_number.__(".Please login to your panel to check. <br>Thank you.");
                            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
                        mail($to,$subject,$msg,$headers);            
                        }
                    }




                    if(!empty($notf))
                    {
                        $users = array_unique($notf);
                        foreach ($users as $user) {
                            $notification = new UserNotification;
                            $notification->user_id = $user;
                            $notification->order_number = $order->order_number;
                            $notification->save();    
                        }
                    }
                 
                    //Sending Email To Buyer

                    $data = [
                        'to' => $request->email,
                        'type' => "new_order",
                        'cname' => $request->name,
                        'oamount' => "",
                        'aname' => "",
                        'aemail' => "",
                        'wtitle' => "",
                        'onumber' => $order->order_number,
                    ];
                    if($gs->is_sms == 1){
                    $sms = new SMS();
                    $msg = $sms->sendSingleMessage($request->phone, $data);
                    }
                    if($gs->is_smtp == 1)
                    {
                   
                    $mailer = new GeniusMailer();
                    $mailer->sendAutoOrderMail($data,$order->id);            
                    }
                    else
                    {
                    $to = $request->email;
                    $subject = __("Your Order Placed!!");
                    $msg = __("Hello ").$request->name.__("!\nYou have placed a new order.\nYour order number is ").$order->order_number.__(".Please wait for your delivery. \nThank you.");
                        $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
                    mail($to,$subject,$msg,$headers);            
                    }
                    //Sending Email To Admin
                    if($gs->is_smtp == 1)
                    {
                        $data = [
                            'to' => Pagesetting::find(1)->contact_email,
                            'subject' => __("New Order Recieved!!"),
                            'body' => __("Hello Admin!<br>Your store has received a new order.<br>Order Number is ").$order->order_number.__(".Please login to your panel to check. <br>Thank you."),
                        ];

                        $mailer = new GeniusMailer();
                        $mailer->sendCustomMail($data);            
                    }
                    else
                    {
                    $to = Pagesetting::find(1)->contact_email;
                    $subject = __("New Order Recieved!!");
                    $msg = __("Hello Admin!\nYour store has recieved a new order.\nOrder Number is ").$order->order_number.__(".Please login to your panel to check. \nThank you.");
                        $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
                    mail($to,$subject,$msg,$headers);
                    }



                    Session::put('temporder_id',$order->id);
                    Session::put('tempcart',$cart);
                    Session::forget('already');
                    Session::forget('coupon');
                    Session::forget('coupon_total');
                    Session::forget('coupon_total1');
                    Session::forget('coupon_percentage');
                    return redirect($success_url);
                    }
                        
                    }catch (Exception $e){
                        return back()->with('unsuccess', $e->getMessage());
                    }catch (\Cartalyst\Stripe\Exception\CardErrorException $e){
                        return back()->with('unsuccess', $e->getMessage());
                    }catch (\Cartalyst\Stripe\Exception\MissingParameterException $e){
                        return back()->with('unsuccess', $e->getMessage());
                    }
                }
                return back()->with('unsuccess', __('Please Enter Valid Credit Card Informations.'));
    }


    

}
