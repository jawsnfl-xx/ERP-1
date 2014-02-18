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
			$product = new Product ();
			$_isExists = $product->_isExists ( '111' );
		}
	}
}