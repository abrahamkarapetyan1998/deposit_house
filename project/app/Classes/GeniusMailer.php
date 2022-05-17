<?php
/**
 * Created by PhpStorm.
 * User: ShaOn
 * Date: 11/29/2018
 * Time: 12:49 AM
 */

namespace App\Classes;

use App\Models\Admin;
use App\Models\EmailTemplate;
use App\Models\Generalsetting;
use App\Models\Language;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Str;
use PDF;
use Illuminate\Support\Facades\Mail;
use Config;
use Illuminate\Support\Facades\Session;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class GeniusMailer
{
    public function __construct()
    {
     
    }

    public function sendAutoOrderMail(array $mailData,$id)
    {
        $setup = Generalsetting::find(1);
        if(Session::has('language')){
            $language = Language::findOrFail(Session::get('language'));
        }else{
            $language = Language::whereIsDefault(1)->first();
        }
        $temp = EmailTemplate::where('email_type','=',$mailData['type'])->whereLanguageId($language->id)->first();
        if(!$temp){
            $temp = EmailTemplate::where('email_type','=',$mailData['type'])->first();
        }
     
        $body = '';
        if(isset($mailData['cname'])){
            $body = preg_replace("/{customer_name}/", $mailData['cname'] ,$temp->email_body);
        }
        if(isset($mailData['vendor_name'])){
            $body = preg_replace("/{vendor_name}/", $mailData['vendor_name'] ,$temp->email_body);
        }
        
        $body = preg_replace("/{order_amount}/", $mailData['oamount'] ,$body);
        $body = preg_replace("/{admin_name}/", $mailData['aname'] ,$body);
        $body = preg_replace("/{admin_name}/", $mailData['aname'] ,$body);
        $body = preg_replace("/{admin_email}/", $mailData['aemail'] ,$body);
        $body = preg_replace("/{order_number}/", $mailData['onumber'] ,$body);
        $body = preg_replace("/{website_title}/", $setup->title ,$body);

   


         $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = $setup->smtp_host;
            $mail->SMTPAuth   = true;
            $mail->Username   = $setup->smtp_user;
            $mail->Password   =  $setup->smtp_pass;
            if ($setup->email_encryption == 'ssl') {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            } else {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            }
            $mail->Port       = $setup->smtp_port;
            $mail->CharSet = 'UTF-8';
            $mail->setFrom($setup->from_email, $setup->title);
            $mail->addAddress($mailData['to'], isset($mailData['cname']) ? $mailData['cname'] : '');
            $mail->addReplyTo($setup->from_email, $setup->title);
            $mail->isHTML(true);
            $mail->Subject = $temp->email_subject;
            $mail->Body    = $body;
           
            $mail->send();
        } catch (Exception $e) {
           
        }

     
    }

    public function sendAutoMail(array $mailData)
    {
        $setup = Generalsetting::find(1);
        if(Session::has('language')){
            $language = Language::findOrFail(Session::get('language'));
        }else{
            $language = Language::whereIsDefault(1)->first();
        }
        $temp = EmailTemplate::where('email_type','=',$mailData['type'])->whereLanguageId($language->id)->first();
        if(!$temp){
            $temp = EmailTemplate::where('email_type','=',$mailData['type'])->first();
        }
        $body = preg_replace("/{customer_name}/", isset($mailData['cname']) ? $mailData['cname'] : '' ,$temp->email_body);
        $body = preg_replace("/{order_amount}/", $mailData['oamount'] ,$body);
        $body = preg_replace("/{admin_name}/", isset($mailData['aname']) ? $mailData['aname'] : '' ,$body);
        $body = preg_replace("/{admin_email}/", $mailData['aemail'] ,$body);
        $body = preg_replace("/{order_number}/", $mailData['onumber'] ,$body);
        $body = preg_replace("/{website_title}/", $setup->title ,$body);

        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = $setup->smtp_host;
            $mail->SMTPAuth   = true;
            $mail->Username   = $setup->smtp_user;
            $mail->Password   =  $setup->smtp_pass;
            if ($setup->email_encryption == 'ssl') {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            } else {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            }
            $mail->Port       = $setup->smtp_port;
            $mail->CharSet = 'UTF-8';
            $mail->setFrom($setup->from_email, $setup->title);
            $mail->addAddress($mailData['to'], isset($mailData['cname']) ? $mailData['cname'] : (isset($mailData['aname']) ? $mailData['aname'] : ''));
            $mail->addReplyTo($setup->from_email, $setup->title);
            $mail->isHTML(true);
            $mail->Subject = $temp->email_subject;
            $mail->Body    = $body;
            $mail->send();
        } catch (Exception $e) {
            //throw new Exception($e);
        }
    }




    public function shipMail(array $mailData,$id)
    {
        $order = Order::findOrFail($id);
        $cart  = json_decode($order->cart,true);
        if($mailData['owner_id'] == 0){
            $shipping_info = Admin::findOrFail(1);
            $shipping_type = 'admin';
        }else{
            $shipping_info = User::findOrFail($mailData['owner_id']);
            $shipping_type = 'vendor';
        }

        $setup = Generalsetting::find(1);
        if(Session::has('language')){
            $language = Language::findOrFail(Session::get('language'));
        }else{
            $language = Language::whereIsDefault(1)->first();
        }
        $temp = EmailTemplate::where('email_type','=',$mailData['type'])->whereLanguageId($language->id)->first();
        if(!$temp){
            $temp = EmailTemplate::where('email_type','=',$mailData['type'])->first();
        }
        $body = preg_replace("/{customer_name}/", isset($mailData['cname']) ? $mailData['cname'] : '' ,$temp->email_body);
        $body = preg_replace("/{order_amount}/", $mailData['oamount'] ,$body);
        $body = preg_replace("/{admin_name}/", isset($mailData['aname']) ? $mailData['aname'] : '' ,$body);
        $body = preg_replace("/{admin_email}/", $mailData['aemail'] ,$body);
        $body = preg_replace("/{order_number}/", $mailData['onumber'] ,$body);
        $body = preg_replace("/{website_title}/", $setup->title ,$body);

        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = $setup->smtp_host;
            $mail->SMTPAuth   = true;
            $mail->Username   = $setup->smtp_user;
            $mail->Password   =  $setup->smtp_pass;
            if ($setup->email_encryption == 'ssl') {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            } else {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            }
            $mail->Port       = $setup->smtp_port;
            $mail->CharSet = 'UTF-8';
            $mail->setFrom($setup->from_email, $setup->title);
            $mail->addAddress($mailData['to'], isset($mailData['cname']) ? $mailData['cname'] : (isset($mailData['aname']) ? $mailData['aname'] : ''));
            $mail->addReplyTo($setup->from_email, $setup->title);

            $fileName = 'assets/temp_files/'.Str::random(4).time().'.pdf';
            
            $pdf = PDF::loadView('print.ship_order', compact('order', 'cart','shipping_info','shipping_type'))->save($fileName);
            $mail->addAttachment($fileName);   
            $mail->isHTML(true);
            $mail->Subject = $temp->email_subject;
            $mail->Body    = $body;
           
            $mail->send();
        } catch (Exception $e) {
           dd($e);
        }
    }


    public function sendRegisterCustomMail(array $mailData)
    {
        $setup = Generalsetting::find(1);
        if(Session::has('language')){
            $language = Language::findOrFail(Session::get('language'));
        }else{
            $language = Language::whereIsDefault(1)->first();
        }
        $temp = EmailTemplate::where('email_type','=',$mailData['type'])->whereLanguageId($language->id)->first();
        if(!$temp){
            $temp = EmailTemplate::where('email_type','=',$mailData['type'])->first();
        }
        
        $body = preg_replace("/{customer_name}/", $mailData['cname'] ,$temp->email_body);
        $body = preg_replace("/{order_amount}/", $mailData['oamount'] ,$body);
        $body = preg_replace("/{admin_name}/", $mailData['aname'] ,$body);
        $body = preg_replace("/{admin_email}/", $mailData['aemail'] ,$body);
        $body = preg_replace("/{order_number}/", $mailData['onumber'] ,$body);
        $body = preg_replace("/{verification_link}/", $mailData['verify_link'] ,$body);
        $body = preg_replace("/{website_title}/", $setup->title ,$body);

        $data = [
            'email_body' => $body
        ];

       
       $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = $setup->smtp_host;
            $mail->SMTPAuth   = true;
            $mail->Username   = $setup->smtp_user;
            $mail->Password   =  $setup->smtp_pass;
            if ($setup->email_encryption == 'ssl') {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            } else {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            }
            $mail->Port       = $setup->smtp_port;
            $mail->CharSet = 'UTF-8';
            $mail->setFrom($setup->from_email, $setup->title);
            $mail->addAddress($mailData['to'], $mailData['cname']);
            $mail->addReplyTo($setup->from_email, $setup->title);
            $mail->isHTML(true);
            $mail->Subject = $temp->email_subject;
            $mail->Body    = $body;
            $mail->send();
        } catch (Exception $e) {
            dd($e);
        }
    }

    public function sendCustomMail(array $mailData)
    {
        
        $gs = Generalsetting::findOrFail(1);
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = $gs->smtp_host;
            $mail->SMTPAuth   = true;
            $mail->Username   = $gs->smtp_user;
            $mail->Password   =  $gs->smtp_pass;
            if ($gs->email_encryption == 'ssl') {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            } else {
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            }
            $mail->Port       = $gs->smtp_port;
            $mail->CharSet = 'UTF-8';
            $mail->setFrom($gs->from_email, $gs->title);
            $mail->addAddress($mailData['to'], $mailData['cname'] ?? '');
            $mail->addReplyTo($gs->from_email, $gs->title);
            $mail->isHTML(true);
            $mail->Subject = $mailData['subject'];
            $mail->Body    = $mailData['body'];
            $mail->send();
        } catch (Exception $e) {
            
            //throw new Exception($e);
        }
        return true;
    }

}