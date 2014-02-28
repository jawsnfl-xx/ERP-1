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

			$data = $database->_mysql->fetch_array ( 'SELECT * FROM control_measurements LIMIT 100;' );
			return $data;
		}
		public function _createView($_id) {
			$database = Registry::get ( "database" );
			$data = NULL;

			$data = $database->_mysql->fetch_array ( 'SELECT * FROM control_measurements WHERE
    `id_control_measurements` = ' . $_id . ' LIMIT 1;' );
			return $data;
		}
	}
}