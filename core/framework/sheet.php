<?php

namespace Framework {

	use Framework\Base as Base;

	class Sheet extends Base {

		/**
		 * @readwrite
		 */
		protected $_array;

		/**
		 * @readwrite
		 */
		protected $_class;

		/**
		 * @readwrite
		 */
		protected $_parametrs;

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
		}
		public function __destruct() {
		}
		public function initialize() {
		}
	}
}