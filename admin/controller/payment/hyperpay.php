<?php

class ControllerPaymentHyperpay extends Controller
{

    private $error = array();

    public function index()
    {
        $this->load->language('payment/hyperpay');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        $data['heading_title'] = $this->language->get('heading_title');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('hyperpay', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_payment'),
            'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('payment/hyperpay', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['permission'])) {
            $data['error_permission'] = $this->error['permission'];
        } else {
            $data['error_permission'] = '';
        }

        if (isset($this->error['heading_title'])) {
            $data['error_heading_title'] = $this->error['heading_title'];
        } else {
            $data['error_heading_title'] = '';
        }

        if (isset($this->error['channel'])) {
            $data['error_channel'] = $this->error['channel'];
        } else {
            $data['error_channel'] = '';
        }

        if (isset($this->error['access_token'])) {
            $data['error_access_token'] = $this->error['access_token'];
        } else {
            $data['error_access_token'] = '';
        }


        //-------------------------------------------------------        

        $data['text_edit'] = $this->language->get('text_edit');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['action'] = $this->url->link('payment/hyperpay', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

        $data['entry_heading_title'] = $this->language->get('entry_heading_title');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_testmode'] = $this->language->get('entry_testmode');
        $data['entry_testmode_off'] = $this->language->get('entry_testmode_off');
        $data['entry_testmode_on'] = $this->language->get('entry_testmode_on');

        $data['entry_trans_type'] = $this->language->get('entry_trans_type');
        $data['entry_all_trans_type'] = $this->get_hyperpay_trans_type();

        $data['entry_trans_mode'] = $this->language->get('entry_trans_mode');
        $data['entry_all_trans_mode'] = $this->get_hyperpay_trans_mode();

        $data['entry_channel'] = $this->language->get('entry_channel');
        $data['entry_access_token'] = $this->language->get('entry_access_token');
        //  $data['entry_loginid'] = $this->language->get('entry_loginid');
        //  $data['entry_password'] = $this->language->get('entry_password');

        $data['entry_brands'] = $this->language->get('entry_brands');
        $data['entry_all_brands'] = $this->get_hyperpay_payment_methods();

        $data['entry_payment_style'] = $this->language->get('Payment Style');
        $data['entry_all_payment_style'] = $this->get_hyperpay_payment_style();

        $data['entry_mailerrors'] = $this->language->get('entry_mailerrors');
        $data['entry_mailerrors_enable'] = $this->language->get('entry_mailerrors_enable');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_order_status_failed'] = $this->language->get('entry_order_status_failed');

        $data['entry_connector'] = $this->language->get('entry_connector');
        $data['entry_all_connector'] = $this->get_hyperpay_connector();
        //-----------------------------------------------------------------------

        if (isset($this->request->post['hyperpay_status'])) {
            $data['hyperpay_status'] = $this->request->post['hyperpay_status'];
        } else {
            $data['hyperpay_status'] = $this->config->get('hyperpay_status');
        }

        if (isset($this->request->post['hyperpay_sort_order'])) {
            $data['hyperpay_sort_order'] = $this->request->post['hyperpay_sort_order'];
        } else {
            $data['hyperpay_sort_order'] = $this->config->get('hyperpay_sort_order');
        }

        if (isset($this->request->post['hyperpay_testmode'])) {
            $data['hyperpay_testmode'] = $this->request->post['hyperpay_testmode'];
        } else {
            $data['hyperpay_testmode'] = $this->config->get('hyperpay_testmode');
        }

        if (isset($this->request->post['hyperpay_trans_type'])) {
            $data['hyperpay_trans_type'] = $this->request->post['hyperpay_trans_type'];
        } else {
            $data['hyperpay_trans_type'] = $this->config->get('hyperpay_trans_type');
        }

        if (isset($this->request->post['hyperpay_trans_mode'])) {
            $data['hyperpay_trans_mode'] = $this->request->post['hyperpay_trans_mode'];
        } else {
            $data['hyperpay_trans_mode'] = $this->config->get('hyperpay_trans_mode');
        }

        if (isset($this->request->post['hyperpay_heading_title'])) {
            $data['hyperpay_heading_title'] = $this->request->post['hyperpay_heading_title'];
        } else {
            $data['hyperpay_heading_title'] = $this->config->get('hyperpay_heading_title');
        }

        if (isset($this->request->post['hyperpay_channel'])) {
            $data['hyperpay_channel'] = $this->request->post['hyperpay_channel'];
        } else {
            $data['hyperpay_channel'] = $this->config->get('hyperpay_channel');
        }

        if (isset($this->request->post['hyperpay_brands'])) {
            $data['hyperpay_brands'] = $this->request->post['hyperpay_brands'];
        } else {
            $data['hyperpay_brands'] = $this->config->get('hyperpay_brands');
        }

        if (isset($this->request->post['hyperpay_payment_style'])) {
            $data['hyperpay_payment_style'] = $this->request->post['hyperpay_payment_style'];
        } else {
            $data['hyperpay_payment_style'] = $this->config->get('hyperpay_payment_style');
        }

        if (isset($this->request->post['hyperpay_mailerrors'])) {
            $data['hyperpay_mailerrors'] = $this->request->post['hyperpay_mailerrors'];
        } else {
            $data['hyperpay_mailerrors'] = $this->config->get('hyperpay_mailerrors');
        }

        if (isset($this->request->post['hyperpay_mailerrors_enable'])) {
            $data['hyperpay_mailerrors_enable'] = $this->request->post['hyperpay_mailerrors_enable'];
        } else {
            $data['hyperpay_mailerrors_enable'] = $this->config->get('hyperpay_mailerrors_enable');
        }

        $data['hyperpay_admin_email'] = $this->config->get('config_email');

        $this->load->model('localisation/order_status');
        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        if (isset($this->request->post['hyperpay_order_status_id'])) {
            $data['hyperpay_order_status_id'] = $this->request->post['hyperpay_order_status_id'];
        } else {
            $data['hyperpay_order_status_id'] = $this->config->get('hyperpay_order_status_id');
        }

        if (isset($this->request->post['hyperpay_order_status_failed_id'])) {
            $data['hyperpay_order_status_failed_id'] = $this->request->post['hyperpay_order_status_failed_id'];
        } else {
            $data['hyperpay_order_status_failed_id'] = $this->config->get('hyperpay_order_status_failed_id');
        }

        if (isset($this->request->post['hyperpay_access_token'])) {
            $data['hyperpay_access_token'] = $this->request->post['hyperpay_access_token'];
        } else {
            $data['hyperpay_access_token'] = $this->config->get('hyperpay_access_token');
        }

        if (isset($this->request->post['hyperpay_connector'])) {
            $data['hyperpay_connector'] = $this->request->post['hyperpay_connector'];
        } else {
            $data['hyperpay_connector'] = $this->config->get('hyperpay_connector');
        }


        $data['text_missing'] = $this->language->get('text_missing');


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('payment/hyperpay.tpl', $data));
    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'payment/hyperpay')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['hyperpay_heading_title']) {
            $this->error['heading_title'] = $this->language->get('error_heading_title');
        }

        if (!$this->request->post['hyperpay_channel']) {
            $this->error['channel'] = $this->language->get('error_channel');
        }

        if (!$this->request->post['hyperpay_access_token']) {
            $this->error['access_token'] = $this->language->get('access_token');
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }


    private function get_hyperpay_payment_methods()
    {
        $hyperpay_payments = array(
            'VISA' => 'Visa',
            'UKASH' => 'Ukash',
            'PAYPAL' => 'PayPal',
            'MASTER' => 'Master Card',
            'DISCOVER' => 'Discover',
            'AMEX' => 'American Express',
            'STC_PAY' => 'STCPay'

        );

        return $hyperpay_payments;
    }


    private function get_hyperpay_trans_mode()
    {
        $hyperpay_trans_mode = array(
            'CONNECTOR_TEST' => 'CONNECTOR_TEST',
            'INTEGRATOR_TEST' => 'INTEGRATOR_TEST',
            'LIVE' => 'LIVE'
        );

        return $hyperpay_trans_mode;
    }

    private function get_hyperpay_trans_type()
    {
        $hyperpay_trans_type = array(
            'DB' => 'Debit',
            'PA' => 'Pre-Authorization'
        );

        return $hyperpay_trans_type;
    }

    private function get_hyperpay_payment_style()
    {
        $hyperpay_payment_style = array(
            'card' => 'Card',
            'plain' => 'Plain'
        );

        return $hyperpay_payment_style;
    }

    private function get_hyperpay_connector()
    {
        $hyperpay_connector = array(
            'visa' => 'VISA ACP',
            'migs' => 'MIGS / MPGS'
        );
        return $hyperpay_connector;
    }
}