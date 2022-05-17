<?php

namespace App\Classes;



use App\Models\Generalsetting;

use App\Models\Language;

use App\Models\SmsTemplete;

use Illuminate\Support\Facades\Session;







define("USE_SPECIFIED", 0);

define("USE_ALL_DEVICES", 1);

define("USE_ALL_SIMS", 2);





class SMS {



public function sendSingleMessage($number, array $smsData)

{

    $gs = Generalsetting::first();

    $url = $gs->sms_server  . "/services/send.php";



    $setup = Generalsetting::find(1);

    if(Session::has('language')){

        $language = Language::findOrFail(Session::get('language'));

    }else{

        $language = Language::whereIsDefault(1)->first();

    }
    $temp = SmsTemplete::where('sms_type','=',$smsData['type'])->whereLanguageId($language->id)->first();

    if(!$temp){

        $temp = SmsTemplete::where('sms_type','=',$smsData['type'])->first();

    }





    $body = '';

    if(isset($smsData['cname'])){

        $body = preg_replace("/{customer_name}/", $smsData['cname'] ,$temp->sms_body);

    }

    if(isset($smsData['vendor_name'])){

        $body = preg_replace("/{vendor_name}/", $smsData['vendor_name'] ,$temp->sms_body);

    }



    $body = preg_replace("/{order_amount}/", $smsData['oamount'] ,$body);

    $body = preg_replace("/{admin_name}/", $smsData['aname'] ,$body);

    $body = preg_replace("/{admin_name}/", $smsData['aname'] ,$body);

    $body = preg_replace("/{admin_email}/", $smsData['aemail'] ,$body);

    $body = preg_replace("/{order_number}/", $smsData['onumber'] ,$body);

    $body = preg_replace("/{otp_number}/", $smsData['otp'] ?? '' ,$body);

    $body = preg_replace("/{website_title}/", $setup->title ,$body);



    $postData = array(

        'number' => $number,

        'message' => $body,

        'key' => $gs->sms_api_key,

    );

    return $this->sendRequest($url, $postData)["messages"][0];

}





function sendRequest($url, $postData)

{

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_POST, true);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));

    $response = curl_exec($ch);

    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    if (curl_errno($ch)) {

        throw new Exception(curl_error($ch));

    }



    curl_close($ch);

    if ($httpCode == 200) {

        $json = json_decode($response, true);

        if ($json == false) {

            if (empty($response)) {

                throw new Exception("Missing data in request. Please provide all the required information to send messages.");

            } else {

                throw new Exception($response);

            }

        } else {

            if ($json["success"]) {

                return $json["data"];

            } else {

                throw new Exception($json["error"]["message"]);

            }

        }

    } else {

        throw new Exception("HTTP Error Code :{$httpCode}");

    }

}



}

