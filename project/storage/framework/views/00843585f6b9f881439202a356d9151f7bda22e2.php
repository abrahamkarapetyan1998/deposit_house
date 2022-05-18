<?php $__env->startSection('styles'); ?>





<?php $__env->stopSection(); ?>





<?php $__env->startSection('content'); ?>

    <div class="content-area">

                        <div class="mr-breadcrumb">

                            <div class="row">

                                <div class="col-lg-12">

                                        <h4 class="heading"><?php echo e($langg->lang549); ?> <a class="add-btn" href="<?php echo e(route('vendor-order-index')); ?>"><i class="fas fa-arrow-left"></i> <?php echo e($langg->lang550); ?></a></h4>

                                        <ul class="links">

                                            <li>

                                                <a href="<?php echo e(route('vendor-dashboard')); ?>"><?php echo e($langg->lang441); ?> </a>

                                            </li>

                                            <li>

                                                <a href="javascript:;"><?php echo e($langg->lang443); ?></a>

                                            </li>

                                            <li>

                                                <a href="javascript:;"><?php echo e($langg->lang549); ?></a>

                                            </li>

                                        </ul>

                                </div>

                            </div>

                        </div>



                        <div class="order-table-wrap">

                            <?php echo $__env->make('includes.admin.form-both', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                            <div class="row">



                                <div class="col-lg-6">

                                    <div class="special-box">

                                        <div class="heading-area">

                                            <h4 class="title">

                                            <?php echo e($langg->lang549); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                                                <tr>

                                                    <th class="45%" width="45%"><?php echo e($langg->lang551); ?></th>

                                                    <td width="10%">:</td>

                                                    <td class="45%" width="45%"><?php echo e($order->order_number); ?></td>

                                                </tr>

                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang552); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->vendororders()->where('user_id','=',$user->id)->sum('qty')); ?></td>

                                                </tr>



                                                <?php if(Auth::user()->id == $order->vendor_shipping_id): ?>

                                                <?php if($order->shipping_cost != 0): ?>

                                                <?php

                                                $price = round(($order->shipping_cost / $order->currency_value),2);

                                                ?>

                                                <?php if(DB::table('shippings')->where('price','=',$price)->count() > 0): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e(DB::table('shippings')->where('price','=',$price)->first()->title); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e(round($order->shipping_cost, 2)); ?></td>

                                                </tr>

                                                <?php endif; ?>

                                                <?php endif; ?>

                                                <?php endif; ?>



                                                <?php if(Auth::user()->id == $order->vendor_packing_id): ?>

                                                <?php if($order->packing_cost != 0): ?>

                                                <?php

                                                $pprice = round(($order->packing_cost / $order->currency_value),2);

                                                ?>

                                                <?php if(DB::table('packages')->where('price','=',$pprice)->count() > 0): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e(DB::table('packages')->where('price','=',$pprice)->first()->title); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e(round($order->packing_cost, 2)); ?></td>

                                                </tr>

                                                <?php endif; ?>

                                                <?php endif; ?>

                                                <?php endif; ?>



                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang553); ?></th>

                                                    <td width="10%">:</td>



                                                        <?php



                                                        $price = round($order->vendororders()->where('user_id','=',$user->id)->sum('price'),2);



                                                        if($user->shipping_cost != 0){

                                                            $price = $price  + round($user->shipping_cost * $order->currency_value , 2);

                                                            }



                                                        if($order->tax != 0){

                                                            $tax = ($price / 100) * $order->tax;

                                                            $price  += $tax;

                                                            }



                                                        ?>



                                                    <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e(round($price * $order->currency_value , 2)); ?></td>

                                                </tr>

                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang554); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e(date('d-M-Y H:i:s a',strtotime($order->created_at))); ?></td>

                                                </tr>





                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang795); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->method); ?></td>

                                                </tr>



                                                <?php if($order->method != "Cash On Delivery"): ?>

                                                <?php if($order->method=="Stripe"): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e($order->method); ?> <?php echo e($langg->lang796); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->charge_id); ?></td>

                                                </tr>

                                                <?php endif; ?>

                                                <tr>

                                                    <th width="45%"><?php echo e($order->method); ?> <?php echo e($langg->lang797); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->txnid); ?></td>

                                                </tr>

                                                <?php endif; ?>



                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang798); ?></th>

                                                    <th width="10%">:</th>

                                                    <td width="45%"><?php echo $order->payment_status == 'Pending' ? "<span class='badge badge-danger'>". $langg->lang799 ."</span>":"<span class='badge badge-success'>". $langg->lang800 ."</span>"; ?></td>

                                                </tr>

                                                <?php if(!empty($order->order_note)): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e($langg->lang801); ?></th>

                                                    <th width="10%">:</th>

                                                    <td width="45%"><?php echo e($order->order_note); ?></td>

                                                </tr>

                                                <?php endif; ?>



                                                </tbody>

                                            </table>

                                        </div>

                                        <div class="footer-area">

                                            <a href="<?php echo e(route('vendor-order-invoice',$order->order_number)); ?>" class="mybtn1"><i class="fas fa-eye"></i> <?php echo e($langg->lang555); ?></a>

                                        </div>

                                    </div>

                                </div>

                                <div class="col-lg-6">

                                    <div class="special-box">

                                        <div class="heading-area">

                                            <h4 class="title">

                                            <?php echo e($langg->lang556); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang557); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_name); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang558); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_email); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang559); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_phone); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang560); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_address); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang561); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_country); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang562); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_city); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e($langg->lang563); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_zip); ?></td>

                                                        </tr>

                                                </tbody>

                                            </table>

                                        </div>

                                    </div>

                                </div>



                                <?php if($order->dp == 0): ?>

                                <div class="col-lg-6">

                                    <div class="special-box">

                                        <div class="heading-area">

                                            <h4 class="title">

                                            <?php echo e($langg->lang564); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                            <?php if($order->shipping == "pickup"): ?>

                        <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang565); ?>:</strong></th>

                                    <th width="10%">:</th>

                                    <td width="45%"><?php echo e($order->pickup_location); ?></td>

                                </tr>

                            <?php else: ?>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang557); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td><?php echo e($order->shipping_name == null ? $order->customer_name : $order->shipping_name); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang558); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_email == null ? $order->customer_email : $order->shipping_email); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang559); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_phone == null ? $order->customer_phone : $order->shipping_phone); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang560); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_address == null ? $order->customer_address : $order->shipping_address); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang561); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_country == null ? $order->customer_country : $order->shipping_country); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang562); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_city == null ? $order->customer_city : $order->shipping_city); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e($langg->lang563); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_zip == null ? $order->customer_zip : $order->shipping_zip); ?></td>

                                </tr>

                                <?php endif; ?>
                                <tr>

                                    <th width="45%"><strong>Shipping Method:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shippingMethod->title); ?></td>

                                </tr>

                                                </tbody>

                                            </table>

                                        </div>

                                    </div>

                                </div>

                                <?php endif; ?>

                            </div>







                            <div class="row">

                                    <div class="col-lg-12 order-details-table">

                                        <div class="mr-table">

                                            <h4 class="title"><?php echo e($langg->lang566); ?></h4>

                                            <div class="table-responsiv">

                                                    <table id="example2" class="table table-hover dt-responsive" cellspacing="0" width="100%">

                                                        <thead>

                                                            <tr>

                                <tr>

                                    <th><?php echo e($langg->lang567); ?></th>

                                    <th><?php echo e($langg->lang568); ?></th>

                                    <th><?php echo e($langg->lang569); ?></th>

                                    <th><?php echo e($langg->lang570); ?></th>

                                    <th><?php echo e($langg->lang539); ?></th>

                                    <th><?php echo e($langg->lang574); ?></th>

                                </tr>

                                                            </tr>

                                                        </thead>

                                                        <tbody>

                                <?php $__currentLoopData = $cart['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>



                                <?php if($product['item']['user_id'] != 0): ?>

                                    <?php if($product['item']['user_id'] == $user->id): ?>

                                    <tr>



                                            <td><input type="hidden" value="<?php echo e($key); ?>"><?php echo e($product['item']['id']); ?></td>



                                            <td>

                                                <?php if($product['item']['user_id'] != 0): ?>

                                                <?php

                                                $user = App\Models\User::find($product['item']['user_id']);

                                                ?>

                                                <?php if(isset($user)): ?>

                                                <a target="_blank" href="<?php echo e(route('admin-vendor-show',$user->id)); ?>"><?php echo e($user->shop_name); ?></a>

                                                <?php else: ?>

                                                <?php echo e($langg->lang575); ?>


                                                <?php endif; ?>

                                                <?php endif; ?>



                                            </td>

                                            <td>

                                                <?php if($product['item']['user_id'] != 0): ?>

                                                <?php

                                                $user = App\Models\VendorOrder::where('order_id','=',$order->id)->where('user_id','=',$product['item']['user_id'])->first();

                                                ?>



                                                    <?php if($order->dp == 1 && $order->payment_status == 'Completed'): ?>



                                                   <span class="badge badge-success"><?php echo e($langg->lang542); ?></span>



                                                    <?php else: ?>



                                                        <?php if($user->status == 'pending'): ?>

                                                        <span class="badge badge-warning"><?php echo e(ucwords($user->status)); ?></span>

                                                        <?php elseif($user->status == 'processing'): ?>

                                                        <span class="badge badge-info"><?php echo e(ucwords($user->status)); ?></span>

                                                       <?php elseif($user->status == 'on delivery'): ?>

                                                        <span class="badge badge-primary"><?php echo e(ucwords($user->status)); ?></span>

                                                       <?php elseif($user->status == 'completed'): ?>

                                                        <span class="badge badge-success"><?php echo e(ucwords($user->status)); ?></span>

                                                       <?php elseif($user->status == 'declined'): ?>

                                                        <span class="badge badge-danger"><?php echo e(ucwords($user->status)); ?></span>

                                                       <?php endif; ?>



                                                    <?php endif; ?>



                                            <?php endif; ?>

                                            </td>







                                            <td>

                                                <input type="hidden" value="<?php echo e($product['license']); ?>">



                                                <?php if($product['item']['user_id'] != 0): ?>

                                                <?php

                                                $user = App\Models\User::find($product['item']['user_id']);

                                                ?>

                                                <?php if(isset($user)): ?>

                                              <a target="_blank" href="<?php echo e(route('front.product', $product['item']['slug'])); ?>"><?php echo e(mb_strlen($product['item']['name'],'utf-8') > 30 ? mb_substr($product['item']['name'],0,30,'utf-8').'...' : $product['item']['name']); ?></a>

                                                <?php else: ?>

                                                <a href="javascript:;"><?php echo e(mb_strlen($product['item']['name'],'utf-8') > 30 ? mb_substr($product['item']['name'],0,30,'utf-8').'...' : $product['item']['name']); ?></a>

                                                <?php endif; ?>

                                                <?php endif; ?>





                                                <?php if($product['license'] != ''): ?>

                              <a href="javascript:;" data-toggle="modal" data-target="#confirm-delete" class="btn btn-info product-btn" id="license" style="padding: 5px 12px;"><i class="fa fa-eye"></i> View License</a>

                                                <?php endif; ?>



                                            </td>

                                            <td>

                                                <?php if($product['size']): ?>

                                               <p>

                                                    <strong><?php echo e($langg->lang312); ?> :</strong> <?php echo e(str_replace('-',' ',$product['size'])); ?>


                                               </p>

                                               <?php endif; ?>

                                               <?php if($product['color']): ?>

                                                <p>

                                                        <strong><?php echo e($langg->lang313); ?> :</strong> <span

                                                        style="width: 40px; height: 20px; display: block; background: #<?php echo e($product['color']); ?>;"></span>

                                                </p>

                                                <?php endif; ?>

                                                <p>

                                                        <strong><?php echo e($langg->lang754); ?> :</strong> <?php echo e($order->currency_sign); ?><?php echo e(round($product['item_price'] * $order->currency_value , 2)); ?>


                                                </p>

                                               <p>

                                                    <strong><?php echo e($langg->lang311); ?> :</strong> <?php echo e($product['qty']); ?> <?php echo e($product['item']['measure']); ?>


                                               </p>

                                                    <?php if(!empty($product['keys'])): ?>



                                                    <?php $__currentLoopData = array_combine(explode(',', $product['keys']), explode(',', $product['values'])); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                                    <p>



                                                        <b><?php echo e(ucwords(str_replace('_', ' ', $key))); ?> : </b> <?php echo e($value); ?>




                                                    </p>

                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>



                                                    <?php endif; ?>



                                            </td>



                                            <td><?php echo e($order->currency_sign); ?><?php echo e(round($product['price'] * $order->currency_value , 2)); ?></td>



                                    </tr>



                    <?php endif; ?>



                <?php endif; ?>

                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                        </tbody>

                                                    </table>

                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-lg-12 text-center mt-2">

                                        <a class="btn sendEmail send" href="javascript:;" class="send" data-email="<?php echo e($order->customer_email); ?>" data-toggle="modal" data-target="#vendorform">

                                                <i class="fa fa-send"></i> <?php echo e($langg->lang576); ?>


                                        </a>

                                    </div>

                                </div>

                        </div>

                    </div>

                    <!-- Main Content Area End -->

                </div>

            </div>





    </div>







<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">

  <div class="modal-dialog">

    <div class="modal-content">



    <div class="modal-header d-block text-center">

        <h4 class="modal-title d-inline-block"><?php echo e($langg->lang577); ?></h4>

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                <span aria-hidden="true">&times;</span>

            </button>

    </div>



                <div class="modal-body">

                    <p class="text-center"><?php echo e($langg->lang578); ?> :  <span id="key"></span> <a href="javascript:;" id="license-edit"><?php echo e($langg->lang577); ?></a><a href="javascript:;" id="license-cancel" class="showbox"><?php echo e($langg->lang584); ?></a></p>

                    <form method="POST" action="<?php echo e(route('vendor-order-license',$order->order_number)); ?>" id="edit-license" style="display: none;">

                        <?php echo e(csrf_field()); ?>


                        <input type="hidden" name="license_key" id="license-key" value="">

                        <div class="form-group text-center">

                    <input type="text" name="<?php echo e($langg->lang585); ?>" placeholder="<?php echo e($langg->lang579); ?>" style="width: 40%; border: none;" required=""><input type="submit" name="submit" value="Save License" class="btn btn-primary" style="border-radius: 0; padding: 2px; margin-bottom: 2px;">

                        </div>

                    </form>

                </div>

                <div class="modal-footer justify-content-center">

                    <button type="button" class="btn btn-danger" data-dismiss="modal"><?php echo e($langg->lang580); ?></button>

                </div>

            </div>

        </div>

    </div>











<div class="sub-categori">

    <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="vendorformLabel"><?php echo e($langg->lang576); ?></h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                            <span aria-hidden="true">&times;</span>

                        </button>

                </div>

            <div class="modal-body">

                <div class="container-fluid p-0">

                    <div class="row">

                        <div class="col-md-12">

                            <div class="contact-form">

                                <form id="emailreply">

                                    <?php echo e(csrf_field()); ?>


                                    <ul>

                                        <li>

                                            <input type="email" class="input-field eml-val" id="eml" name="to" placeholder="<?php echo e($langg->lang583); ?> *" value="" required="">

                                        </li>

                                        <li>

                                            <input type="text" class="input-field" id="subj" name="subject" placeholder="<?php echo e($langg->lang581); ?> *" required="">

                                        </li>

                                        <li>

                                            <textarea class="input-field textarea" name="message" id="msg" placeholder="<?php echo e($langg->lang582); ?> *" required=""></textarea>

                                        </li>

                                    </ul>

                                    <button class="submit-btn" id="emlsub" type="submit"><?php echo e($langg->lang576); ?></button>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

            </div>

        </div>

    </div>

</div>













<?php $__env->stopSection(); ?>





<?php $__env->startSection('scripts'); ?>



<script type="text/javascript">

$('#example2').dataTable( {

  "ordering": false,

      'lengthChange': false,

      'searching'   : false,

      'ordering'    : false,

      'info'        : false,

      'autoWidth'   : false,

      'responsive'  : true

} );

</script>



    <script type="text/javascript">

        $(document).on('click','#license' , function(e){

            var id = $(this).parent().find('input[type=hidden]').val();

            var key = $(this).parent().parent().find('input[type=hidden]').val();

            $('#key').html(id);

            $('#license-key').val(key);

    });

        $(document).on('click','#license-edit' , function(e){

            $(this).hide();

            $('#edit-license').show();

            $('#license-cancel').show();

        });

        $(document).on('click','#license-cancel' , function(e){

            $(this).hide();

            $('#edit-license').hide();

            $('#license-edit').show();

        });



        $(document).on('submit','#edit-license' , function(e){

            e.preventDefault();

          $('button#license-btn').prop('disabled',true);

              $.ajax({

               method:"POST",

               url:$(this).prop('action'),

               data:new FormData(this),

               dataType:'JSON',

               contentType: false,

               cache: false,

               processData: false,

               success:function(data)

               {

                  if ((data.errors)) {

                    for(var error in data.errors)

                    {

                        $.notify('<li>'+ data.errors[error] +'</li>','error');

                    }

                  }

                  else

                  {

                    $.notify(data,'success');

                    $('button#license-btn').prop('disabled',false);

                    $('#confirm-delete').modal('toggle');



                   }

               }

                });

        });

    </script>



<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.vendor', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/vendor/order/details.blade.php ENDPATH**/ ?>