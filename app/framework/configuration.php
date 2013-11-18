<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Configuration as Configuration;
	use Framework\Configuration\Exception as Exception;

	class Configuration extends Base {
		/**
		 * @readwrite
		 */
		protected $_type;
		/**
		 * @readwrite
		 */
		public $_options;
		protected function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}
		public function initialize($_options) {
			if (! $this->type) {
				throw new Exception\Argument ( "Invalid type" );
			}
			switch ($this->type) {
				case "ini" :
					{
						return new Configuration\Driver\Ini ( $this->_options );
						break;
					}
				default :
					{
						throw new Exception\Argument ( "Invalid type" );
						break;
					}
			}
		}
	}
}