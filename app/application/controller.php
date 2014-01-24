<?php

namespace Application {

	use Framework\Registry;

	/**
	 *
	 * @author Marcin
	 *        
	 */
	class Controller extends \Framework\Controller {
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
			
			/**
			 * Tak działa przekazywanie klas przez Registry
			 *
			 * Całość może być deklarowana w bootsprap,
			 * natomiast wywoływana po rejestracji
			 * w dowolnym z kontrolerów.
			 */
			
			$configuration = Registry::get ( "configuration" );
			$database = Registry::get ( "database" );
			$session = Registry::get ( "session" );
		}
	}
}
