<?php

namespace App\Http\Controllers\Front;

use App\Classes\GeniusMailer;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Currency;
use App\Models\Generalsetting;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderTrack;
use App\Models\Pagesetting;
use App\Models\PaymentGateway;
use App\Models\Pickup;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\User;
use Illuminate\Support\Str;
use App\Models\UserNotification;
use App\Models\VendorOrder;
use Auth;
use DB;
use App\Classes\SMS;
use Illuminate\Http\Request;
use Session;
use Validator;

class CheckoutController extends Controller
{

    public function __construct()
    {
       parent::__construct();
    }
    public function loadpayment($slug1,$slug2)
    {

        if (Session::has('currency')) {
            $curr = Currency::find(Session::get('currency'));
        }
        else {
            $curr = Currency::where('is_default','=',1)->first();
        }

        $payment = $slug1;
        $pay_id = $slug2;
        $gateway = '';
        if($pay_id != 0) {
            $gateway = PaymentGateway::findOrFail($pay_id);
        }
        return view('load.payment',compact('payment','pay_id','gateway','curr'));
    }

    public function checkout()
    {

        $this->code_image();
        if (!Session::has('cart')) {
            return redirect()->route('front.cart')->with('success',__("You don't have any product to checkout."));
        }
        $gs = Generalsetting::findOrFail(1);
        $dp = 1;
        $vendor_shipping_id = 0;
        $vendor_packing_id = 0;
            if (Session::has('currency'))
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }

// If a user is Authenticated then there is no problm user can go for checkout
$oldCart = Session::get('cart');
$cart = new Cart($oldCart);
$products = $cart->items;

// Shipping Method
 $new_products = [];
 $shipping_weghts = [];
 foreach($products as $key => $product){

     $current_item = Product::findOrFail($product['item']['id']);

     if(array_key_exists($product['item']['user_id'],$new_products)){
         if($product['item']['user_id'] == 0){
             $shipping_weghts[$product['item']['user_id']]['weght'] +=  $product['item']['type'] == 'Physical' ? (double) $current_item->weght * $product['qty']  : 0;
             $shipping_weghts[$product['item']['user_id']]['shop_name'] = Admin::first()->shop_name;
         }else{
         $shipping_weghts[$product['item']['user_id']]['weght'] +=  $product['item']['type'] == 'Physical' ? (double) $current_item->weght* $product['qty'] : 0;
         $shipping_weghts[$product['item']['user_id']]['shop_name'] = $current_item->user->shop_name;
         }
          array_push( $new_products[$product['item']['user_id']],$product);
        }else{
         if($product['item']['user_id'] == 0){
             $shipping_weghts[$product['item']['user_id']]['weght'] = $product['item']['type'] == 'Physical' ? (double) $current_item->weght * $product['qty'] : 0;
             $shipping_weghts[$product['item']['user_id']]['shop_name'] = Admin::first()->shop_name;
         }else{
         $shipping_weghts[$product['item']['user_id']]['weght'] = $product['item']['type'] == 'Physical' ? (double) $current_item->weght * $product['qty'] : 0;
         $shipping_weghts[$product['item']['user_id']]['shop_name'] =  $current_item->user->shop_name;
         }
         $new_products[$product['item']['user_id']][] = $product;
        }
 }


 $shipping_charge_info = [];
 $shipping_total_cost = 0;
 foreach($shipping_weghts as $key => $shipping_cal){
     $shipping_charge = Shipping::whereUserId($key)->where('form_weght', '<=' ,$shipping_cal['weght'])->where('to_weght' , '>=', $shipping_cal['weght'])->first();
     $shippings_available =  Shipping::where('form_weght', '<=' ,$shipping_cal['weght'])->where('to_weght' , '>=', $shipping_cal['weght'])->get();
    if($shipping_charge){
        $shipping_charge_info[$key]['id'] = $shipping_charge->id;
         $shipping_charge_info[$key]['title'] = $shipping_charge->title;
         if($shipping_cal['weght'] != 0){
            $shipping_total_cost += $shipping_charge->price;
         }
         $shipping_charge_info[$key]['price'] = $shipping_charge->price;
         $shipping_charge_info[$key]['weght'] = $shipping_cal['weght'];
     }else{

         $shipping_charge = Shipping::where('form_weght', '<=' ,$shipping_cal['weght'])->where('to_weght' , '>=', $shipping_cal['weght'])->first();
          if($shipping_cal['weght'] != 0){
            $shipping_total_cost += $shipping_charge->price;
         }
         $shipping_charge_info[$key]['id'] = $shipping_charge->id;
         $shipping_charge_info[$key]['title'] = $shipping_charge->title;
         $shipping_charge_info[$key]['price'] = $shipping_charge->price;
         $shipping_charge_info[$key]['weght'] = $shipping_cal['weght'];
     }
 }

