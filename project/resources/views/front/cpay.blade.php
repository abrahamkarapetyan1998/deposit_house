

@extends('layouts.front')
@section('content')
<div class="">
			<?php
           
				$order_id = $orderss->order_number;
			
			if ( $order_id ) {

				$order                 = $order_id ;
				$redirect_url          = route("cpay.payment.success");
				$redirect_url_2        = route('cpay.payment.cancel');
				$order_total           = 1;
				$order_total_formatted = ( $orderss->pay_amount * 1 ) * 100;
				$billing_first_name    = $orderss->customer_name;
				$billing_last_name     = "";
				$billing_address       = $orderss->customer_address;
				$billing_town          = $orderss->customer_city;
				$billing_zip           = $orderss->customer_zip;
				$billing_phone         = $orderss->customer_phone;
				$billing_email         = $orderss->customer_email;

				$pay_to_merchant = $gs->merchant_key;
				$merchant_name   = $gs->merchant_name;
				$md5password     = $gs->cpay_password;

				$details_1 = 'Order #' . $order_id;
				$details_2 = $order_id;
                
				//$currency                = $this->currency ? $this->currency : $order->get_currency();
				$currency                = $curr->name;
				$org_currency            = $curr->name;
				$order_total_formatted_2 = sprintf( '%03d', mb_strlen( $order_total_formatted, 'UTF-8' ) );
				$pay_to_merchant_2       = sprintf( '%03d', mb_strlen( $pay_to_merchant, 'UTF-8' ) );
				$merchant_name_2         = sprintf( '%03d', mb_strlen( $merchant_name, 'UTF-8' ) );
				$currency_2              = sprintf( '%03d', mb_strlen( $currency, 'UTF-8' ) );
				$details_1_2             = sprintf( '%03d', mb_strlen( $details_1, 'UTF-8' ) );
				$details_2_2             = sprintf( '%03d', mb_strlen( $details_2, 'UTF-8' ) );
				$payment_ok_url_2        = sprintf( '%03d', mb_strlen( $redirect_url, 'UTF-8' ) );
				$payment_fail_url_2      = sprintf( '%03d', mb_strlen( $redirect_url_2, 'UTF-8' ) );
				$shipping_first_name     = sprintf( '%03d', mb_strlen( $billing_first_name, 'UTF-8' ) );
				$shipping_last_name      = sprintf( '%03d', mb_strlen( $billing_last_name, 'UTF-8' ) );
				$shipping_address        = sprintf( '%03d', mb_strlen( $billing_address, 'UTF-8' ) );
				$shipping_city           = sprintf( '%03d', mb_strlen( $billing_town, 'UTF-8' ) );
				$shipping_zip            = sprintf( '%03d', mb_strlen( $billing_zip, 'UTF-8' ) );
				$shipping_phone          = sprintf( '%03d', mb_strlen( $billing_phone, 'UTF-8' ) );
				$shipping_email          = sprintf( '%03d', mb_strlen( $billing_email, 'UTF-8' ) );
				$order_total_2           = sprintf( '%03d', mb_strlen( $order_total, 'UTF-8' ) );
				$org_currency_2          = sprintf( '%03d', mb_strlen( $org_currency, 'UTF-8' ) );
				if ( $currency !== $org_currency ) {
					$check_sum_header   = '17AmountToPay,PayToMerchant,MerchantName,AmountCurrency,Details1,Details2,PaymentOKURL,PaymentFailURL,FirstName,LastName,Address,City,Zip,Telephone,Email,OriginalAmount,OriginalCurrency,' . $order_total_formatted_2 . $pay_to_merchant_2 . $merchant_name_2 . $currency_2 . $details_1_2 . $details_2_2 . $payment_ok_url_2 . $payment_fail_url_2 . $shipping_first_name . $shipping_last_name . $shipping_address . $shipping_city . $shipping_zip . $shipping_phone . $shipping_email . $order_total_2 . $org_currency_2;
					$check_sum_header_2 = $check_sum_header . $order_total_formatted . $pay_to_merchant . $merchant_name . $currency . $details_1 . $details_2 . $redirect_url . $redirect_url_2 . $billing_first_name . $billing_last_name . $billing_address . $billing_town . $billing_zip . $billing_phone . $billing_email . $order_total . $org_currency . $md5password;
				} else {
					$check_sum_header   = '16AmountToPay,PayToMerchant,MerchantName,AmountCurrency,Details1,Details2,PaymentOKURL,PaymentFailURL,FirstName,LastName,Address,City,Zip,Telephone,Email,OriginalAmount,' . $order_total_formatted_2 . $pay_to_merchant_2 . $merchant_name_2 . $currency_2 . $details_1_2 . $details_2_2 . $payment_ok_url_2 . $payment_fail_url_2 . $shipping_first_name . $shipping_last_name . $shipping_address . $shipping_city . $shipping_zip . $shipping_phone . $shipping_email . $order_total_2;
					$check_sum_header_2 = $check_sum_header . $order_total_formatted . $pay_to_merchant . $merchant_name . $currency . $details_1 . $details_2 . $redirect_url . $redirect_url_2 . $billing_first_name . $billing_last_name . $billing_address . $billing_town . $billing_zip . $billing_phone . $billing_email . $order_total . $md5password;
				}
				$check_sum = md5( $check_sum_header_2 );
				$language  = 'mk-MK';
                $payment_url = 'https://www.cpay.com.mk/client/Page/default.aspx?xml_id=/mk-MK/.loginToPay/.simple/';
                // $payment_url = 'https://www.cpay.com.mk/Client/page/default.aspx?xml_id=/mk-MK/.TestLoginToPay/';
				?>
				
				    <h3>{{__('Payment Via Cpay')}}</h3>
				    
				    <form name="cpayForm" method="post" action="{{$payment_url}}" id="cpayForm" target="_self">
					<input id='AmountToPay' name='AmountToPay' value='<?php echo  $order_total_formatted; ?>' type='hidden' />
					<input id='PayToMerchant' name='PayToMerchant' value='<?php echo  $pay_to_merchant; ?>' type='hidden' />
					<input id='MerchantName' name='MerchantName' value='<?php echo  $merchant_name; ?>' type='hidden' />
					<input id='AmountCurrency' name='AmountCurrency' value='<?php echo  $currency; ?>' type='hidden' />
					<input id='Details1' name='Details1' value='<?php echo  $details_1; ?>' type='hidden' />
					<input id='Details2' name='Details2' value='<?php echo  $details_2; ?>' type='hidden' />
					<input id='PaymentOKURL' size='10' name='PaymentOKURL' value='<?php echo  $redirect_url; ?>' type='hidden' />
					<input id='PaymentFailURL' size='10' name='PaymentFailURL' value='<?php echo  $redirect_url_2; ?>' type='hidden' />
					<input id='CheckSumHeader' name='CheckSumHeader' value='<?php echo  $check_sum_header; ?>' type='hidden' />
					<input id='CheckSum' name='CheckSum' value='<?php echo  $check_sum; ?>' type='hidden' />
					<input id='FirstName' size='10' name='FirstName' value='<?php echo  $billing_first_name; ?>' type='hidden' />
					<input id='LastName' size='10' name='LastName' value='<?php echo  $billing_last_name; ?>' type='hidden' />
					<input id='Address' size='10' name='Address' value='<?php echo  $billing_address; ?>' type='hidden' />
					<input id='City' size='10' name='City' value='<?php echo  $billing_town; ?>' type='hidden' />
					<input id='Zip' size='10' name='Zip' value='<?php echo  $billing_zip; ?>' type='hidden' />
					<input id='Telephone' size='10' name='Telephone' value='<?php echo  $billing_phone; ?>' type='hidden' />
					<input id='Email' size='10' name='Email' value='<?php echo  $billing_email; ?>' type='hidden' />
					<input id='OriginalAmount' name='OriginalAmount' value='<?php echo  $order_total; ?>' type='hidden' />
					<?php if ( $currency !== $org_currency ) { ?>
						<input id='OriginalCurrency' name='OriginalCurrency' value='<?php echo  $org_currency; ?>' type='hidden' />
					<?php } ?>
					<button class='mybtn1' id="cpay_submit" value='{{ $langg->lang753 }}' type='submit'></button>
				</form>
				
			
			
			<?php } ?>
		</div>

@endsection
        @section('scripts')
        <script type="text/javascript">
            $('#cpay_submit').click();
        </script>
        @endsection
