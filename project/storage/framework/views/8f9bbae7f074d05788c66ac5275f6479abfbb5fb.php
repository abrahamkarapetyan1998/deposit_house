


<?php if($payment == 'cod'): ?> 
    <input type="hidden" name="method" value="Cash On Delivery">
<?php endif; ?>


<?php if($payment == 'stripe'): ?> 
                                <input type="hidden" name="method" value="Stripe">
                                 <div class="row" >
                                    <div class="col-lg-6">
                                      <input class="form-control card-elements" name="cardNumber" type="text" placeholder="<?php echo e($langg->lang163); ?>" autocomplete="off"  autofocus oninput="validateCard(this.value);" />
                                      <span id="errCard"></span>
                                    </div>
                                    <div class="col-lg-6">
                                      <input class="form-control card-elements" name="cardCVC" type="text" placeholder="<?php echo e($langg->lang164); ?>" autocomplete="off"  oninput="validateCVC(this.value);" />
                                      <span id="errCVC"></span>
                                    </div>
                                    <div class="col-lg-6">
                                      <input class="form-control card-elements" name="month" type="text" placeholder="<?php echo e($langg->lang165); ?>"  />
                                    </div>
                                    <div class="col-lg-6">
                                      <input class="form-control card-elements" name="year" type="text" placeholder="<?php echo e($langg->lang166); ?>"  />
                                    </div>
                                </div>


                                <script type="text/javascript" src="<?php echo e(asset('assets/front/js/payvalid.js')); ?>"></script>
                                <script type="text/javascript" src="<?php echo e(asset('assets/front/js/paymin.js')); ?>"></script>
                                <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
                                <script type="text/javascript" src="<?php echo e(asset('assets/front/js/payform.js')); ?>"></script>


                                <script type="text/javascript">
                                  var cnstatus = false;
                                  var dateStatus = false;
                                  var cvcStatus = false;
                              
                                  function validateCard(cn) {
                                    cnstatus = Stripe.card.validateCardNumber(cn);
                                    if (!cnstatus) {
                                      $("#errCard").html('<?php echo e($langg->lang781); ?>');
                                    } else {
                                      $("#errCard").html('');
                                    }

                              
                              
                                  }
                              
                                  function validateCVC(cvc) {
                                    cvcStatus = Stripe.card.validateCVC(cvc);
                                    if (!cvcStatus) {
                                      $("#errCVC").html('<?php echo e($langg->lang782); ?>');
                                    } else {
                                      $("#errCVC").html('');
                                    }
            
                                  }
                              
                                </script>


<?php endif; ?>




<?php if($payment == 'other'): ?> 

                                <input type="hidden" name="method" value="<?php echo e($gateway->title); ?>">

                                  <div class="row" >

<div class="col-lg-12 pb-2">
	
	<?php echo $gateway->details; ?>

</div>


<div class="col-lg-6">
	<label><?php echo e($langg->lang167); ?> *</label>
	<input class="form-control" name="txn_id4" type="text" placeholder="<?php echo e($langg->lang167); ?>"  />
</div>


  </div>
<?php endif; ?>

<?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/load/payment.blade.php ENDPATH**/ ?>