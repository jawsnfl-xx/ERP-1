<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Template as Template;
	use Framework\View\Exception as Exception;

	class View extends Base {
		
		/**
		 * * @readwrite
		 */
		protected $_file;
		
		/**
		 * * @readwrite
		 */
		protected $_parameters;
		
		/**
		 * * @readwrite
		 */
		protected $_table;
		
		/**
		 * * @read
		 */
		protected $_template;
		protected $_data = array ();
		public function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}
		public function _getExceptionForArgument() {
			return new Exception\Argument ( "Invalid argument" );
		}
		public function __construct($options = array()) {
			parent::__construct ( $options );
			
			require_once DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . 'smarty' . DIRECTORY_SEPARATOR . 'libs' . DIRECTORY_SEPARATOR . 'Smarty.class.php';
			
			$this->_template = new \Smarty ();
			
			$this->_template->setTemplateDir ( APP_DIR . DIRECTORY_SEPARATOR . 'cache_tp' );
			$this->_template->setCompileDir ( APP_DIR . DIRECTORY_SEPARATOR . 'cache_cp' );
			$this->_template->setCacheDir ( APP_DIR . DIRECTORY_SEPARATOR . 'cache_cd' );
			
			$this->_template->assign ( 'parameters', $options ['parameters'] );
			$this->_template->assign ( 'table', $options ['table'] );
			
			// var_dump ( $options );
		}
		public function render() {
			$path = $this->getFile ();
			$path = APP_DIR . $path;
			
			if (! file_exists ( $path )) {
				return "";
			}
			
			return $this->_template->fetch ( $path );
		}
		public function get($key, $default = "") {
			if (isset ( $this->_data [$key] )) {
				return $this->_data [$key];
			}
			return $default;
		}
		protected function _set($key, $value) {
			if (! is_string ( $key ) && ! is_numeric ( $key )) {
				throw new Exception\Data ( "Key must be a string or a number" );
			}
			$this->_data [$key] = $value;
		}
		public function set($key, $value = null) {
			if (is_array ( $key )) {
				foreach ( $key as $_key => $value ) {
					$this->_set ( $_key, $value );
				}
				return $this;
			}
			$this->_set ( $key, $value );
			return $this;
		}
		public function erase($key) {
			unset ( $this->_data [$key] );
			return $this;
		}
	}
}