<?php $__env->startSection('styles'); ?>



<style type="text/css">

    .order-table-wrap table#example2 {

    margin: 10px 20px;

}



</style>



<?php $__env->stopSection(); ?>





<?php $__env->startSection('content'); ?>

    <div class="content-area">

                        <div class="mr-breadcrumb">

                            <div class="row">

                                <div class="col-lg-12">

                                        <h4 class="heading"><?php echo e(__('Order Details')); ?> <a class="add-btn" href="javascript:history.back();"><i class="fas fa-arrow-left"></i> <?php echo e(__('Back')); ?></a></h4>

                                        <ul class="links">

                                            <li>

                                                <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>

                                            </li>

                                            <li>

                                                <a href="javascript:;"><?php echo e(__('Orders')); ?></a>

                                            </li>

                                            <li>

                                                <a href="javascript:;"><?php echo e(__('Order Details')); ?></a>

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

                                            <?php echo e(__('Order Details')); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                                                <tr>

                                                    <th class="45%" width="45%"><?php echo e(__('Order ID')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td class="45%" width="45%"><?php echo e($order->order_number); ?></td>

                                                </tr>

                                                <tr>

                                                    <th width="45%"><?php echo e(__('Total Product')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->totalQty); ?></td>

                                                </tr>

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



                                                <tr>

                                                    <th width="45%"><?php echo e(__('Total Cost')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e(round($order->pay_amount * $order->currency_value , 2)); ?></td>

                                                </tr>

                                                <tr>

                                                    <th width="45%"><?php echo e(__('Ordered Date')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e(date('d-M-Y H:i:s a',strtotime($order->created_at))); ?></td>

                                                </tr>

                                                <tr>

                                                    <th width="45%"><?php echo e(__('Payment Method')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->method); ?></td>

                                                </tr>



                                                <?php if($order->method != "Cash On Delivery"): ?>

                                                <?php if($order->method=="Stripe"): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e($order->method); ?> <?php echo e(__('Charge ID')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->charge_id); ?></td>

                                                </tr>

                                                <?php endif; ?>

                                                <tr>

                                                    <th width="45%"><?php echo e($order->method); ?> <?php echo e(__('Transaction ID')); ?></th>

                                                    <td width="10%">:</td>

                                                    <td width="45%"><?php echo e($order->txnid); ?></td>

                                                </tr>

                                                <?php endif; ?>



                                                <tr>

                                                    <th width="45%"><?php echo e(__('Payment Status')); ?></th>

                                                    <th width="10%">:</th>

                                                    <td width="45%"><?php echo $order->payment_status == 'Pending' ? "<span class='badge badge-danger'>Unpaid</span>":"<span class='badge badge-success'>Paid</span>"; ?></td>

                                                </tr>

                                                <?php if(!empty($order->order_note)): ?>

                                                <tr>

                                                    <th width="45%"><?php echo e(__('Order Note')); ?></th>

                                                    <th width="10%">:</th>

                                                    <td width="45%"><?php echo e($order->order_note); ?></td>

                                                </tr>

                                                <?php endif; ?>



                                                </tbody>

                                            </table>

                                        </div>

                                        <div class="footer-area">

                                            <a href="<?php echo e(route('admin-order-invoice',$order->id)); ?>" class="mybtn1"><i class="fas fa-eye"></i> <?php echo e(__('View Invoice')); ?></a>

                                        </div>

                                    </div>

                                </div>

                                <div class="col-lg-6">

                                    <div class="special-box">

                                        <div class="heading-area">

                                            <h4 class="title">

                                            <?php echo e(__('Billing Details')); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Name')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_name); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Email')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_email); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Phone')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_phone); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Address')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_address); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Country')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_country); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('City')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_city); ?></td>

                                                        </tr>

                                                        <tr>

                                                            <th width="45%"><?php echo e(__('Postal Code')); ?></th>

                                                            <th width="10%">:</th>

                                                            <td width="45%"><?php echo e($order->customer_zip); ?></td>

                                                        </tr>

                            <?php if($order->coupon_code != null): ?>

                            <tr>

                                <th width="45%"><?php echo e(__('Coupon Code')); ?></th>

                                <th width="10%">:</th>

                                <td width="45%"><?php echo e($order->coupon_code); ?></td>

                            </tr>

                            <?php endif; ?>

                            <?php if($order->coupon_discount != null): ?>

                            <tr>

                                <th width="45%"><?php echo e(__('Coupon Discount')); ?></th>

                                <th width="10%">:</th>

                                <?php if($gs->currency_format == 0): ?>

                                <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e($order->coupon_discount); ?></td>

                                <?php else: ?>

                                <td width="45%"><?php echo e($order->coupon_discount); ?><?php echo e($order->currency_sign); ?></td>

                                <?php endif; ?>

                            </tr>

                            <?php endif; ?>

                            <?php if($order->affilate_user != null): ?>

                            <tr>

                                <th width="45%"><?php echo e(__('Affilate User')); ?></th>

                                <th width="10%">:</th>

                                <td width="45%"><?php echo e(\DB::table('users')->where('id',$order->affilate_user)->exists() ? DB::table('users')->find($order->affilate_user)->name : ''); ?></td>

                            </tr>

                            <?php endif; ?>

                            <?php if($order->affilate_charge != null): ?>

                            <tr>

                                <th width="45%"><?php echo e(__('Affilate Charge')); ?></th>

                                <th width="10%">:</th>

                                <?php if($gs->currency_format == 0): ?>

                                <td width="45%"><?php echo e($order->currency_sign); ?><?php echo e($order->affilate_charge); ?></td>

                                <?php else: ?>

                                <td width="45%"><?php echo e($order->affilate_charge); ?><?php echo e($order->currency_sign); ?></td>

                                <?php endif; ?>

                            </tr>

                            <?php endif; ?>

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

                                            <?php echo e(__('Shipping Details')); ?>


                                            </h4>

                                        </div>

                                        <div class="table-responsive-sm">

                                            <table class="table">

                                                <tbody>

                            <?php if($order->shipping == "pickup"): ?>

                        <tr>

                                    <th width="45%"><strong><?php echo e(__('Pickup Location')); ?>:</strong></th>

                                    <th width="10%">:</th>

                                    <td width="45%"><?php echo e($order->pickup_location); ?></td>

                                </tr>

                            <?php else: ?>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Name')); ?>:</strong></th>

                                    <th width="10%">:</th>

                                     <td><?php echo e($order->shipping_name == null ? $order->customer_name : $order->shipping_name); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Email')); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_email == null ? $order->customer_email : $order->shipping_email); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Phone')); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_phone == null ? $order->customer_phone : $order->shipping_phone); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Address')); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_address == null ? $order->customer_address : $order->shipping_address); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Country')); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_country == null ? $order->customer_country : $order->shipping_country); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('City')); ?>:</strong></th>

                                    <th width="10%">:</th>

                <td width="45%"><?php echo e($order->shipping_city == null ? $order->customer_city : $order->shipping_city); ?></td>

                                </tr>

                                <tr>

                                    <th width="45%"><strong><?php echo e(__('Postal Code')); ?>:</strong></th>

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

                                            <h4 class="title"><?php echo e(__('Products Ordered')); ?></h4>

                                            <div class="table-responsiv">

                                                    <table id="example2" class="table table-hover dt-responsive" cellspacing="0" width="100%">

                                                        <thead>

                                                            <tr>

                                <tr>

                                    <th width="10%"><?php echo e(__('Product ID#')); ?></th>

                                    <th><?php echo e(__('Shop Name')); ?></th>

                                    <th><?php echo e(__('Vendor Status')); ?></th>

                                    <th><?php echo e(__('Product Title')); ?></th>

                                    <th width="20%"><?php echo e(__('Details')); ?></th>

                                    <th width="10%"><?php echo e(__('Total Price')); ?></th>

                                </tr>

                                                            </tr>

                                                        </thead>

                                                        <tbody>

                                <?php $__currentLoopData = $cart['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

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

                                                <?php echo e(__('Vendor Removed')); ?>


                                                <?php endif; ?>

                                                <?php else: ?>

                                                <a  href="javascript:;"><?php echo e(App\Models\Admin::find(1)->shop_name); ?></a>

                                                <?php endif; ?>



                                            </td>

                                            <td>

                                                <?php if($product['item']['user_id'] != 0): ?>

                                                <?php

                                                $user = App\Models\VendorOrder::where('order_id','=',$order->id)->where('user_id','=',$product['item']['user_id'])->first();

                                                ?>



                                                    <?php if($order->dp == 1 && $order->payment_status == 'Completed'): ?>



                                                    <span class="badge badge-success"><?php echo e(__('Completed')); ?></span>



                                                    <?php else: ?>

                                                        <?php if($order->status == 'pending'): ?>

                                                        <span class="badge badge-warning"><?php echo e(ucwords($order->status)); ?></span>

                                                        <?php elseif($order->status == 'processing'): ?>

                                                        <span class="badge badge-info"><?php echo e(ucwords($order->status)); ?></span>

                                                       <?php elseif($order->status == 'on delivery'): ?>

                                                        <span class="badge badge-primary"><?php echo e(ucwords($order->status)); ?></span>

                                                       <?php elseif($order->status == 'completed'): ?>

                                                        <span class="badge badge-success"><?php echo e(ucwords($order->status)); ?></span>

                                                       <?php elseif($order->status == 'declined'): ?>

                                                        <span class="badge badge-danger"><?php echo e(ucwords($order->status)); ?></span>

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

                                                <a target="_blank" href="<?php echo e(route('front.product', $product['item']['slug'])); ?>"><?php echo e(mb_strlen($product['item']['name'],'utf-8') > 30 ? mb_substr($product['item']['name'],0,30,'utf-8').'...' : $product['item']['name']); ?></a>

                                                <?php endif; ?>

                                                <?php else: ?>



                                                <a target="_blank" href="<?php echo e(route('front.product', $product['item']['slug'])); ?>"><?php echo e(mb_strlen($product['item']['name'],'utf-8') > 30 ? mb_substr($product['item']['name'],0,30,'utf-8').'...' : $product['item']['name']); ?></a>



                                                <?php endif; ?>





                                                <?php if($product['license'] != ''): ?>

                              <a href="javascript:;" data-toggle="modal" data-target="#confirm-delete" class="btn btn-info product-btn" id="license" style="padding: 5px 12px;"><i class="fa fa-eye"></i> <?php echo e(__('View License')); ?></a>

                                                <?php endif; ?>



                                            </td>

                                            <td>

                                                <?php if($product['size']): ?>

                                               <p>

                                                    <strong><?php echo e(__('Size')); ?> :</strong> <?php echo e(str_replace('-',' ',$product['size'])); ?>


                                               </p>

                                               <?php endif; ?>

                                               <?php if($product['color']): ?>

                                                <p>

                                                        <strong><?php echo e(__('color')); ?> :</strong> <span

                                                        style="width: 20px; height: 20px; display: inline-block; vertical-align: middle;  background: #<?php echo e($product['color']); ?>;"></span>

                                                </p>

                                                <?php endif; ?>

                                                <p>

                                                        <strong><?php echo e(__('Price')); ?> :</strong> <?php echo e($order->currency_sign); ?><?php echo e(round($product['item_price'] * $order->currency_value , 2)); ?>


                                                </p>

                                               <p>

                                                    <strong><?php echo e(__('Qty')); ?> :</strong> <?php echo e($product['qty']); ?> <?php echo e($product['item']['measure']); ?>


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

                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                        </tbody>

                                                    </table>

                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-lg-12 text-center mt-2">

                                        <a class="btn sendEmail send" href="javascript:;" class="send" data-email="<?php echo e($order->customer_email); ?>" data-toggle="modal" data-target="#vendorform">

                                                <i class="fa fa-send"></i> <?php echo e(__('Send Email')); ?>


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

        <h4 class="modal-title d-inline-block"><?php echo e(__('License Key')); ?></h4>

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                <span aria-hidden="true">&times;</span>

            </button>

    </div>



                <div class="modal-body">

                    <p class="text-center"><?php echo e(__('The Licenes Key is')); ?> :  <span id="key"></span> <a href="javascript:;" id="license-edit"><?php echo e(__('Edit License')); ?></a><a href="javascript:;" id="license-cancel" class="showbox"><?php echo e(__('Cancel')); ?></a></p>

                    <form method="POST" action="<?php echo e(route('admin-order-license',$order->id)); ?>" id="edit-license" style="display: none;">

                        <?php echo e(csrf_field()); ?>


                        <input type="hidden" name="license_key" id="license-key" value="">

                        <div class="form-group text-center">

                    <input type="text" name="license" placeholder="<?php echo e(__('Enter New License Key')); ?>" style="width: 40%; border: none;" required=""><input type="submit" name="submit" class="btn btn-primary" style="border-radius: 0; padding: 2px; margin-bottom: 2px;">

                        </div>

                    </form>

                </div>

                <div class="modal-footer justify-content-center">

                    <button type="button" class="btn btn-danger" data-dismiss="modal"><?php echo e(__('Close')); ?></button>

                </div>

            </div>

        </div>

    </div>











<div class="sub-categori">

    <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="vendorformLabel"><?php echo e(__('Send Email')); ?></h5>

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

                                            <input type="email" class="input-field eml-val" id="eml" name="to" placeholder="<?php echo e(__('Email')); ?> *" value="" required="">

                                        </li>

                                        <li>

                                            <input type="text" class="input-field" id="subj" name="subject" placeholder="<?php echo e(__('Subject')); ?> *" required="">

                                        </li>

                                        <li>

                                            <textarea class="input-field textarea" name="message" id="msg" placeholder="<?php echo e(__('Your Message')); ?> *" required=""></textarea>

                                        </li>

                                    </ul>

                                    <button class="submit-btn" id="emlsub" type="submit"><?php echo e(__('Send Email')); ?></button>

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











<div class="modal fade" id="confirm-delete2" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">

  <div class="modal-dialog">

    <div class="modal-content">

        <div class="submit-loader">

            <img  src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>" alt="">

        </div>

    <div class="modal-header d-block text-center">

        <h4 class="modal-title d-inline-block"><?php echo e(__('Update Status')); ?></h4>

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                <span aria-hidden="true">&times;</span>

            </button>

    </div>



      <!-- Modal body -->

      <div class="modal-body">

        <p class="text-center"><?php echo e(__("You are about to update the order's status.")); ?></p>

        <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>

      </div>



      <!-- Modal footer -->

      <div class="modal-footer justify-content-center">

            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>

            <a class="btn btn-success btn-ok order-btn"><?php echo e(__('Proceed')); ?></a>

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

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/admin/order/details.blade.php ENDPATH**/ ?>