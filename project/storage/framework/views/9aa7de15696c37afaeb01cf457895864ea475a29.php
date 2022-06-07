 

<?php $__env->startSection('content'); ?>  
					<input type="hidden" id="headerdata" value="<?php echo e(__('LANGUAGE')); ?>">
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading"><?php echo e(__('Language Settings')); ?></h4>
										<ul class="links">
											<li>
												<a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
											</li>
											<li><a href="javascript:;"><?php echo e(__('Language Settings')); ?></a></li>
											<li>
												<a href="<?php echo e(route('admin-lang-index')); ?>"><?php echo e(__('Website Language')); ?> </a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-12">
								<div class="heading-area">
									<h4 class="title">
										<?php echo e(__('Language')); ?> :
									</h4>
	                                <div class="action-list">
	                                    <select class="process select droplinks <?php echo e($gs->is_language == 1 ? 'drop-success' : 'drop-danger'); ?>">
	                                      <option data-val="1" value="<?php echo e(route('admin-gs-islanguage',1)); ?>" <?php echo e($gs->is_language == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
	                                      <option data-val="0" value="<?php echo e(route('admin-gs-islanguage',0)); ?>" <?php echo e($gs->is_language == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
	                                    </select>
	                                  </div>
								</div>  
									<div class="mr-table allproduct">

                        <?php echo $__env->make('includes.admin.form-success', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 

										<div class="table-responsiv">
												<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
									                        <th><?php echo e(__('Language')); ?></th>
									                        <th><?php echo e(__('Options')); ?></th>
														</tr>
													</thead>
												</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>




<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

	<div class="modal-header d-block text-center">
		<h4 class="modal-title d-inline-block"><?php echo e(__('Confirm Delete')); ?></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	</div>

      <!-- Modal body -->
      <div class="modal-body">
            <p class="text-center"><?php echo e(__('You are about to delete this Language.')); ?></p>
            <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
            <a class="btn btn-danger btn-ok"><?php echo e(__('Delete')); ?></a>
      </div>

    </div>
  </div>
</div>




<?php $__env->stopSection(); ?>    



<?php $__env->startSection('scripts'); ?>

    <script type="text/javascript">

		var table = $('#geniustable').DataTable({
			   ordering: false,
               processing: true,
               serverSide: true,
               ajax: '<?php echo e(route('admin-lang-datatables')); ?>',
               columns: [
                        { data: 'language', name: 'language' },
            			{ data: 'action', searchable: false, orderable: false }

                     ],
               language: {
                	processing: '<img src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>">'
                }
            });

      	$(function() {
        $(".btn-area").append('<div class="col-sm-4 text-right">'+
        	'<a class="add-btn" href="<?php echo e(route('admin-lang-create')); ?>" id="add-data">'+
          '<i class="fas fa-plus"></i> <?php echo e(__('Add New Language')); ?>'+
          '</a>'+
          '</div>');
      });												
									
    </script>
<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/admin/language/index.blade.php ENDPATH**/ ?>