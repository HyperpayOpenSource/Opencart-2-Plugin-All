<style>
    form {
        display: block;
    }
</style>

<script>
    var wpwlOptions = {
        style: "<?php echo $formStyle ?>",
        paymentTarget: "_top",
        locale: "<?php echo $language_code ?>",
        onReady: function(){

            var createRegistrationHtml = '<input style="display:none" type="checkbox" name="createRegistration" value="true" checked />';
            $('form.wpwl-form-card').find('.wpwl-button').before(createRegistrationHtml);

            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-wrapper-radio-qrcode').hide();
            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-wrapper-radio-mobile').hide();
            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-group-paymentMode').hide();
            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-group-mobilePhone').show();
            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-wrapper-radio-mobile .wpwl-control-radio-mobile').attr('checked',true);
            $('.wpwl-form-virtualAccount-STC_PAY .wpwl-wrapper-radio-mobile .wpwl-control-radio-mobile').trigger('click');

        }
    }
</script>

<?php if ($language_code == 'ar') { ?>
    <style>
        wpwl-group {
            direction: ltr;
        }

        .wpwl-control-cardNumber {
            direction: ltr !important;
            text-align: right;
        }
    </style>
<?php } ?>

<script>
    $.ajaxSetup({
        // Disable caching of AJAX responses
        cache: true
    });
</script>

<script src="<?php echo $scriptURL; ?>"></script>

<div>
    <form action="<?php echo $postbackURL; ?>" class="paymentWidgets" data-brands="<?php echo $payment_brands; ?>">
    </form>
</div>
<div class="buttons" style="display:none;">
    <div class="right"><a id="button-confirm" class="button" onclick="$('#payment').submit();"><span><?php echo $button_confirm; ?></span></a></div>
</div>