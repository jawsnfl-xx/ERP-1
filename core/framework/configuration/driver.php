<?php
namespace Framework\Configuration {

	use Framework\Base as Base;
	use Framework\Configuration\Exception as Exception;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Driver extends Base {

		/**
		 *
		 * @var unknown
		 */
		protected $_parsed = array();

		/**
		 *
		 * @return \Framework\Configuration\Driver
		 */
		public function initialize() {
			return $this;
		}

		/**
		 * (non-PHPdoc)
		 *
		 * @see \Framework\Base::_getExceptionForImplementation()
		 */
		protected function _getExceptionForImplementation($method) {
			return new Exception\Implementation("{$method} method not implemented");
		}
	}
}
