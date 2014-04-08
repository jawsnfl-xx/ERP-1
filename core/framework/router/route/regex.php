<?php

namespace Framework\Router\Route {

	use Framework\Router as Router;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 *        
	 *        
	 */
	class Regex extends Router\Route {
		
		/**
		 * @readwrite
		 */
		protected $_keys;
		
		/**
		 *
		 * @param unknown $url        	
		 * @return boolean
		 */
		public function matches($url) {
			$pattern = $this->pattern;
			
			preg_match_all ( "#^{$pattern}$#", $url, $values );
			if (sizeof ( $values ) && sizeof ( $values [0] ) && sizeof ( $values [1] )) {
				$derived = array_combine ( $this->keys, $values [1] );
				$this->parameters = array_merge ( $this->parameters, $derived );
				return true;
			}
			return false;
		}
	}
}