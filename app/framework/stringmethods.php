<?php

namespace Framework {

	
	/**
	 * 
	 * @author Jet
	 *
	 */
	class StringMethods {
		
		/**
		 * 
		 * @var unknown
		 */
		private static $_delimiter = "#";
		
		/**
		 * 
		 */
		private function __construct() {
			// do nothing
		}
		
		/**
		 * 
		 */
		private function __clone() {
			// do nothing
		}
		
		/**
		 * 
		 * @param unknown $pattern
		 * @return string
		 */
		private static function _normalize($pattern) {
			return self::$_delimiter . trim ( $pattern, self::$_delimiter ) . self::$_delimiter;
		}
		
		/**
		 * 
		 * @return \Framework\unknown
		 */
		public static function getDelimiter() {
			return self::$_delimiter;
		}
		
		/**
		 * 
		 * @param unknown $delimiter
		 */
		public static function setDelimiter($delimiter) {
			self::$_delimiter = $delimiter;
		}
		
		/**
		 * 
		 * @param unknown $string
		 * @param unknown $pattern
		 * @return unknown|NULL
		 */
		public static function match($string, $pattern) {
			preg_match_all ( self::_normalize ( $pattern ), $string, $matches, PREG_PATTERN_ORDER );
			if (! empty ( $matches [1] )) {
				return $matches [1];
			}
			if (! empty ( $matches [0] )) {
				return $matches [0];
			}
			return null;
		}
		
		/**
		 * 
		 * @param unknown $string
		 * @param unknown $pattern
		 * @param string $limit
		 * @return multitype:
		 */
		public static function split($string, $pattern, $limit = null) {
			$flags = PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE;
			return preg_split ( self::_normalize ( $pattern ), $string, $limit, $flags );
		}
	}
}