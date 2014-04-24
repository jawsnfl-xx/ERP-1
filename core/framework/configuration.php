<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Framework {

	use Framework\Base as Base;
	use Framework\Configuration as Configuration;
	use Framework\Configuration\Exception as Exception;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Configuration extends Base {

		/**
		 * @readwrite
		 */
		protected $_type;

		/**
		 * @readwrite
		 */
		protected $_options;

		/**
		 * (non-PHPdoc)
		 *
		 * @see \Framework\Base::_getExceptionForImplementation()
		 */
		protected function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}

		/**
		 *
		 * @throws Exception\Argument
		 * @return \Framework\Configuration\Driver\Ini
		 */
		public function initialize() {
			if (! $this->type) {
				throw new Exception\Argument ( "Invalid type" );
			}
			switch ($this->type) {
				case "ini" :
					{
						return new Configuration\Driver\Ini ( $this->options );
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