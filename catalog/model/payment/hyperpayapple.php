<?php

class ModelPaymentHyperpayapple extends Model {

    public function getMethod($address, $total) {
        $this->load->language('payment/hyperpay');

        $method_data = array(
            'code'       => 'hyperpayapple',
            'terms'      => '',
            'title'      =>$this->config->get('hyperpayapple_heading_title'),
            'sort_order' => $this->config->get('hyperpayapple_sort_order')
        );

        return $method_data;        
    }

}