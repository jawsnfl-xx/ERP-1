<?php
namespace Plugins\Sales_management {

	use Plugins\Sales_management as Sales_management;
	use Framework\Registry as Registry;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 * @name Orders
	 * @namespace Plugins\Sales_managements
	 * @uses Plugins\Sales_management
	 * @uses Framework\Registry
	 * @version 1
	 */
	class Orders extends Sales_management {

		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct($options);
		}

		/**
		 *
		 * @return unknown
		 */
		public function _createList() {
			$database = Registry::get("database");
			
			/**
			 * Wyzerowanie zmienynch
			 */
			$data = NULL;
			
			$data = $database->_mysql->fetch_array('SELECT * FROM orders
                    left join orders_has_products on orders_has_products.orders_id_orders = orders.id_orders
	                left join products on products.id_products = orders_has_products.products_id_products
                    ORDER BY ORDER BY orders_date DESC
                    LIMIT 100;');
			return $data;
		}

		/**
		 *
		 * @return unknown
		 */
		public function _createListLimit($_limit) {
			$database = Registry::get("database");
			
			/**
			 * Wyzerowanie zmienynch
			 */
			$data = NULL;
			
			$data = $database->_mysql->fetch_array('SELECT * FROM orders
                    left join orders_has_products on orders_has_products.orders_id_orders = orders.id_orders
	                left join products on products.id_products = orders_has_products.products_id_products
                    ORDER BY ORDER BY orders_date DESC
                    LIMIT ' . $_limit . ' ;');
			return $data;
		}
	}
}