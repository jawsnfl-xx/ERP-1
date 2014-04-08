<?php

namespace Plugins\Quality_management {

	use Plugins\Quality_management as Quality_management;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 *        
	 *        
	 * @name QualityInspection
	 * @namespace Plugins\Quality_management
	 *           
	 * @version 1
	 *         
	 * @uses Plugins\Quality_management
	 *      
	 *       @note
	 *       Inspekcja jakości
	 *      
	 */
	class QualityInspection extends Quality_management {
		
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