<?php

class ModelPaymentHyperpaystc extends Model
{

    public function getMethod($address, $total)
    {
        $this->load->language('payment/hyperpay');

        $method_data = array(
            'code'       => 'hyperpaystc',
            'terms'      => '',
            'title'      => $this->config->get('hyperpaystc_heading_title'),
            'sort_order' => $this->config->get('hyperpaystc_sort_order')
        );

        return $method_data;
    }
}
