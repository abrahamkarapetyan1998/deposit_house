@extends('layouts.admin')



@section('content')
<div class="content-area">
    <div class="mr-breadcrumb">
      <div class="row">
        <div class="col-lg-12">
            <h4 class="heading">{{ __('Edit Language') }} <a class="add-btn" href="{{route('admin-lang-index')}}"><i class="fas fa-arrow-left"></i> {{ __('Back') }}</a></h4>
            <ul class="links">
              <li>
                <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
              </li>
            <li><a href="javascript:;">{{ __('Language Settings') }}</a></li>
            <li>
              <a href="{{ route('admin-lang-index') }}">{{ __('Website Language') }} </a>
            </li>
              <li>
                <a href="{{ route('admin-lang-edit',$data->id) }}">{{ __('Edit') }}</a>
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
              <form id="geniusform" action="{{route('admin-lang-update',$data->id)}}" method="POST" enctype="multipart/form-data">
                {{csrf_field()}}
              @include('includes.admin.form-both')  
                <div class="row">
                  <div class="col-lg-4">
                    <div class="left-area">
                        <h4 class="heading">Search *</h4>
                        <p class="sub-heading">{{ __('(In Any Language)') }}</p>
                    </div>
                  </div>
                  <div class="col-lg-7">
                    <input type="text" class="input-field" placeholder="Search" value="" >
                  </div>
                </div>

                <div class="row">
                  <div class="col-lg-4">
                    <div class="left-area">
                        <h4 class="heading">{{ __('Language') }} *</h4>
                        <p class="sub-heading">{{ __('(In Any Language)') }}</p>
                    </div>
                  </div>
                  <div class="col-lg-7">
                    <input type="text" class="input-field" name="language" placeholder="{{ __('Language') }}" value="{{$data->language}}" required="">
                  </div>
                </div>

                @php
                $search = "lang";
                @endphp
            <div class="lang-tag-top-filds" id="lang-section">
            @foreach ($lang as $key => $la)
            @if(!preg_match("/{$search}/i", $key)) 
            <div class="lang-area">
                <div class="row">
                <div class="col-lg-6">
                    <textarea name="keys[]" class="input-field" placeholder="{{ __('Enter Language Key') }}" required="">{{ $key }}</textarea>
                </div>
                <div class="col-lg-6">
                    <textarea  name="values[]" class="input-field" placeholder="{{ __('Enter Language Value') }}" required="">{{ $la }}</textarea>
                </div>
                </div>
            </div>

            @else
            <div class="row">
                <div class="col-lg-4">
                <div class="left-area">
                    <h4 class="heading">{{ $la }} *</h4>
                    <p class="sub-heading">(In Any Language)</p>
                </div>
                </div>
                <div class="col-lg-7">
                <input type="text" class="input-field" name="{{$key}}" placeholder="{{ $la }}" required="" value="{{ $la }}">
                </div>
            </div>
            @endif
            @endforeach
            </div>
            
         
             
            <div class="text-center">
                <a href="javascript:;" id="lang-btn" class="add-fild-btn"><i class="icofont-plus"></i> {{ __('Add More Field') }}</a>
            </div>
           
            {{$lang->links()}}
            <div class="row">
                <div class="col-lg-5">
                  <div class="left-area">
                    
                  </div>
                </div>
                <div class="col-lg-6">
                  <button class="addProductSubmit-btn" type="submit">Save</button>
                </div>
              </div>
        
        </div>
     

            
            </form>

 </div>
  
@endsection


@section('scripts')

<script type="text/javascript">
  

  (function($) {
		"use strict";

  function isEmpty(el){
      return !$.trim(el.html())
  }
  
$("#lang-btn").on('click', function(){

    $("#lang-section").append(''+
                                '<div class="lang-area">'+
                                  '<span class="remove lang-remove"><i class="fas fa-times"></i></span>'+
                                  '<div class="row">'+
                                    '<div class="col-lg-6">'+
                                    '<textarea name="keys[]" class="input-field" placeholder="{{ __('Enter Language Key') }}" required=""></textarea>'+
                                    '</div>'+
                                    '<div class="col-lg-6">'+
                                    '<textarea  name="values[]" class="input-field" placeholder="{{ __('Enter Language Value') }}" required=""></textarea>'+
                                    '</div>'+
                                  '</div>'+
                                '</div>'+
                            '');

});

$(document).on('click','.lang-remove', function(){

    $(this.parentNode).remove();
    if (isEmpty($('#lang-section'))) {

    $("#lang-section").append(''+
                                '<div class="lang-area">'+
                                  '<span class="remove lang-remove"><i class="fas fa-times"></i></span>'+
                                  '<div class="row">'+
                                    '<div class="col-lg-6">'+
                                    '<textarea name="keys[]" class="input-field" placeholder="{{ __('Enter Language Key') }}" required=""></textarea>'+
                                    '</div>'+
                                    '<div class="col-lg-6">'+
                                    '<textarea  name="values[]" class="input-field" placeholder="{{ __('Enter Language Value') }}" required=""></textarea>'+
                                    '</div>'+
                                  '</div>'+
                                '</div>'+
                            '');


    }

});


})(jQuery);

</script>

@endsection