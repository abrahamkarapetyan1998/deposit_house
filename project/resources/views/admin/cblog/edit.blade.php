@extends('layouts.load')
@section('content')

						<div class="content-area">
							<div class="add-product-content1">
								<div class="row">
									<div class="col-lg-12">
										<div class="product-description">
											<div class="body-area">
											@include('includes.admin.form-error') 
											<form id="geniusformdata" action="{{route('admin-cblog-update',$data->id)}}" method="POST" enctype="multipart/form-data">
												{{csrf_field()}}
												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading">{{ __('Name') }} *</h4>
																<p class="sub-heading">{{ __('(In Any Language)') }}</p>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="text" class="input-field" name="name" placeholder="{{ __('Name') }}" required="" value="{{$data->name}}">
													</div>
												</div>

											@php
												$cat_lan = json_decode($data->language,true);
											@endphp
											@foreach (DB::table('languages')->whereNotIn('id',[1])->get() as $key => $language)
											<div class="row">
											  <div class="col-lg-4">
												<div class="left-area">
													<h4 class="heading">{{ $language->language }} {{ __('Name') }} *</h4>
												</div>
											  </div>
											  <div class="col-lg-7">
												<input type="text" class="input-field" name="language[{{$language->id}}]" placeholder="{{ __('Enter')  }} {{$language->language}} Name" required="" value="{{isset($cat_lan[$language->id]) ? $cat_lan[$language->id] : ''}}">
											  </div>
											</div>
											@endforeach

												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading">{{ __('Slug') }} *</h4>
																<p class="sub-heading">{{ __('In Any English') }}</p>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="text" class="input-field" name="slug" placeholder="{{ __('Slug') }}" required="" value="{{$data->slug}}">
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