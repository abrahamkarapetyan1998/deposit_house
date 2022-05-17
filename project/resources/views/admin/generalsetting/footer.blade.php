@extends('layouts.admin')

@section('content')

<div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading">{{ __('Website Footer') }}</h4>
                    <ul class="links">
                      <li>
                        <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                      </li>
                      <li>
                        <a href="javascript:;">{{ __('General Settings') }}</a>
                      </li>
                      <li>
                        <a href="{{ route('admin-gs-footer') }}">{{ __('Footer') }}</a>
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
                        <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                        <form id="geniusform" action="{{ route('admin-gs-update') }}" method="POST" enctype="multipart/form-data">
                          {{ csrf_field() }}

                        @include('includes.admin.form-both')  

                        
                            @php
                                $footer_text_language = json_decode($gs->footer_language ,true);
                            @endphp
                            @foreach (DB::table('languages')->get() as $language)
                              <div class="row justify-content-center">
                                <div class="col-lg-3">
                                  <div class="left-area">
                                    <h4 class="heading">
                                        {{ __('Footer Text') }} *
                                        <p class="sub-heading">{{ $language->language }}</p>
                                    </h4>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="tawk-area">
                                      <textarea class="input-field" name="footer_language[{{$language->id}}][footer]"   required="">{{ isset($footer_text_language["$language->id"]["footer"]) ? $footer_text_language["$language->id"]["footer"] : '' }}  </textarea>
                                    </div>
                                </div>
                              </div>
                            <div class="row justify-content-center">
                                <div class="col-lg-3">
                                  <div class="left-area">
                                    <h4 class="heading">
                                        {{ __('Copyright Text') }} *
                                        <p class="sub-heading">{{ $language->language }}</p>
                                    </h4>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="tawk-area">
                                      <textarea class="nic-edit" name="footer_language[{{$language->id}}][copyright]"  required="">{{ isset($footer_text_language["$language->id"]["copyright"]) ? $footer_text_language["$language->id"]["copyright"] : '' }}  </textarea>
                                    </div>
                                </div>
                              </div>
                            @endforeach

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                              
                            </div>
                          </div>
                          <div class="col-lg-6">
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