 foreach($shipping_charge_info as $ttt => $vprive){
    $NEW_TTT[$ttt]['id'] = $vprive['id'];
    $NEW_TTT[$ttt]['price'] = $vprive['price'];
 }
 $all_vendor_shipp = json_encode($NEW_TTT,true);



        if(Auth::guard('web')->check())
        {
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();




                // Packaging

                if($gs->multiple_packaging == 1)
                {
                    $user = null;
                    foreach ($cart->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $users = array_unique($user);
                    if(count($users) == 1)
                    {
                        $package_data  = DB::table('packages')->where('user_id','=',$users[0])->get();
                        if(count($package_data) == 0){
                            $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                        }
                        else{
                            $vendor_packing_id = $users[0];
                        }
                    }
                    else {
                        $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                    }

                }
                else{
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                }


                foreach ($products as $prod) {
                    if($prod['item']['type'] == 'Physical')
                    {
                        $dp = 0;
                        break;
                    }
                }
                if($dp == 1)
                {
                $ship  = 0;
                }
                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;
                $total = $total + 0;
                }
                else {
                $total = Session::get('coupon_total');
                $total = $total + round(0 * $curr->value, 2);
                }
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'shipping_cost' => 0, 'digital' => $dp, 'curr' => $curr, 'vendor_shipping_id' => $vendor_shipping_id,'package_data' => $package_data, 'vendor_packing_id' => $vendor_packing_id,'new_products' => $new_products,'shipping_charge_info' => $shipping_charge_info,'shipping_weghts' => $shipping_weghts,'shipping_total_cost' => $shipping_total_cost,'all_vendor_shipp' => $all_vendor_shipp, 'shippings_available' => $shippings_available]);
        }

        else

        {
// If guest checkout is activated then user can go for checkout
           	if($gs->guest_checkout == 1)
              {
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $products = $cart->items;



                // // Packaging

                if($gs->multiple_packaging == 1)
                {
                    $user = null;
                    foreach ($cart->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $users = array_unique($user);
                    if(count($users) == 1)
                    {
                        $package_data  = DB::table('packages')->where('user_id','=',$users[0])->get();

                        if(count($package_data) == 0){
                            $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                        }
                        else{
                            $vendor_packing_id = $users[0];
                        }
                    }
                    else {
                        $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                    }

                }
                else{
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                }


                foreach ($products as $prod) {
                    if($prod['item']['type'] == 'Physical')
                    {
                        $dp = 0;
                        break;
                    }
                }
                if($dp == 1)
                {
                $ship  = 0;
                }
                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;
                $total = $total + 0;
                }
                else {
                $total = Session::get('coupon_total');
                $total =  str_replace($curr->sign,'',$total) + round(0 * $curr->value, 2);
                }
                foreach ($products as $prod) {
                    if($prod['item']['type'] != 'Physical')
                    {
                        if(!Auth::guard('web')->check())
                        {
                $ck = 1;
                            return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'shipping_cost' => 0, 'checked' => $ck, 'digital' => $dp,'package_data' => $package_data, 'curr' => $curr, 'vendor_shipping_id' => $vendor_shipping_id, 'vendor_packing_id' => $vendor_packing_id, 'new_products' => $new_products,'shipping_charge_info' => $shipping_charge_info,'shipping_weghts' => $shipping_weghts,'shipping_total_cost' => $shipping_total_cost,'all_vendor_shipp' => $all_vendor_shipp , 'shippings_available' => $shippings_available]);
                        }
                    }
                }
                            return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'shipping_cost' => 0, 'digital' => $dp, 'curr' => $curr,'package_data' => $package_data, 'vendor_shipping_id' => $vendor_shipping_id, 'vendor_packing_id' => $vendor_packing_id , 'new_products' => $new_products,'shipping_charge_info' => $shipping_charge_info,'shipping_weghts' => $shipping_weghts,'shipping_total_cost' => $shipping_total_cost,'all_vendor_shipp' => $all_vendor_shipp , 'shippings_available' => $shippings_available]);
               }

