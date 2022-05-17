@extends('layouts.admin') 

@section('content')  

					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading">{{ __('Popular Products') }}</h4>
										<ul class="links">
											<li>
												<a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
											</li>
											<li>
												<a href="javascript:;">{{ __('SEO Tools') }} </a>
											</li>
											<li>
												<a href="javascript:;">{{ __('Popular Products') }}</a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
							   <div class="col-lg-12">
								  <div class="mr-table allproduct">
									 @include('includes.form-error')
									 @include('includes.form-success')
									 <div class="table-responsiv">
										<table id="example" class="table table-hover dt-responsive" cellspacing="0" width="100%">
										   <thead>
											  <tr>
												 <th>{{ __('Name') }}</th>
												 <th>{{ __('Category') }}</th>
												 <th>{{ __('Type') }}</th>
												 <th>{{ __('Clicks') }}</th>
												 <th>{{ __('Sales') }}</th>
											  </tr>
										   </thead>
										   <tbody>
											  @foreach($productss as $prod) 
											  
											  <tr>
												 <td>
												{{$prod->product->id}}	{{mb_strlen($prod->product->name,'utf-8') > 60 ? mb_substr($prod->product->name,0,60,'utf-8').'...' : $prod->product->name}}
												 </td>
												 <td>
													{{$prod->product->category->name}}
												 </td>
												 <td>
													{{$prod->product->type}}
												 </td>
												 <td>{{$prod->click_count}}</td>
												 <td>{{$prod->sale_count}}</td>
											  </tr>
											  @endforeach
										   </tbody>
										</table>
									 </div>
								  </div>
							   </div>
							</div>
						 </div>
					</div>

@endsection    



@section('scripts')

<script type="text/javascript">

 			$('#example').DataTable({
			   ordering: false
            });

			$( document ).ready(function() {
        $(".btn-area").append(`<div class="col-sm-4 text-right">
        <select class="form-control" id="prevdate">'+
          <option value="click_high_to_low" {{request()->input('sort') == 'click_high_to_low'  ? 'selected' : ''}} >{{__('Click High To Low')}}</option>
          <option value="click_low_to_high" {{request()->input('sort') == 'click_low_to_high'  ? 'selected' : ''}}>{{__('Click Low To High')}} </option>
          <option value="sale_high_to_low" {{request()->input('sort') == 'sale_high_to_low' ? 'selected' : ''}}>{{__('Sale High To Low')}}</option>
          <option value="sale_low_to_high" {{request()->input('sort') == 'sale_low_to_high' ? 'selected' : ''}}>{{__('Sale Low To High')}}</option>
        </select>
          </div>`); 

        $("#prevdate").change(function () {
        var sort = $("#prevdate").val();
        window.location = "{{url('/admin/products/popular/')}}/?sort="+sort;
    });                                                                      
});

</script>

@endsection   