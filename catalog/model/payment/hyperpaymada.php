<?php

class ModelPaymentHyperpaymada extends Model {

    public function getMethod($address, $total) {
        $this->load->language('payment/hyperpay');

        $method_data = array(
            'code'       => 'hyperpaymada',
            'terms'      => '',
            'title'      => $this->config->get('hyperpaymada_heading_title'),
            'sort_order' => $this->config->get('hyperpaymada_sort_order')
        );

        return $method_data;        
    }

}