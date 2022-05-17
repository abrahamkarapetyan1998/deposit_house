@extends('layouts.admin') 

@section('styles')

<style type="text/css">
    
.input-field { 
    padding: 15px 20px; 
}

</style>

@endsection

@section('content')  

<input type="hidden" id="headerdata" value="{{ __('ORDER') }}">

                    <div class="content-area">
                        <div class="mr-breadcrumb">
                            <div class="row">
                                <div class="col-lg-12">
                                        <h4 class="heading">{{ __('All Orders') }}</h4>
                                        <ul class="links">
                                            <li>
                                                <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">{{ __('Orders') }}</a>
                                            </li>
                                            <li>
                                                <a href="{{ route('admin-order-index','all') }}">{{ __('All Orders') }}</a>
                                            </li>
                                        </ul>
                                </div>
                            </div>
                        </div>
                        <div class="product-area">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mr-table allproduct">
                                        @include('includes.admin.form-success') 
                                        <div class="table-responsiv">
                                        <div class="gocover " style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                                                <table id="geniustablee" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                             <th class="d-none">{{ __('#') }}</th>
                                                            <th>{{ __('Customer Email') }}</th>
                                                            <th>{{ __('Vendor Email') }}</th>
                                                            <th>{{ __('Product Title') }}</th>
                                                            <th>{{ __('Order Status') }}</th>
                                                            <th>{{ __('Order Number') }}</th>
                                                            <th>{{ __('Date Of Completed') }}</th>
                                                            <th>{{ __('Total Qty') }}</th>
                                                            <th>{{ __('Vendor Order Status') }}</th>
                                                            <th>{{ __('Total Cost') }}</th>
                                                            <th>{{ __('Admin Order Status') }}</th>
                                                            <th>{{ __('Order Date') }}</th>
                                                            <th>{{ __('Options') }}</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    
                                            
                                                        @foreach ($datas as $order)
                                                            @foreach (json_decode($order->cart,true)['items'] as $item)
                                                         
                                                            
                                                            <tr>
                                                                <td class="d-none">{{$order->id}}</td>
                                                                <td>{{$order->customer_email}}</td>
                                                                <td>{{ isset($order->vendororders->where('user_id',$item['item']['user_id'])->first()->user->email) ? $order->vendororders->where('user_id',$item['item']['user_id'])->first()->user->email : '--'}}</td>
                                                                <td><strong>ID: {{$item['item']['id']}}</strong> : {{mb_strlen($item['item']['name'],'UTF-8') > 50 ? mb_substr($item['item']['name'],0,50,'UTF-8').'...' : $item['item']['name']}}</td>
                                                                <td class="order-status {{ $order->status }}">{{ucwords($order->status)}}</td>
                                                                <td>{{$order->order_number}}</td>
                                                                <td>{{$order->status == 'completed' ? $order->updated_at->format('d-M-Y') : '--'}}</td>
                                                                <td>{{$item['qty']}}</td>
                                                                @if($order->vendororders->count() > 0)
                                                                <td class="order-status {{ $order->vendororders->where('user_id',$item['item']['user_id'])->first()->status }}">{{$order->vendororders->where('user_id',$item['item']['user_id'])->first()->status}}</td>
                                                                @else
                                                                <td class="order-status">N/A</td>
                                                                @endif
                                                                <td>{{$order->currency_sign . round($order->pay_amount * $order->currency_value , 2)}}</td>
                                                                <td class="order-status {{ $order->status }}">{{$order->status}}</td>
                                                                @php
                                                                    $return = '<a href="javascript:;" data-href="'. route('admin-order-edit',$order->id) .'" class="delivery" data-toggle="modal" data-target="#modal1"><i class="fas fa-dollar-sign"></i> Delivery Status</a>';
                                                                    $return_data = '<div class="godropdown"><button class="go-dropdown-toggle"> Actions<i class="fas fa-chevron-down"></i></button><div class="action-list"><a href="' . route('admin-order-show',$order->id) . '" > <i class="fas fa-eye"></i> Details</a><a href="javascript:;" class="send" data-email="'. $order->customer_email .'" data-toggle="modal" data-target="#vendorform"><i class="fas fa-envelope"></i> Send</a><a href="javascript:;" data-href="'. route('admin-order-track',$order->id) .'" class="track" data-toggle="modal" data-target="#modal1"><i class="fas fa-truck"></i> Track Order</a>'.$return.'</div></div>';
                                                                @endphp 
                                                                <td>{{ $order->created_at->format('d-M-Y')}}</td>
                                                                <td>
                                                                    @php
                                                                        echo $return_data;
                                                                    @endphp
                                                                </td>
                                                            </tr>
                                                            @endforeach
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

{{-- ORDER MODAL --}}

<div class="modal fade" id="confirm-delete1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="submit-loader">
            <img  src="{{asset('assets/images/'.$gs->admin_loader)}}" alt="">
        </div>
    <div class="modal-header d-block text-center">
        <h4 class="modal-title d-inline-block">{{ __('Update Status') }}</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
    </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p class="text-center">{{ __("You are about to update the order's Status.") }}</p>
        <p class="text-center">{{ __('Do you want to proceed?') }}</p>
        <input type="hidden" id="t-add" value="{{ route('admin-order-track-add') }}">
        <input type="hidden" id="t-id" value="">
        <input type="hidden" id="t-title" value="">
        <textarea class="input-field" placeholder="Enter Your Tracking Note (Optional)" id="t-txt"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('Cancel') }}</button>
            <a class="btn btn-success btn-ok order-btn">{{ __('Proceed') }}</a>
      </div>

    </div>
  </div>
</div>

{{-- ORDER MODAL ENDS --}}



{{-- MESSAGE MODAL --}}
<div class="sub-categori">
    <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="vendorformLabel">{{ __('Send Email') }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
            <div class="modal-body">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="contact-form">
                                <form id="emailreply">
                                    {{csrf_field()}}
                                    <ul>
                                        <li>
                                            <input type="email" class="input-field eml-val" id="eml" name="to" placeholder="{{ __('Email') }} *" value="" required="">
                                        </li>
                                        <li>
                                            <input type="text" class="input-field" id="subj" name="subject" placeholder="{{ __('Subject') }} *" required="">
                                        </li>
                                        <li>
                                            <textarea class="input-field textarea" name="message" id="msg" placeholder="{{ __('Your Message') }} *" required=""></textarea>
                                        </li>
                                    </ul>
                                    <button class="submit-btn" id="emlsub" type="submit">{{ __('Send Email') }}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

{{-- MESSAGE MODAL ENDS --}}

{{-- ADD / EDIT MODAL --}}

                <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
                                        
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                                                <div class="submit-loader">
                                                        <img  src="{{asset('assets/images/'.$gs->admin_loader)}}" alt="">
                                                </div>
                                            <div class="modal-header">
                                            <h5 class="modal-title"></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">

                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                                            </div>
                        </div>
                    </div>

                </div>

{{-- ADD / EDIT MODAL ENDS --}}

@endsection    

@section('scripts')
<script>
    var table = $('#geniustablee').DataTable({
    
 "order": [[ 0, "desc" ]]
  
    });
  
</script>

    
@endsection   