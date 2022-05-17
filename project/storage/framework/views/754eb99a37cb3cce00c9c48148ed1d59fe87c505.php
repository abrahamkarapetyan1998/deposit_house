

<?php $__env->startSection('content'); ?>

	<?php if($ps->slider == 1): ?>

		<?php if(count($sliders)): ?>
			<?php echo $__env->make('includes.slider-style', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		<?php endif; ?>
	<?php endif; ?>
	
	<?php if($ps->slider == 1): ?>
		<!-- Hero Area Start -->
		<section class="hero-area">
			<?php if($ps->slider == 1): ?>

				<?php if(count($sliders)): ?>
					<div class="hero-area-slider">
						<div class="slide-progress"></div>
						<div class="intro-carousel">
							<?php $__currentLoopData = $sliders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
								<div class="intro-content <?php echo e($data->position); ?>" style="background-image: url(<?php echo e(asset('assets/images/sliders/'.$data->photo)); ?>)">
									<div class="container">
										<div class="row">
											<div class="col-lg-12">
												<div class="slider-content">
													<!-- layer 1 -->
													<div class="layer-1">
														<h4 style="font-size: <?php echo e($data->subtitle_size); ?>px; color: <?php echo e($data->subtitle_color); ?>" class="subtitle subtitle<?php echo e($data->id); ?>" data-animation="animated <?php echo e($data->subtitle_anime); ?>"><?php echo e($data->subtitle_text); ?></h4>
														<h2 style="font-size: <?php echo e($data->title_size); ?>px; color: <?php echo e($data->title_color); ?>" class="title title<?php echo e($data->id); ?>" data-animation="animated <?php echo e($data->title_anime); ?>"><?php echo e($data->title_text); ?></h2>
													</div>
													<!-- layer 2 -->
													<div class="layer-2">
														<p style="font-size: <?php echo e($data->details_size); ?>px; color: <?php echo e($data->details_color); ?>"  class="text text<?php echo e($data->id); ?>" data-animation="animated <?php echo e($data->details_anime); ?>"><?php echo e($data->details_text); ?></p>
													</div>
													<!-- layer 3 -->
													<div class="layer-3">
														<a href="<?php echo e($data->link); ?>" target="_blank" class="mybtn1"><span><?php echo e($langg->lang25); ?> <i class="fas fa-chevron-right"></i></span></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
						</div>
					</div>
				<?php endif; ?>

			<?php endif; ?>

		</section>
		<!-- Hero Area End -->
	<?php endif; ?>


	<?php if($ps->featured_category == 1): ?>

	
	<section class="slider-buttom-category d-none d-md-block">
		<div class="container-fluid">
			<div class="row">
				<?php $__currentLoopData = $categories->where('is_featured','=',1); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<div class="col-xl-2 col-lg-3 col-md-4 sc-common-padding">
						<a href="<?php echo e(route('front.category',$cat->slug)); ?>" class="single-category">
							<div class="left">
								<h5 class="title">
									<?php echo e($cat->name()); ?>
								</h5>
								<p class="count">
									<?php echo e(count($cat->products)); ?> <?php echo e($langg->lang4); ?>
								</p>
							</div>
							<div class="right">
								<img src="<?php echo e(asset('assets/images/categories/'.$cat->image)); ?>" alt="">
							</div>
						</a>
					</div>
				<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</div>
		</div>
	</section>
	

	<?php endif; ?>



	<section id="extraData">
		<div class="text-center">
			<img src="<?php echo e(asset('assets/images/'.$gs->loader)); ?>">
		</div>
	</section>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
	<script>
        $(window).on('load',function() {

            setTimeout(function(){

                $('#extraData').load('<?php echo e(route('front.extraIndex')); ?>');

            }, 500);
        });

	</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/front/index.blade.php ENDPATH**/ ?>