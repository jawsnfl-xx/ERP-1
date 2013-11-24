<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Database as Database;
	use Framework\Database\Exception as Exception;

	class Database extends Base {

		public $_options;
		public $_mysql;

		protected function _getExceptionForImplementation( $method ) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}
		
		public function initialize() {
			$this->_mysql =  new Database\Mysql();
		}
	}
}
