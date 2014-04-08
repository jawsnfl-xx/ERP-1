<?php

namespace Plugins\Inventory_management {

	use Plugins\Sales_management as Inventory_management;
	use Framework\Registry as Registry;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 *        
	 *        
	 */
	class Packages extends Inventory_management {
		
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
		 * @return unknown
		 */
		public function _createList() {
			$database = Registry::get ( "database" );
			
			/**
			 * Wyzerowanie zmienynch
			 */
			$data = NULL;
			
			$data = $database->_mysql->fetch_array ( 'SELECT * FROM packages
                    left join type_of_packages on type_of_packages.id_type_of_packages = packages.type_of_packages_id_type_of_packages
                	left join warehouse on warehouse.id_warehouse = packages.type_of_packages_id_type_of_packages
                	left join type_of_warehouse on type_of_warehouse.id_type_of_warehouse = warehouse.type_of_warehouse_id_type_of_warehouse
                    LIMIT 100;' );
			return $data;
		}
		
		/**
		 *
		 * @param unknown $_limit        	
		 * @return unknown
		 */
		public function _createListLimit($_limit) {
			$database = Registry::get ( "database" );
			
			/**
			 * Wyzerowanie zmienynch
			 */
			$data = NULL;
			
			$data = $database->_mysql->fetch_array ( 'SELECT * FROM packages
                    left join type_of_packages on type_of_packages.id_type_of_packages = packages.type_of_packages_id_type_of_packages
                	left join warehouse on warehouse.id_warehouse = packages.type_of_packages_id_type_of_packages
                	left join type_of_warehouse on type_of_warehouse.id_type_of_warehouse = warehouse.type_of_warehouse_id_type_of_warehouse
                    LIMIT ' . $_limit . ' ;' );
			return $data;
		}
	}
}