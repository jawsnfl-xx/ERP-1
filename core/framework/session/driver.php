<?php
namespace Framework\Session {

	use Framework\Session as Session;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Driver extends Session {

		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			parent::__construct($options);
		}
	}
}