<?php

namespace Module\Product_technology {

	use Module\Product_technology as Product_technology;
	use Framework\Registry as Registry;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Technology extends Product_technology {
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
		}
	}
}