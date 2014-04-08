<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Template as Template;
	use Framework\View\Exception as Exception;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 *
	 *
	 */
	class View extends Base {

		/**
		 * @readwrite
		 */
		protected $_file;

		/**
		 * * @readwrite
		 */
		protected $_parameters;

		/**
		 * @readwrite
		 */
		protected $_table;

		/**
		 * @read
		 */
		protected $_template;

		/**
		 *
		 * @var unknown
		 */
		protected $_data = array ();

		/**
		 * (non-PHPdoc)
		 *
		 * @see \Framework\Base::_getExceptionForImplementation()
		 */
		public function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}

		/**
		 *
		 * @return \Framework\View\Exception\Argument
		 */
		public function _getExceptionForArgument() {
			return new Exception\Argument ( "Invalid argument" );
		}

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );

			// var_dump($options);

			// require_once '..' . DIRECTORY_SEPARATOR . 'php' . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'smarty' . DIRECTORY_SEPARATOR . 'Smarty.class.php';

			// require_once '..\twig\Autoloader.php';

			// print 'nic nie działa';

			$loader = new \Twig_Loader_Filesystem ( APP_DIR . "\\view\\" );
			$this->_template = new \Twig_Environment ( $loader );

			// var_dump($this->_template);

			// echo $twig->render('Hello {{ name }}!', array(
			// 'name' => 'Fabien'
			// ));

			// var_dump($this);

			// echo $twig->render('index.html', array('name' => 'Fabien'));

			// var_dump($loader);
			// var_dump($twig);

			// require_once dirname(__FILE__) . '../twig/Autoloader.php';
			// Twig_Autoloader::register(true);

			// $loader = new \Twig_Loader_String();
			// $twig = new \Twig_Environment($loader);

			// $this->_template = new \Smarty();

			// $this->_template->setTemplateDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_tp');
			// $this->_template->setCompileDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_cp');
			// $this->_template->setCacheDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_cd');

			// $this->_template->assign('parameters', $options['parameters']);
			// $this->_template->assign('table', $options['table']);
		}

		/**
		 *
		 * @return string
		 */
		public function render() {
			// print 'oko';
			// var_dump( $this );
			$path = $this->getFile ();

			// var_dump( $this->_parameters );
			// print 'jest.';
			return $this->_template->render ( $path, array (
					'_parameters' => $this->_parameters,
					'_table' => $this->_table
			) );

			// var_dump(APP_DIR . "\\view\\");
			// var_dump($this->_template);

			// print 'oko';
			// return $this->_template->render($path, $this->_parameters);
			// return $this->_template->render( 'index.html' );
			// var_dump($this->_template->render('index.html'));

			// var_dump($this->_template->render($path, $this->_parameters));
		}

		/**
		 *
		 * @param unknown $key
		 * @param string $default
		 * @return \Framework\unknown string
		 */
		public function get($key, $default = "") {
			if (isset ( $this->_data [$key] )) {
				return $this->_data [$key];
			}
			return $default;
		}

		/**
		 *
		 * @param unknown $key
		 * @param unknown $value
		 * @throws Exception\Data
		 */
		protected function _set($key, $value) {
			if (! is_string ( $key ) && ! is_numeric ( $key )) {
				throw new Exception\Data ( "Key must be a string or a number" );
			}
			$this->_data [$key] = $value;
		}

		/**
		 *
		 * @param unknown $key
		 * @param string $value
		 * @return \Framework\View
		 */
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

		/**
		 *
		 * @param unknown $key
		 * @return \Framework\View
		 */
		public function erase($key) {
			unset ( $this->_data [$key] );
			return $this;
		}
	}
}