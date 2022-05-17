@extends('layouts.front')

@section('content')

<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="pages">
                    <li>
                        <a href="{{ route('front.index') }}">
                            {{ $langg->lang17 }}
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            {{ __('OTP Verification') }} 
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<section class="login-signup forgot-password">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="login-area">
                    <div class="header-area forgot-passwor-area">
                        <h4 class="title">{{ __('OTP Verification') }} </h4>
                        <p class="text">{{ __('Please Write Your OTP') }} </p>
                    </div>
                    <div class="login-form">
                        @include('includes.admin.form-login')
                        <form id="forgotform" action="{{route('user-otp-verify-submit')}}" method="POST">
                            {{ csrf_field() }}
                            
                            <div class="form-input">
                                <input type="text" name="otp" class="" placeholder="{{ __('Enter Your OTP') }}"
                                    required="">
                                <a href="{{route('user.otp.verify.resend',$email)}}" title="{{__('Resend OTP')}}"><i class="fas fa-sync"></i></a>
                            </div>
                            <div class="to-login-page">
                                <a href="{{ route('user.login') }}">
                                    {{ $langg->lang194 }}
                                </a>
                            </div>
                            <input class="authdata" type="hidden" value="{{ $langg->lang195 }}">
                            <button type="submit" class="submit-btn">{{ $langg->lang196 }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection