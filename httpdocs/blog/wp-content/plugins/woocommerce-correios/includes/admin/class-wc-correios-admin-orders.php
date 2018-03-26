<?php
/**
 * Admin orders actions.
 *
 * @package WooCommerce_Correios/Admin/Orders
 * @since   3.0.0
 * @version 3.2.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Correios orders.
 */
class WC_Correios_Admin_Orders {

	/**
	 * Initialize the order actions.
	 */
	public function __construct() {
		add_action( 'add_meta_boxes', array( $this, 'register_metabox' ) );
		add_filter( 'woocommerce_resend_order_emails_available', array( $this, 'resend_tracking_code_email' ) );
		add_action( 'wp_ajax_woocommerce_correios_add_tracking_code', array( $this, 'ajax_add_tracking_code' ) );
		add_action( 'wp_ajax_woocommerce_correios_remove_tracking_code', array( $this, 'ajax_remove_tracking_code' ) );
	}

	/**
	 * Register tracking code metabox.
	 */
	public function register_metabox() {
		add_meta_box(
			'wc_correios',
			'Correios',
			array( $this, 'metabox_content' ),
			'shop_order',
			'side',
			'default'
		);
	}

	/**
	 * Tracking code metabox content.
	 *
	 * @param WC_Post $post Post data.
	 */
	public function metabox_content( $post ) {
		$tracking_codes = wc_correios_get_tracking_codes( $post->ID );

		$suffix = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
		wp_enqueue_style( 'woocommerce-correios-orders-admin', plugins_url( 'assets/css/admin/orders' . $suffix . '.css', WC_Correios::get_main_file() ), array(), WC_Correios::VERSION );
		wp_enqueue_script( 'woocommerce-correios-orders-admin', plugins_url( 'assets/js/admin/orders' . $suffix . '.js', WC_Correios::get_main_file() ), array( 'jquery', 'jquery-blockui', 'wp-util' ), WC_Correios::VERSION, true );
		wp_localize_script(
			'woocommerce-correios-orders-admin',
			'WCCorreiosAdminOrdersParams',
			array(
				'order_id' => $post->ID,
				'i18n'     => array(
					'removeQuestion' => esc_js( __( 'Are you sure you want to remove this tracking code?', 'woocommerce-correios' ) ),
				),
				'nonces'   => array(
					'add'    => wp_create_nonce( 'woocommerce-correios-add-tracking-code' ),
					'remove' => wp_create_nonce( 'woocommerce-correios-remove-tracking-code' ),
				),
			)
		);

		include_once dirname( __FILE__ ) . '/views/html-meta-box-tracking-code.php';
	}

	/**
	 * Include option to resend the tracking code email.
	 *
	 * @param array $emails List of emails.
	 *
	 * @return array
	 */
	public function resend_tracking_code_email( $emails ) {
		$emails[] = 'correios_tracking';

		return $emails;
	}

	/**
	 * Ajax - Add tracking code.
	 */
	public function ajax_add_tracking_code() {
		check_ajax_referer( 'woocommerce-correios-add-tracking-code', 'security' );

		$args = filter_input_array( INPUT_POST, array(
			'order_id'      => FILTER_SANITIZE_NUMBER_INT,
			'tracking_code' => FILTER_SANITIZE_STRING,
		) );

		$order = wc_get_order( $args['order_id'] );

		wc_correios_update_tracking_code( $order, $args['tracking_code'] );

		$tracking_codes = wc_correios_get_tracking_codes( $order );

		wp_send_json_success( $tracking_codes );
	}

	/**
	 * Ajax - Remove tracking code.
	 */
	public function ajax_remove_tracking_code() {
		check_ajax_referer( 'woocommerce-correios-remove-tracking-code', 'security' );

		$args = filter_input_array( INPUT_POST, array(
			'order_id'      => FILTER_SANITIZE_NUMBER_INT,
			'tracking_code' => FILTER_SANITIZE_STRING,
		) );

		wc_correios_update_tracking_code( $args['order_id'], $args['tracking_code'], true );

		wp_send_json_success();
	}
}

new WC_Correios_Admin_Orders();
