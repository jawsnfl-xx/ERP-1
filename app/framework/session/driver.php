<?php

namespace Framework\Session {

	use Framework\Session as Session;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Driver extends Session {
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
		}
	}
}