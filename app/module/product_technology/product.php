<?php

namespace Module\Product_technology {

	use Module\Product_technology as Product_technology;
	use Framework\Registry as Registry;

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 */
	class Product extends Product_technology {

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
		 * @param unknown $_id
		 */
		public function _isExists($_id) {
			$database = Registry::get ( "database" );
		}

		/**
		 *
		 * @return unknown
		 */
		public function _createList() {
			$database = Registry::get ( "database" );
			$data = NULL;

			// var_dump ( $database );
			$data = $database->_mysql->fetch_array ( 'SELECT * FROM test.products LIMIT 100;' );
			// var_dump ( $data );
			return $data;
		}

		/**
		 *
		 * @return unknown
		 */
		public function _createView($_id) {
			$database = Registry::get ( "database" );
			$data = NULL;

			// var_dump ( $database );
			$data = $database->_mysql->fetch_array ( 'SELECT * FROM test.products WHERE
    `id_products` = ' . $_id . ' LIMIT 100;' );
			// var_dump ( $data );
			return $data;
		}
	}
}