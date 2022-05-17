@extends('layouts.admin')
@section('content')

						<div class="content-area">
							<div class="add-product-content1">
								<div class="row">
									<div class="col-lg-12">
										<div class="product-description">
											<div class="body-area">

				                        <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
											<form id="geniusform" action="{{ route('admin.profile.update') }}" method="POST" enctype="multipart/form-data">
												{{csrf_field()}}

                                                @include('includes.admin.form-both')  

						                        <div class="row">
						                          <div class="col-lg-4">
						                            <div class="left-area">
						                               
						                            </div>
						                          </div>
						                          <div class="col-lg-7">
						                            <div class="img-upload">
						                                <div id="image-preview" class="img-preview" style="background: url({{ $data->photo ? asset('assets/images/admins/'.$data->photo):asset('assets/images/noimage.png') }});">
						                                  </div>
						                            </div>
						                          </div>
						                        </div>


												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading">{{ __('Name') }} *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														{{$data->name}}
													</div>
												</div>


												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading">{{ __('Email') }} *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														{{$data->email}}
													</div>
												</div>

												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading">{{ __('Phone') }} *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														{{$data->phone}}
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