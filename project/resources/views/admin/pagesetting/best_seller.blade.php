@extends('layouts.admin')
@section('content')

            <div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading">{{ __('Right Side Banner1') }} </h4>
                      <ul class="links">
                        <li>
                          <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                        </li>
                        <li>
                          <a href="javascript:;">{{ __('Home Page Settings') }} </a>
                        </li>
                        <li>
                          <a id="banner_url" href="{{ url()->current() }}">{{ __('Right Side Banner1') }} </a>
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
                      <form id="geniusform" action="{{ route('admin-ps-sidebanner-submit') }}" method="POST" enctype="multipart/form-data">
                        {{csrf_field()}}

                        @include('includes.admin.form-both')  
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{__('Select Language')}} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <select name="language_id" required id="language_select">
                              @foreach (DB::table('languages')->get() as $lang)
                                <option value="{{$lang->id}}" {{$lang->id == $language ? 'selected' : ''}}>{{$lang->language}}</option>
                              @endforeach
                            </select>
                          </div>
                        </div>

                        @if ($data)
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading"> {{ __('Top Banner Image') }} *</h4>
                                <small>{{ __('(Preferred SIze: 285 X 410 Pixel)') }}</small>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <div class="img-upload">
                                <div id="image-preview" class="img-preview" style="background: url({{ $data->best_seller_banner ? asset('assets/images/test/'.$data->best_seller_banner):asset('assets/images/noimage.png') }});">
                                    <label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i>{{ __('Upload Image') }}</label>
                                    <input type="file" name="best_seller_banner" class="img-upload" id="image-upload">
                                  </div>

                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Link') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="best_seller_banner_link" placeholder="{{ __('Link') }}" required="" value="{{$data->best_seller_banner_link}}">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading"> {{ __('Bottom Banner Image') }} *</h4>
                                <small>{{ __('(Preferred SIze: 285 X 410 Pixel)') }}</small>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <div class="img-upload">
                                <div id="image-preview" class="img-preview" style="background: url({{ $data->best_seller_banner1 ? asset('assets/images/test/'.$data->best_seller_banner1):asset('assets/images/noimage.png') }});">
                                    <label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i>{{ __('Upload Image') }}</label>
                                    <input type="file" name="best_seller_banner1" class="img-upload" id="image-upload">
                                  </div>

                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Link') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="best_seller_banner_link1" placeholder="{{ __('Link') }}" required="" value="{{$data->best_seller_banner_link1}}">
                          </div>
                        </div>

                        @else

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading"> {{ __('Top Banner Image') }} *</h4>
                                <small>{{ __('(Preferred SIze: 285 X 410 Pixel)') }}</small>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <div class="img-upload">
                                <div id="image-preview" class="img-preview" style="background: url({{ asset('assets/images/noimage.png') }});">
                                    <label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i>{{ __('Upload Image') }}</label>
                                    <input type="file" name="best_seller_banner" class="img-upload" id="image-upload">
                                  </div>

                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Link') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="best_seller_banner_link" placeholder="{{ __('Link') }}" required="" value="">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading"> {{ __('Bottom Banner Image') }} *</h4>
                                <small>{{ __('(Preferred SIze: 285 X 410 Pixel)') }}</small>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <div class="img-upload">
                                <div id="image-preview" class="img-preview" style="background: url({{asset('assets/images/noimage.png') }});">
                                    <label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i>{{ __('Upload Image') }}</label>
                                    <input type="file" name="best_seller_banner1" class="img-upload" id="image-upload">
                                  </div>

                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">{{ __('Link') }} *</h4>
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="best_seller_banner_link1" placeholder="{{ __('Link') }}" required="" value="">
                          </div>
                        </div>



                        @endif

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


@section('scripts')
    <script>

      $(document).on('change','#language_select',function(){
        let url = $('#banner_url').attr('href');
        let language = $(this).val();
        location.href = `${url}?language=${language}`;
      })
      
    </script>
@endsection