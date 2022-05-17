@extends('layouts.front')



@section('content')



<section class="login-signup">

  <div class="container">

    <div class="row justify-content-center">

      <div class="col-lg-6">

        <nav class="comment-log-reg-tabmenu">

          <div class="nav nav-tabs" id="nav-tab" role="tablist">

            <a class="nav-item nav-link login active" id="nav-log-tab" data-toggle="tab" href="#nav-log" role="tab"

              aria-controls="nav-log" aria-selected="true">

              {{ $langg->lang234 }}

            </a>

            <a class="nav-item nav-link" id="nav-reg-tab" data-toggle="tab" href="#nav-reg" role="tab"

              aria-controls="nav-reg" aria-selected="false">

              {{ $langg->lang235 }}

            </a>

          </div>

        </nav>

        <div class="tab-content" id="nav-tabContent">

          <div class="tab-pane fade show active" id="nav-log" role="tabpanel" aria-labelledby="nav-log-tab">

            <div class="login-area">

              <div class="header-area">

                <h4 class="title">{{ $langg->lang234 }}</h4>

              </div>

              <div class="login-form signin-form">

                @include('includes.admin.form-login')

                <form class="mloginform" data-success="{{__('Success!')}}" action="{{ route('user.login.submit') }}" method="POST">

                  {{ csrf_field() }}

                  <div class="form-input">

                    <input type="email" name="email" placeholder="{{ $langg->lang173 }}" required="">

                    <i class="icofont-user-alt-5"></i>

                  </div>

                  <div class="form-input">

                    <input type="password" class="Password" name="password" placeholder="{{ $langg->lang174 }}"

                      required="">

                    <i class="icofont-ui-password"></i>

                  </div>

                  <div class="form-forgot-pass">

                    <div class="left">

                      <input type="checkbox" name="remember" id="mrp" {{ old('remember') ? 'checked' : '' }}>

                      <label for="mrp">{{ $langg->lang175 }}</label>

                    </div>

                    <div class="right">

                      <a href="{{ route('user-forgot') }}">

                        {{ $langg->lang176 }}

                      </a>

                    </div>

                  </div>

                  <input type="hidden" name="vendor" id="es_meky"  value="1">

                  <input class="mauthdata" type="hidden" value="{{ $langg->lang177 }}">

                  <button type="submit" class="submit-btn">{{ $langg->lang178 }}</button>

                  @if(App\Models\Socialsetting::find(1)->f_check == 1 || App\Models\Socialsetting::find(1)->g_check ==

                  1)

                  <div class="social-area">

                    <h3 class="title">{{ $langg->lang179 }}</h3>

                    <p class="text">{{ $langg->lang180 }}</p>

                    <ul class="social-links">

                      @if(App\Models\Socialsetting::find(1)->f_check == 1)

                      <li>

                        <a href="{{ route('social-provider','facebook') }}">

                          <i class="fab fa-facebook-f"></i>

                        </a>

                      </li>

                      @endif

                      @if(App\Models\Socialsetting::find(1)->g_check == 1)

                      <li>

                        <a href="{{ route('social-provider','google') }}">

                          <i class="fab fa-google-plus-g"></i>

                        </a>

                      </li>

                      @endif

                    </ul>

                  </div>

                  @endif

                </form>

              </div>

            </div>

          </div>

          <div class="tab-pane fade" id="nav-reg" role="tabpanel" aria-labelledby="nav-reg-tab">

            <div class="login-area signup-area">

              <div class="header-area">

                <h4 class="title">{{ $langg->lang235 }}</h4>

              </div>

              <div class="login-form signup-form">

                @include('includes.admin.form-login')

                <form class="mregisterform" data-is-vendor = "1" action="{{route('user-register-submit')}}" method="POST">

                  {{ csrf_field() }}





                            <div class="form-input">

                                <input type="text" class="User Name" name="name" placeholder="{{ $langg->lang182 }}" required="">

                                <i class="icofont-user-alt-5"></i>

                            	</div>



                            <div class="form-input">

                                <input type="email" class="User Name" name="email" placeholder="{{ $langg->lang183 }}" required="">

                                <i class="icofont-email"></i>

                            </div>





                             <div class="form-input">

                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" class="User Name" name="phone" placeholder="{{ $langg->lang184 }}" required="">

                                <i class="icofont-phone"></i>

                            </div>







                            <div class="form-input">

                                <input type="text" class="User Name" name="address" placeholder="{{ $langg->lang185 }}" required="">

                                <i class="icofont-location-pin"></i>

                            </div>



                            <div class="form-input">

                                <input type="text" class="User Name" name="shop_name" placeholder="{{ $langg->lang238 }}" required="">

                                <i class="icofont-cart-alt"></i>

                            </div>







                            <div class="form-input">

                                <input type="text" class="User Name" name="shop_address" placeholder="{{ $langg->lang241 }}" required="">

                                <i class="icofont-opencart"></i>

                            </div>





                            <div class="form-input">

                                 <select class="" name="country" required>

                                <option value="">{{ $langg->lang157 }}</option>

                                @foreach (DB::table('countries')->whereStatus(1)->get() as $data)

                                    <option value="{{ $data->country_name }}" >

                                        {{ $data->country_name }}

                                    </option>

                               @endforeach

                               </select>

                               <i class="icofont-globe"></i>

                            </div>



                             <input type="hidden" name="vendor"  id="is_vendor"  value="1">



                            <div class="form-input">

                                <input type="text" class="User Name" name="city" placeholder="{{ $langg->lang268 }}" required="">

                               <i class="icofont-building"></i>

                            </div>



                             <div class="form-input">

                                <input type="text" class="User Name" name="zip" placeholder="{{ $langg->lang269 }}" required="">

                               <i class="icofont-building"></i>

                            </div>







                            <div class="form-input">

                                <input type="password" class="Password" name="password" placeholder="{{ $langg->lang186 }}" required="">

                                <i class="icofont-ui-password"></i>

                            </div>





 								<div class="form-input">

                                <input type="password" class="Password" name="password_confirmation" placeholder="{{ $langg->lang187 }}" required="">

                                <i class="icofont-ui-password"></i>

                            	</div>







                  @if($gs->is_capcha == 1)

                  <div class="form-input">

                       {!! NoCaptcha::display() !!}

                       {!! NoCaptcha::renderJs() !!}

                       @error('g-recaptcha-response')

                       <p class="my-2">{{$message}}</p>

                       @enderror

                   </div>

                   @endif



                  <div class="left">

                    <input type="checkbox" id="trams_conditision">

                    <label for="trams_conditision">{{ __('Accept Terms and Agreements') }} <a href="{{$gs->trams_link}}"> <strong>{{$langg->lang38}}</strong></a></label>

                  </div>



                  <input class="mprocessdata" type="hidden" value="{{ $langg->lang188 }}">

                  <button type="submit" disabled  id="submit_button" class="submit-btn">{{ $langg->lang189 }}</button>



                </form>

              </div>

            </div>

          </div>

        </div>



      </div>



    </div>

  </div>

</section>













@endsection



@section('scripts')

    <script>

      $(document).on('change','#trams_conditision',function(){

        if($(this).is(':checked')){

          $('#submit_button').attr('disabled',false);

        }else{

          $('#submit_button').attr('disabled',true);

        }

      })

    </script>

@endsection
