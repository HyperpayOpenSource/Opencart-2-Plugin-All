<style>
    form {
        display: block;
    }
    .wpwl-brand-card {
        display: block;
        visibility: visible;
        position: absolute;
        right: -8px;
        top: 5px;
        width: 65px;
        z-index: 10;
        float: right;
    }
    .wpwl-brand-MASTER {
        top: 0px;
    }
    .wpwl-label-brand{
      display: none !important;
    }
    .wpwl-control-brand{
      display: none !important;
    }
</style>

<script>
    function displayName(element) {
        $('.wpwl-brand-card').each(function () {
            $(element).append(this);
        });
    }
    var wpwlOptions = {
            style: "<?php echo $formStyle ?>",
            paymentTarget: "_top",
            locale: "<?php echo $language_code ?>",
            onReady: function() {
                    $('.wpwl-wrapper-cardNumber').each(function () {
                            displayName(this);
                        });
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
        .wpwl-brand-card {
            left: 8px !important;
            right: unset  !important;
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