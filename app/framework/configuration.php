<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Configuration as Configuration;
	use Framework\Configuration\Exception as Exception;

	/**
	 *
	 * @author Jet
	 *        
	 */
	class Configuration extends Base {
		
		/**
		 *
		 * @var unknown
		 */
		protected $_type;
		
		/**
		 *
		 * @var unknown
		 */
		public $_options;
		
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
		 * @param unknown $_options        	
		 * @throws Exception\Argument
		 * @return \Framework\Configuration\Driver\Ini
		 */
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