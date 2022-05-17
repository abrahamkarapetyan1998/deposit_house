
<?php $__env->startSection('content'); ?>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="pages">
          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <?php echo e($langg->lang427); ?>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->

<section class="fourzerofour">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="content">
            <img src="<?php echo e($gs->error_banner ? asset('assets/images/'.$gs->error_banner):asset('assets/images/noimage.png')); ?>" alt="">
            <h4 class="heading">
              <?php echo e($langg->lang428); ?>
            </h4>
            <p class="text">
              <?php echo e($langg->lang429); ?>
            </p>
            <a class="mybtn1" href="<?php echo e(route('front.index')); ?>"><?php echo e($langg->lang430); ?></a>
          </div>
        </div>
      </div>
    </div>
</section>


<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/errors/404.blade.php ENDPATH**/ ?>