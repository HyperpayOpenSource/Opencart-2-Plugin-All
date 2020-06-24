<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-authorizenet-aim" data-toggle="tooltip"
                    title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                    class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                    id="form-authorizenet-aim" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-heading-title"><?php echo $entry_heading_title; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="hyperpaystc_heading_title"
                                value="<?php echo $hyperpaystc_heading_title; ?>"
                                placeholder="<?php echo $entry_heading_title; ?>" id="input-heading-title"
                                class="form-control" />
                            <?php if ($error_heading_title) { ?>
                            <div class="text-danger"><?php echo $error_heading_title; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_status" class="form-control">
                                <option value="1"
                                    <?php echo ($hyperpaystc_status == '1') ? 'selected="selected"' : ''; ?>>
                                    <?php echo $text_enabled; ?></option>
                                <option value="0"
                                    <?php echo ($hyperpaystc_status == '0') ? 'selected="selected"' : ''; ?>>
                                    <?php echo $text_disabled; ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_connector; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_connector" class="form-control">
                                <?php foreach ($entry_all_connector as $connector_val => $connector_name) { ?>
                                <option value="<?php echo $connector_val; ?>"
                                    <?php echo ($hyperpaystc_connector == $connector_val) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $connector_name; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-testmode"><?php echo $entry_testmode; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_testmode" class="form-control">
                                <option value="0"
                                    <?php echo ($hyperpaystc_testmode == '0') ? 'selected="selected"' : ''; ?>>
                                    <?php echo $entry_testmode_off; ?></option>
                                <option value="1"
                                    <?php echo ($hyperpaystc_testmode == '1') ? 'selected="selected"' : ''; ?>>
                                    <?php echo $entry_testmode_on; ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_trans_type; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_trans_type" class="form-control">
                                <?php foreach ($entry_all_trans_type as $trans_type_val => $trans_type) { ?>
                                <option value="<?php echo $trans_type_val; ?>"
                                    <?php echo ($hyperpaystc_trans_type == $trans_type_val) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $trans_type; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-mode"><?php echo $entry_trans_mode; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_trans_mode" class="form-control">
                                <?php foreach ($entry_all_trans_mode as $trans_mode_val => $trans_mode) { ?>
                                <option value="<?php echo $trans_mode_val; ?>"
                                    <?php echo ($hyperpaystc_trans_mode == $trans_mode_val) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $trans_mode; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-channel"><?php echo $entry_channel; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="hyperpaystc_channel" value="<?php echo $hyperpaystc_channel; ?>"
                                placeholder="<?php echo $entry_channel; ?>" id="input-channel" class="form-control" />
                            <?php if ($error_channel) { ?>
                            <div class="text-danger"><?php echo $error_channel; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-accesstoken"><?php echo $entry_access_token; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="hyperpaystc_access_token"
                                value="<?php echo $hyperpaystc_access_token; ?>"
                                placeholder="<?php echo $entry_access_token; ?>" id="input-accesstoken"
                                class="form-control" />
                            <?php if ($error_access_token) { ?>
                            <div class="text-danger"><?php echo $error_access_token; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-brands"><?php echo $entry_brands; ?></label>
                        <div class="col-sm-10">
                            <?php
                            $i = 1;
                            foreach ($entry_all_brands as $payment => $name) {
                                ?>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="hyperpaystc_brands[]" value="<?php echo $payment; ?>"
                                    <?php echo (is_array($hyperpaystc_brands) && in_array($payment, $hyperpaystc_brands)) ? 'checked="checked"' : ''; ?> />
                                <?php echo $name; ?>
                            </label>
                            <?php
                                if ($i % 2 == 0) {
                                    echo '</tr><tr>';
                                }
                                $i++;
                            }
                            ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-style"><?php echo $entry_payment_style; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_payment_style" class="form-control">
                                <?php foreach ($entry_all_payment_style as $payment_style_val => $payment_style) { ?>
                                <option value="<?php echo $payment_style_val; ?>"
                                    <?php echo ($hyperpaystc_payment_style == $payment_style_val) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $payment_style; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-status"><?php echo $entry_order_status; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_order_status_id" class="form-control">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"
                                    <?php echo ($order_status['order_status_id'] == $hyperpaystc_order_status_id) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $order_status['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-failed"><?php echo $entry_order_status_failed; ?></label>
                        <div class="col-sm-10">
                            <select name="hyperpaystc_order_status_failed_id" class="form-control">
                                <option value="0"
                                    <?php echo ('0' == $hyperpaystc_order_status_failed_id) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $text_missing; ?></option>
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"
                                    <?php echo ($order_status['order_status_id'] == $hyperpaystc_order_status_failed_id) ? 'selected="selected"' : ''; ?>>
                                    <?php echo $order_status['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label"
                            for="input-mailerrors"><?php echo str_replace('admin_email', $hyperpaystc_admin_email, $entry_mailerrors); ?></label>
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="hyperpaystc_mailerrors" value="1"
                                        <?php echo ($hyperpaystc_mailerrors == '1') ? 'checked="checked"' : ''; ?> />
                                    <?php echo $entry_mailerrors_enable; ?>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                            for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="hyperpaystc_sort_order" value="<?php echo $hyperpaystc_sort_order; ?>"
                                placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order"
                                class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>