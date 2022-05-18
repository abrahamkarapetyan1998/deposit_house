<?php $__env->startSection('styles'); ?>



<style type="text/css">



.input-field {

    padding: 15px 20px;

}



</style>



<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>



<input type="hidden" id="headerdata" value="<?php echo e(__('ORDER')); ?>">



                    <div class="content-area">

                        <div class="mr-breadcrumb">

                            <div class="row">

                                <div class="col-lg-12">

                                        <h4 class="heading"><?php echo e(__('All Orders')); ?></h4>

                                        <ul class="links">

                                            <li>

                                                <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>

                                            </li>

                                            <li>

                                                <a href="javascript:;"><?php echo e(__('Orders')); ?></a>

                                            </li>

                                            <li>

                                                <a href="<?php echo e(route('admin-order-index','all')); ?>"><?php echo e(__('All Orders')); ?></a>

                                            </li>

                                        </ul>

                                </div>

                            </div>

                        </div>

                        <div class="product-area">

                            <div class="row">

                                <div class="col-lg-12">

                                    <div class="mr-table allproduct">

                                        <?php echo $__env->make('includes.admin.form-success', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                                        <div class="table-responsiv">

                                        <div class="gocover " style="background: url(<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>

                                                <table id="geniustablee" class="table table-hover dt-responsive" cellspacing="0" width="100%">

                                                    <thead>

                                                        <tr>

                                                             <th class="d-none"><?php echo e(__('#')); ?></th>

                                                            <th><?php echo e(__('Customer Email')); ?></th>

                                                            <th><?php echo e(__('Vendor Email')); ?></th>

                                                            <th><?php echo e(__('Product Title')); ?></th>

                                                            <th><?php echo e(__('Order Status')); ?></th>

                                                            <th><?php echo e(__('Order Number')); ?></th>

                                                            <th><?php echo e(__('Date Of Completed')); ?></th>

                                                            <th><?php echo e(__('Total Qty')); ?></th>

                                                            <th><?php echo e(__('Vendor Order Status')); ?></th>

                                                            <th><?php echo e(__('Total Cost')); ?></th>

                                                            <th><?php echo e(__('Admin Order Status')); ?></th>

                                                            <th><?php echo e(__('Order Date')); ?></th>

                                                            <th><?php echo e(__('Options')); ?></th>

                                                        </tr>

                                                    </thead>

                                                    <tbody>




                                                        <?php $__currentLoopData = $datas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                 

                                                            <?php $__currentLoopData = json_decode($order->cart,true)['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>





                                                            <tr>

                                                                <td class="d-none"><?php echo e($order->id); ?></td>

                                                                <td><?php echo e($order->customer_email); ?></td>

                                                                <td><?php echo e(isset($order->vendororders->where('user_id',$item['item']['user_id'])->first()->user->email) ? $order->vendororders->where('user_id',$item['item']['user_id'])->first()->user->email : '--'); ?></td>

                                                                <td><strong>ID: <?php echo e($item['item']['id']); ?></strong> : <?php echo e(mb_strlen($item['item']['name'],'UTF-8') > 50 ? mb_substr($item['item']['name'],0,50,'UTF-8').'...' : $item['item']['name']); ?></td>

                                                                <td class="order-status <?php echo e($order->status); ?>"><?php echo e(ucwords($order->status)); ?></td>

                                                                <td><?php echo e($order->order_number); ?></td>

                                                                <td><?php echo e($order->status == 'completed' ? $order->updated_at->format('d-M-Y') : '--'); ?></td>

                                                                <td><?php echo e($item['qty']); ?></td>

                                                                <?php if($order->vendororders->count() > 0): ?>

                                                                <td class="order-status <?php echo e($order->vendororders->where('user_id',$item['item']['user_id'])->first()->status); ?>"><?php echo e($order->vendororders->where('user_id',$item['item']['user_id'])->first()->status); ?></td>

                                                                <?php else: ?>

                                                                <td class="order-status">N/A</td>

                                                                <?php endif; ?>

                                                                <td><?php echo e($order->currency_sign . round($order->pay_amount * $order->currency_value , 2)); ?></td>

                                                                <td class="order-status <?php echo e($order->status); ?>"><?php echo e($order->status); ?></td>

                                                                <?php

                                                                    $return = '<a href="javascript:;" data-href="'. route('admin-order-edit',$order->id) .'" class="delivery" data-toggle="modal" data-target="#modal1"><i class="fas fa-dollar-sign"></i> Delivery Status</a>';

                                                                    $return_data = '<div class="godropdown"><button class="go-dropdown-toggle"> Actions<i class="fas fa-chevron-down"></i></button><div class="action-list"><a href="' . route('admin-order-show',$order->id) . '" > <i class="fas fa-eye"></i> Details</a><a href="javascript:;" class="send" data-email="'. $order->customer_email .'" data-toggle="modal" data-target="#vendorform"><i class="fas fa-envelope"></i> Send</a><a href="javascript:;" data-href="'. route('admin-order-track',$order->id) .'" class="track" data-toggle="modal" data-target="#modal1"><i class="fas fa-truck"></i> Track Order</a>'.$return.'</div></div>';

                                                                ?>

                                                                <td><?php echo e($order->created_at->format('d-M-Y')); ?></td>

                                                                <td>

                                                                    <?php

                                                                        echo $return_data;

                                                                    ?>

                                                                </td>

                                                            </tr>

                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                    </tbody>

                                                </table>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>







<div class="modal fade" id="confirm-delete1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">

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

        <p class="text-center"><?php echo e(__("You are about to update the order's Status.")); ?></p>

        <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>

        <input type="hidden" id="t-add" value="<?php echo e(route('admin-order-track-add')); ?>">

        <input type="hidden" id="t-id" value="">

        <input type="hidden" id="t-title" value="">

        <textarea class="input-field" placeholder="Enter Your Tracking Note (Optional)" id="t-txt"></textarea>

      </div>



      <!-- Modal footer -->

      <div class="modal-footer justify-content-center">

            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>

            <a class="btn btn-success btn-ok order-btn"><?php echo e(__('Proceed')); ?></a>

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











                <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">



                    <div class="modal-dialog modal-dialog-centered" role="document">

                        <div class="modal-content">

                                                <div class="submit-loader">

                                                        <img  src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>" alt="">

                                                </div>

                                            <div class="modal-header">

                                            <h5 class="modal-title"></h5>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                                <span aria-hidden="true">&times;</span>

                                            </button>

                                            </div>

                                            <div class="modal-body">



                                            </div>

                                            <div class="modal-footer">

                                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>

                                            </div>

                        </div>

                    </div>



                </div>







<?php $__env->stopSection(); ?>



<?php $__env->startSection('scripts'); ?>

<script>

    var table = $('#geniustablee').DataTable({



 "order": [[ 0, "desc" ]]



    });



</script>





<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/admin/order/index.blade.php ENDPATH**/ ?>