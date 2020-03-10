<?php

class ModelPaymentHyperpay extends Model {

    public function getMethod($address, $total) {
        $this->load->language('payment/hyperpay');

        $method_data = array(
            'code'       => 'hyperpay',
            'terms'      => '',
            'title'      => $this->config->get('hyperpay_heading_title'),
            'sort_order' => $this->config->get('hyperpay_sort_order')
        );

        return $method_data;        
    }

}