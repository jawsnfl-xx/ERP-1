<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Database as Database;
	use Framework\Database\Exception as Exception;

	class Database extends Base {
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
				case "mysql" :
					{
						return new Database\Connector\Mysql ( $this->_options );
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
