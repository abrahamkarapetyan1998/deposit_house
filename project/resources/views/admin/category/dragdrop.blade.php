@extends('layouts.admin')

@section('content')
					<input type="hidden" id="headerdata" value="{{ __('CATEGORY') }}">
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading">{{ __('Main Categories') }}</h4>
										<ul class="links">
											<li>
												<a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
											</li>
											<li><a href="javascript:;">{{ __('Manage Categories') }}</a></li>
											<li>
												<a href="{{ route('admin-category-serial-index') }}">{{ __('Drag & Drop Categories') }}</a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-6 offset-3">
									<div class="mr-table allproduct">

                                        @include('includes.form-success')

                                        <form class="admin-form" action="{{route('admin-category-sort-submit')}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @php
                                               
                                            @endphp
                                            <div id="section-list">
                                            @foreach($categoriess as $key => $category)
                                            <div class="card py-2 mb-0 mt-2 mx-2 draggable-item">
                                                <div class="card-body">
                                                    <div class="media">
                                                        <div class="media-body">
                                                            <h5 class="mb-1 mt-0">{{ $category->name }}</h5>
                                                            <input type="hidden" name="sort[]" value="{{ $category->id }}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            @endforeach
                                            <div class="form-group mt-3">
                                                <button type="submit"  class="btn mybtn1 btn-block">{{ __('Submit') }}</button>
                                            </div>
                                            </form>
                                       
                                        </div>
									</div>
								</div>
							</div>
						</div>
			
{{-- ADD / EDIT MODAL --}}


@endsection


@section('scripts')
<script src="{{asset('assets/admin/js/sort.js')}}"></script>
<script>
        if( $('#section-list').length > 0 ){
            var el = document.getElementById('section-list');
            Sortable.create(el, {
            animation: 100,
            group: 'list-1',
            draggable: '.draggable-item',
            handle: '.draggable-item',
            sort: true,
            filter: '.sortable-disabled',
            chosenClass: 'active'
            });
        }
</script>

@endsection
