<?php

/**
 *
 * @author Marcin
 *
 */
namespace Module\Quality_management {

	/**
	 */
	use Module as Module;
	use Framework\Registry as Registry;
	use Module\Quality_management as Quality_management;
	use Module\Product_technology as Product_technology;
	use Module\Product_technology\Product as Product;

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 */
	class Production_quality_management extends Quality_management {

		/**
		 * @readwrite
		 */
		public $sheet;
		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
		}

		/**
		 *
		 * @return NULL
		 */
		public function _createList() {
			$database = Registry::get ( "database" );
			$data = NULL;

			$data = $database->_mysql->fetch_array ( 'select
    *
from
    control_measurements
        left join
    orders ON control_measurements.orders_id_orders = orders.id_orders
        left join
    products ON control_measurements.products_id_products = products.id_products
        left join
    packages ON control_measurements.packages_id_packages = packages.id_packages
LIMIT 100;' );
			return $data;
		}
		public function _createView($_id) {
			$database = Registry::get ( "database" );
			$data = NULL;

			$data = $database->_mysql->fetch_array ( 'select
    *
from
    control_measurements
        left join
    orders ON control_measurements.orders_id_orders = orders.id_orders
        left join
    products ON control_measurements.products_id_products = products.id_products
        left join
    packages ON control_measurements.packages_id_packages = packages.id_packages
where
    `control_measurements.id_control_measurements` = ' . $_id . '
LIMIT 1;' );
			return $data;
		}
	}
}