// If guest checkout is Deactivated then display pop up form with proper error message

      else{
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $products = $cart->items;

                // Shipping Method

                if($gs->multiple_shipping == 1)
                {
                    $user = null;
                    foreach ($cart->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $users = array_unique($user);
                    if(count($users) == 1)
                    {
                        $shipping_data  = DB::table('shippings')->where('user_id','=',$users[0])->get();

                        if(count($shipping_data) == 0){
                            $shipping_data  = DB::table('shippings')->where('user_id','=',0)->get();
                        }
                        else{
                            $vendor_shipping_id = $users[0];
                        }
                    }
                    else {
                        $shipping_data  = DB::table('shippings')->where('user_id','=',0)->get();
                    }

                }
                else{
                $shipping_data  = DB::table('shippings')->where('user_id','=',0)->get();
                }

                // Packaging

                if($gs->multiple_packaging == 1)
                {
                    $user = null;
                    foreach ($cart->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $users = array_unique($user);
                    if(count($users) == 1)
                    {
                        $package_data  = DB::table('packages')->where('user_id','=',$users[0])->get();

                        if(count($package_data) == 0){
                            $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                        }
                        else{
                            $vendor_packing_id = $users[0];
                        }
                    }
                    else {
                        $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                    }

                }
                else{
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();
                }


                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }

                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;
                $total = $total + 0;
                }
                else {
                $total = Session::get('coupon_total');
                $total = $total + round(0 * $curr->value, 2);
                }
                $ck = 1;
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'shipping_cost' => 0, 'checked' => $ck, 'digital' => $dp, 'curr' => $curr,'shipping_data' => $shipping_data,'package_data' => $package_data, 'vendor_shipping_id' => $vendor_shipping_id, 'vendor_packing_id' => $vendor_packing_id , 'new_products' => $new_products,'shipping_charge_info' => $shipping_charge_info,'shipping_weghts' => $shipping_weghts,'shipping_total_cost' => $shipping_total_cost,'all_vendor_shipp' => $all_vendor_shipp , 'shippings_available' => $shippings_available]);
                    }
        }

    }


    public function cashondelivery(Request $request)
    {


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
            if (Session::has('currency'))
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
        $gs = Generalsetting::findOrFail(1);
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
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
        $order = new Order;
        $success_url = action('Front\PaymentController@payreturn');
        $item_name = $gs->title." Order";
        $item_number = Str::random(10);
        $order['user_id'] = Auth::check() ? Auth::user()->id : NULL;
        $new_cart['totalQty'] = $cart->totalQty;
        $new_cart['totalPrice'] = $cart->totalPrice;
        $new_cart['items'] = $cart->items;
        $new_cart = json_encode($new_cart,true);
        $order['totalQty'] = $request->totalQty;
        $order['cart'] = $new_cart;
        $order['pay_amount'] = round($request->total / $curr->value, 2);
        $order['method'] = $request->method;
        $order['shipping'] = $request->shipping;
        $order['pickup_location'] = $request->pickup_location;
        $order['customer_email'] = $request->email;
        $order['customer_name'] = $request->name;
        $order['shipping_cost'] = $request->shipping_cost;
        $order['packing_cost'] = $request->packing_cost;
        $order['tax'] = $request->tax;
        $order['customer_phone'] = $request->phone;
        $order['whole_discount'] = $whole_discount;
        $order['order_number'] = Str::random(10);
        $order['customer_address'] = $request->address;
        $order['customer_country'] = $request->customer_country;
        $order['customer_city'] = $request->city;
        $order['customer_zip'] = $request->zip;
        $order['shipping_email'] = $request->shipping_email;
        $order['shipping_name'] = $request->shipping_name;
        $order['shipping_method_id'] = $request->shipping_method;
        $order['shipping_phone'] = $request->shipping_phone;
        $order['shipping_address'] = $request->shipping_address;
        $order['shipping_country'] = $request->shipping_country;
        $order['shipping_city'] = $request->shipping_city;
        $order['shipping_zip'] = $request->shipping_zip;
        $order['order_note'] = $request->order_notes;
        $order['coupon_code'] = $request->coupon_code;
        $order['coupon_discount'] = $request->coupon_discount;
        $order['dp'] = $request->dp;
        $order['txnid'] = Str::random(9);
        $order['payment_status'] = "Pending";
        $order['currency_sign'] = $curr->sign;
        $order['currency_value'] = $curr->value;
        $order['vendor_shipping_id'] = $request->vendor_shipping_id;
        $order['vendor_packing_id'] = $request->vendor_packing_id;
        $decoded = json_decode($order['cart']);

        foreach($decoded->items as $item){
            if($item->size_qty !== ""){
               $arr = array_combine($item->item->size, $item->item->size_qty);
                foreach($arr as $ar => $val){
                    if($ar === $item->size){

                        $arr[$ar] = intval($arr[$ar]) - $item->qty;
                    }
                }
                $product = Product::find($item->item->id);

                $product->size_qty = implode(",",$arr);
                $product->update();
            }
        }
        if (Session::has('affilate'))
        {
            $val = $request->total / $curr->value;
            $val = $val / 100;
            $sub = $val * $gs->affilate_charge;
            $order['affilate_user'] = Session::get('affilate');
            $order['affilate_charge'] = $sub;
        }
        $order->save();

        $notf = null;
                    $vendor_ids = [];

                    $all_shipping_charge = json_decode($request->vendor_ship_ids,true);

                    foreach($all_shipping_charge as $own_id => $ship_charge){
                        $gs = Generalsetting::findOrfail(1);
                        if($gs->is_smtp == 1)
                        {
                            $ship_man = Shipping::findOrFail($ship_charge['id']);

                            if($ship_man->email){
                                $data = [
                                    'to' => $ship_man->email,
                                    'type' => "ship_order",
                                    'vendor_name' => '',
                                    'oamount' => "",
                                    'aname' => "",
                                    'aemail' => "",
                                    'wtitle' => "",
                                    'onumber' => $order->order_number,
                                    'owner_id' => $own_id
                                ];

                                $mailer = new GeniusMailer();
                                $mailer->shipMail($data,$order->id);
                            }

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
                            $vendor_order->shipping_charge = isset($all_shipping_charge[$prod['item']['user_id']]) ? (double) $all_shipping_charge[$prod['item']['user_id']]['price'] : 0;
                            $vendor_order->price = $vendor_price->price + isset($all_shipping_charge[$prod['item']['user_id']]) ? (double) $all_shipping_charge[$prod['item']['user_id']]['price'] : 0;
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
                            'aname' => $request->name,
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

        Session::forget('cart');

        Session::forget('already');
        Session::forget('coupon');
        Session::forget('coupon_total');
        Session::forget('coupon_total1');
        Session::forget('coupon_percentage');

        //Sending Email To Buyer

        if($gs->is_smtp == 1)
        {
        $data = [
            'to' => $request->email,
            'type' => "new_order",
            'cname' => $request->name ?? '',
            'oamount' => "",
            'aname' => "",
            'aemail' => "",
            'wtitle' => "",
            'onumber' => $order->order_number,
        ];

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

        return redirect($success_url);
    }

    public function gateway(Request $request)
    {

$input = $request->all();

$rules = [
    'txn_id4' => 'required',
];


$messages = [
    'required' => __('The Transaction ID field is required.'),
];

$validator = Validator::make($input, $rules, $messages);

       if ($validator->fails()) {
            Session::flash('unsuccess', $validator->messages()->first());
            return redirect()->back()->withInput();
       }

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

        $gs = Generalsetting::findOrFail(1);
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
        $settings = Generalsetting::findOrFail(1);
        $order = new Order;
        $success_url = action('Front\PaymentController@payreturn');
        $item_name = $settings->title." Order";
        $item_number = Str::random(10);
        $order['user_id'] = $request->user_id;
        $new_cart['totalQty'] = $cart->totalQty;
        $new_cart['totalPrice'] = $cart->totalPrice;
        $new_cart['items'] = $cart->items;
        $new_cart = json_encode($new_cart,true);
        $order['cart'] = $new_cart;
        $order['totalQty'] = $request->totalQty;
        $order['pay_amount'] = round($request->total / $curr->value, 2);
        $order['method'] = $request->method;
        $order['shipping'] = $request->shipping;
        $order['pickup_location'] = $request->pickup_location;
        $order['customer_email'] = $request->email;
        $order['customer_name'] = $request->name;
        $order['shipping_cost'] = $request->shipping_cost;
        $order['packing_cost'] = $request->packing_cost;
        $order['tax'] = $request->tax;
        $order['customer_phone'] = $request->phone;
        $order['order_number'] = Str::random(10);
        $order['customer_address'] = $request->address;
        $order['customer_country'] = $request->customer_country;
        $order['customer_city'] = $request->city;
        $order['whole_discount'] = $whole_discount;
        $order['customer_zip'] = $request->zip;
        $order['shipping_email'] = $request->shipping_email;
        $order['shipping_name'] = $request->shipping_name;
        $order['shipping_phone'] = $request->shipping_phone;
        $order['shipping_address'] = $request->shipping_address;
        $order['shipping_country'] = $request->shipping_country;
        $order['shipping_city'] = $request->shipping_city;
        $order['shipping_zip'] = $request->shipping_zip;
        $order['order_note'] = $request->order_notes;
        $order['txnid'] = $request->txn_id4;
        $order['coupon_code'] = $request->coupon_code;
        $order['coupon_discount'] = $request->coupon_discount;
        $order['dp'] = $request->dp;
        $order['payment_status'] = "Pending";
        $order['currency_sign'] = $curr->sign;
        $order['currency_value'] = $curr->value;
        $order['vendor_shipping_id'] = $request->vendor_shipping_id;
        $order['vendor_packing_id'] = $request->vendor_packing_id;
        $decoded = json_decode($order['cart']);

        foreach($decoded->items as $item){
            if($item->size_qty !== ""){
               $arr = array_combine($item->item->size, $item->item->size_qty);
                foreach($arr as $ar => $val){
                    if($ar === $item->size){

                        $arr[$ar] = intval($arr[$ar]) - $item->qty;
                    }
                }
                $product = Product::find($item->item->id);

                $product->size_qty = implode(",",$arr);
                $product->update();
            }
        }
        if (Session::has('affilate'))
        {
            $val = $request->total / $curr->value;
            $val = $val / 100;
            $sub = $val * $gs->affilate_charge;
            $order['affilate_user'] = Session::get('affilate');
            $order['affilate_charge'] = $sub;
        }
        $order->save();

        $notf = null;
                    $vendor_ids = [];

                    $all_shipping_charge = json_decode($request->vendor_ship_ids,true);

                    foreach($all_shipping_charge as $own_id => $ship_charge){
                        $gs = Generalsetting::findOrfail(1);
                        if($gs->is_smtp == 1)
                        {
                            $ship_man = Shipping::findOrFail($ship_charge['id']);

                            if($ship_man->email){
                                $data = [
                                    'to' => $ship_man->email,
                                    'type' => "ship_order",
                                    'vendor_name' => '',
                                    'oamount' => "",
                                    'aname' => "",
                                    'aemail' => "",
                                    'wtitle' => "",
                                    'onumber' => $order->order_number,
                                    'owner_id' => $own_id
                                ];

                                $mailer = new GeniusMailer();
                                $mailer->shipMail($data,$order->id);
                            }

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
                            $vendor_order->shipping_charge = isset($all_shipping_charge[$prod['item']['user_id']]) ? (double) $all_shipping_charge[$prod['item']['user_id']]['price'] : 0;
                            $vendor_order->price = $vendor_price->price + isset($all_shipping_charge[$prod['item']['user_id']]) ? (double) $all_shipping_charge[$prod['item']['user_id']]['price'] : 0;
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
                            'aname' => $request->name,
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

        Session::forget('cart');

            Session::forget('already');
            Session::forget('coupon');
            Session::forget('coupon_total');
            Session::forget('coupon_total1');
            Session::forget('coupon_percentage');

        //Sending Email To Buyer

        if($gs->is_smtp == 1)
        {
        $data = [
            'to' => $request->email,
            'type' => "new_order",
            'cname' => $request->name ?? '',
            'oamount' => "",
            'aname' => "",
            'aemail' => "",
            'wtitle' => "",
            'onumber' => $order->order_number,
        ];

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
        return redirect($success_url);
    }


    // Capcha Code Image
    private function  code_image()
    {
        $actual_path = str_replace('project','',base_path());
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);

        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = $actual_path.'assets/front/fonts/NotoSans-Bold.ttf';
        $allowed_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $length = strlen($allowed_letters);
        $letter = $allowed_letters[rand(0, $length-1)];
        $word='';
        //$text_color = imagecolorallocate($image, 8, 186, 239);
        $text_color = imagecolorallocate($image, 0, 0, 0);
        $cap_length=6;// No. of character in image
        for ($i = 0; $i< $cap_length;$i++)
        {
            $letter = $allowed_letters[rand(0, $length-1)];
            imagettftext($image, 25, 1, 35+($i*25), 35, $text_color, $font, $letter);
            $word.=$letter;
        }
        $pixels = imagecolorallocate($image, 8, 186, 239);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixels);
        }
        session(['captcha_string' => $word]);
        imagepng($image, $actual_path."assets/images/capcha_code.png");
    }

}
