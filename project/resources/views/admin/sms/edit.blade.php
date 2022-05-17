@extends('layouts.admin')

@section('content')

            <div class="content-area">

              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading">{{ __('Edit Template') }} <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> {{ __("Back") }}</a></h4>
                      <ul class="links">
                        <li>
                          <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                        </li>
                        <li>
                          <a href="javascript:;">{{ __('SMS Settings') }}</a>
                        </li>
                        <li>
                          <a href="{{ route('admin-sms-edit',$data->id) }}">{{ __('Edit Template') }}</a>
                        </li>
                      </ul>
                  </div>
                </div>
              </div>

              <div class="add-product-content1">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product-description">
                      <div class="body-area">
                      @include('includes.admin.form-both') 

                                      <div class="row" >
                                        <div class="col-md-6 offset-md-4">
                                        <p>{{ __('Use the BB codes, it show the data dynamically in your SMS.') }}</p>
                                        <br>
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>{{ __('Meaning') }}</th>
                                                <th>{{ __('BB Code') }}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>{{ __('Customer Name') }}</td>
                                                <td>{customer_name}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ __('Order Amount') }}</td>
                                                <td>{order_amount}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ ('Admin Name') }}</td>
                                                <td>{admin_name}</td>
                                            </tr>
                                           
                                            <tr>
                                                <td>{{ __('Website Title') }}</td>
                                                <td>{website_title}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ __('Order Number') }}</td>
                                                <td>{order_number}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ __('Vendor Name') }}</td>
                                                <td>{vendor_name}</td>
                                            </tr>
                                            <tr>
                                                <td>{{ __('Email Verification Link') }}</td>
                                                <td>{otp_number}</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                        </div>
                                        </div>
                      <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                      <form id="geniusform" action="{{route('admin-sms-update',$data->id)}}" method="POST" enctype="multipart/form-data">
                        {{csrf_field()}}

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('SMS Type') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" name="sms_type" class="input-field" placeholder="{{ __('SMS Type') }}" value="{{$data->sms_type}}" readonly>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Select Language') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                              <select name="language_id" id="">
                                @foreach (DB::table('languages')->get() as $language)
                                    <option value="{{$language->id}}" {{$data->language_id == $language->id ? 'selected' : ''}}>{{$language->language}}</option>
                                @endforeach
                              </select>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Email Subject') }} *</h4>
                                <p class="sub-heading">{{ __('(In Any Language)') }}</p>
                            </div>
                            </div>

                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="sms_subject" placeholder="{{ __('SMS Subject') }}" required="" value="{{$data->sms_subject}}">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                              <h4 class="heading">{{ __('SMS Body') }} *</h4>
                              <p class="sub-heading">{{ __('(In Any Language)') }}</p>
                            </div>
                          </div>
                          <div class="col-lg-7">
                              <textarea class="input-field" name="sms_body" placeholder="{{ __('SMS Body') }}">{{ $data->sms_body }}</textarea> 
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                              
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <button class="addProductSubmit-btn" type="submit">{{ __('Save') }}</button>
                          </div>
                        </div>
                      </form>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

@endsection