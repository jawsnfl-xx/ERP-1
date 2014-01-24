<?php

namespace Framework\Session\Driver {

	use Framework\Session as Session;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Server extends Session\Driver {
		
		/**
		 * @readwrite
		 */
		protected $_prefix = "app_";
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
			session_start ();
		}
		
		/**
		 *
		 * @param unknown $key        	
		 * @param string $default        	
		 * @return unknown string
		 */
		public function get($key, $default = null) {
			$prefix = $this->getPrefix ();
			if (isset ( $_SESSION [$prefix . $key] )) {
				return $_SESSION [$prefix . $key];
			}
			return $default;
		}
		
		/**
		 *
		 * @param unknown $key        	
		 * @param unknown $value        	
		 * @return \Framework\Session\Driver\Server
		 */
		public function set($key, $value) {
			$prefix = $this->getPrefix ();
			$_SESSION [$prefix . $key] = $value;
			return $this;
		}
		
		/**
		 *
		 * @param unknown $key        	
		 * @return \Framework\Session\Driver\Server
		 */
		public function erase($key) {
			$prefix = $this->getPrefix ();
			unset ( $_SESSION [$prefix . $key] );
			return $this;
		}
		
		/**
		 */
		public function __destruct() {
			session_commit ();
		}
	}
}