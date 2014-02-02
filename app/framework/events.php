<?php

namespace Framework {

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Events {
		
		/**
		 *
		 * @var unknown
		 */
		private static $_callbacks = array ();
		
		/**
		 */
		private function __construct() {
			// do nothing
		}
		
		/**
		 */
		private function __clone() {
			// do nothing
		}
		
		/**
		 *
		 * @param unknown $type        	
		 * @param unknown $callback        	
		 */
		public static function add($type, $callback) {
			if (empty ( self::$_callbacks [$type] )) {
				self::$_callbacks [$type] = array ();
			}
			self::$_callbacks [$type] [] = $callback;
		}
		
		/**
		 *
		 * @param unknown $type        	
		 * @param string $parameters        	
		 */
		public static function fire($type, $parameters = null) {
			if (! empty ( self::$_callbacks [$type] )) {
				foreach ( self::$_callbacks [$type] as $callback ) {
					call_user_func_array ( $callback, $parameters );
				}
			}
		}
		
		/**
		 *
		 * @param unknown $type        	
		 * @param unknown $callback        	
		 */
		public static function remove($type, $callback) {
			if (! empty ( self::$_callbacks [$type] )) {
				foreach ( self::$_callbacks [$type] as $i => $found ) {
					if ($callback == $found) {
						unset ( self::$_callbacks [$type] [$i] );
					}
				}
			}
		}
	}
}