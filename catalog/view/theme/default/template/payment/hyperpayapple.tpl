<style>
    form {
        display: block;
    }
</style>

<script>
    var wpwlOptions = {
        style: "<?php echo $formStyle ?>",
        paymentTarget: "_top",
        locale: "<?php echo $language_code ?>"
    };
    wpwlOptions.applePay = {
        merchantCapabilities: ["supports3DS"],
        supportedNetworks: ["amex", "masterCard", "visa", "mada"]
    };

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