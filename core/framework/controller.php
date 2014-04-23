<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Framework {

	use Framework\Base as Base;
	use Framework\View as View;
	use Framework\Registry as Registry;
	use Framework\Template as Template;
	use Framework\Router as Router;
	use Framework\Controller\Exception as Exception;
	use Framework\StringMethods as StringMethods;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Controller extends Base {

		/**
		 * @read
		 */
		protected $_name;

		/**
		 * @readwrite
		 */
		protected $_parameters;

		/**
		 * @readwrite
		 */
		protected $_table;

		/**
		 * @readwrite
		 */
		protected $_layoutView;

		/**
		 * @readwrite
		 */
		protected $_actionView;

		/**
		 * @readwrite
		 */
		protected $_willRenderLayoutView = true;

		/**
		 * @readwrite
		 */
		protected $_willRenderActionView = true;

		/**
		 * @readwrite
		 */
		protected $_defaultPath = "";

		/**
		 * @readwrite
		 */
		public $_defaultLayout = "layouts\\standard";

		/**
		 * @readwrite
		 */
		protected $_defaultExtension = "html";

		/**
		 * @readwrite
		 */
		protected $_defaultContentType = "text/html";

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );

			/**
			 */
			if ($this->getWillRenderLayoutView ()) {

				/**
				 */
				$defaultPath = $this->getDefaultPath ();
				$defaultLayout = $this->getDefaultLayout ();
				$defaultExtension = $this->getDefaultExtension ();

				/**
				 */
				$view = new View ( array (
						"file" => DIRECTORY_SEPARATOR . $defaultPath . DIRECTORY_SEPARATOR . $defaultLayout . '.' . $defaultExtension
				) );

				$this->_layoutView = $view;
			}

			/**
			 */
			if ($this->getWillRenderActionView ()) {

				$router = new Router ( array (
						"url" => isset ( $_GET ["url"] ) ? $_GET ["url"] : "home/index",
						"extension" => isset ( $_GET ["extension"] ) ? $_GET ["extension"] : "html"
				) );

				Registry::set ( "router", $router );

				$routes = array (
						array (
								"pattern" => "login",
								"controller" => "users",
								"action" => "login"
						),
						array (
								"pattern" => "index",
								"controller" => "users",
								"action" => "index"
						),
						array (
								"pattern" => "logout",
								"controller" => "users",
								"action" => "logout"
						),
						array (
								"pattern" => "signup",
								"controller" => "users",
								"action" => "signup"
						),
						array (
								"pattern" => "home/index",
								"controller" => "home",
								"action" => "index"
						),
						array (
								"pattern" => "settings",
								"controller" => "home",
								"action" => "settings"
						),
						array (
								"pattern" => "quality_management",
								"controller" => "module",
								"action" => "quality_management"
						),
						array (
								"pattern" => "product_technology",
								"controller" => "module",
								"action" => "product_technology"
						)
				);

				/**
				 */
				foreach ( $routes as $route ) {
					$router->addRoute ( new Router\Route\Regex ( $route ) );
				}
				unset ( $routes );
				$router->dispatch ();

				$controller = $router->getController ();
				$action = $router->getAction ();
				$parameters = $router->getParameters ();
				$table = $router->getTable ();

				/**
				 * UWAGA! Istnieje możliwość wyłączenia treści strony w index.php w stałych.
				 * ==> DEVELOP_MODE
				 */
				if (DEVELOP_MODE === 1) {
					$view = new View ( array (
							"parameters" => $parameters,
							"table" => $table
					) );
				} else {
					$view = new View ( array (
							"file" => DIRECTORY_SEPARATOR . $defaultPath . DIRECTORY_SEPARATOR . $controller . DIRECTORY_SEPARATOR . $action . '.' . $defaultExtension,
							"parameters" => $parameters,
							"table" => $table
					) );
				}

				/**
				 */
				$this->setActionView ( $view );
			}
		}

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

			/**
			 */
			$defaultContentType = $this->_defaultContentType;
			$results = null;

			/**
			 */
			$doAction = $this->_willRenderActionView && $this->_actionView;
			$doLayout = $this->_willRenderLayoutView && $this->_layoutView;

			/**
			 */
			try {

				if ($doLayout) {
					$view = $this->_layoutView;

					$view->set ( "template", $results );
					$results = $view->render ();

					header ( "Content-type: {$defaultContentType}" );
					echo $results;
				}

				if ($doAction) {

					$view = $this->_actionView;
					$results = $view->render ();
					header ( "Content-type: {$defaultContentType}" );
					echo $results;

					$closer = $this->_layoutView;
					$closer->__set ( "file", "layouts\\closer.html" );
					$results = $closer->render ();
					echo $results;
				} else {
					header ( "Content-type: {$defaultContentType}" );

					echo $results;
					$this->_willRenderLayoutView = FALSE;
					$this->_willRenderActionView = FALSE;
				}
			} catch ( \Exception $e ) {
				throw new View\Exception\Render ( "Invalid layout/template syntax" );
			}
		}

		/**
		 */
		protected function getName() {
			/**
			 */
			if (empty ( $this->_name )) {
				$this->_name = get_class ( $this );
			}
			/**
			 */
			return $this->_name;
		}

		/**
		 */
		public function __destruct() {
			// Events::fire("framework.controller.destruct.before", array(
			// $this->name
			// ));
			$this->render ();
			// Events::fire("framework.controller.destruct.after", array(
			// $this->name
			// ));
		}
	}
}