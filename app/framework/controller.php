<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\View as View;
	use Framework\Registry as Registry;
	use Framework\Template as Template;
	use Framework\Controller\Exception as Exception;

	class Controller extends Base {
		
		/**
		 * @readwrite
		 */
		protected $_parameters;
		/**
		 * * @readwrite
		 */
		protected $_layoutView;
		/**
		 * * @readwrite
		 */
		protected $_actionView;
		/**
		 * * @readwrite
		 */
		protected $_willRenderLayoutView = true;
		
		/**
		 * * @readwrite
		 */
		protected $_willRenderActionView = true;
		/**
		 * * @readwrite
		 */
		protected $_defaultPath = "application/views";
		/**
		 * * @readwrite
		 */
		protected $_defaultLayout = "layouts/standard";
		/**
		 * * @readwrite
		 */
		protected $_defaultExtension = "html";
		/**
		 * * @readwrite
		 */
		protected $_defaultContentType = "text/html";
		
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
		 * @return \Framework\Controller\Exception\Argument
		 */
		protected function _getExceptionForArgument() {
			return new Exception\Argument ( "Invalid argument" );
		}
		
		/**
		 *
		 * @throws View\Exception\Renderer
		 */
		public function render() {
			print 'public function render() <br />';
			$defaultContentType = $this->getDefaultContentType ();
			$results = null;
			$doAction = $this->getWillRenderActionView () && $this->getActionView ();
			$doLayout = $this->getWillRenderLayoutView () && $this->getLayoutView ();
			try {
				if ($doAction) {
					$view = $this->getActionView ();
					$results = $view->render ();
				}
				if ($doLayout) {
					$view = $this->getLayoutView ();
					$view->set ( "template", $results );
					$results = $view->render ();
					header ( "Content-type: {$defaultContentType}" );
					echo $results;
				} else if ($doAction) {
					header ( "Content-type: {$defaultContentType}" );
					echo $results;
					$this->setWillRenderLayoutView ( false );
					$this->setWillRenderActionView ( false );
				}
			} catch ( \Exception $e ) {
				throw new View\Exception\Renderer ( "Invalid layout/template syntax" );
			}
		}
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			
			print 'public function __construct($options = array()) <br />';
			// print 'dasdasd';
			parent::__construct ( $options );
			if ($this->getWillRenderLayoutView ()) {
				$defaultPath = $this->getDefaultPath ();
				$defaultLayout = $this->getDefaultLayout ();
				$defaultExtension = $this->getDefaultExtension ();
				$view = new View ( array (
						"file" => APP_PATH . "/{$defaultPath}/{$defaultLayout}.{$defaultExtension}" 
				) );
				$this->setLayoutView ( $view );
			}
			if ($this->getWillRenderLayoutView ()) {
				$router = Registry::get ( "router" );
				$controller = $router->getController ();
				$action = $router->getAction ();
				$view = new View ( array (
						"file" => APP_PATH . "/{$defaultPath}/{$controller}/{$action}.{$defaultExtension}" 
				) );
				$this->setActionView ( $view );
			}
		}
		
		/**
		 */
		public function __destruct() {
			
			print 'public function __destruct() <br />';
			$this->render ();
		}
	}
}