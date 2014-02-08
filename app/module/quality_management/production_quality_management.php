<?php

/**
 *
 * @author Marcin
 *
 */
namespace Module {

	/**
	 */
	use Module as Module;
	use Module\Quality_management as Quality_management;

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 */
	class Production_quality_management extends Quality_management {

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