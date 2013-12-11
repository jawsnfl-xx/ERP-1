<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Registry as Registry;
	use Framework\Inspector as Inspector;
	use Framework\Router\Exception as Exception;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Router extends Base {
		
		/**
		 * @readwrite
		 */
		protected $_url;
		
		/**
		 * @readwrite
		 */
		protected $_extension;
		
		/**
		 * @read
		 */
		protected $_controller;
		
		/**
		 * @read
		 */
		protected $_action;
		
		/**
		 *
		 * @var unknown
		 */
		protected $_routes = array ();
		
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
		 * @param unknown $route        	
		 * @return \Framework\Router
		 */
		public function addRoute($route) {
			$this->_routes [] = $route;
			return $this;
		}
		
		/**
		 *
		 * @param unknown $route        	
		 * @return \Framework\Router
		 */
		public function removeRoute($route) {
			foreach ( $this->_routes as $i => $stored ) 

			{
				if ($stored == $route) {
					unset ( $this->_routes [$i] );
				}
			}
			return $this;
		}
		
		/**
		 *
		 * @return multitype:string
		 */
		public function getRoutes() {
			$list = array ();
			foreach ( $this->_routes as $route ) 

			{
				$list [$route->pattern] = get_class ( $route );
			}
			return $list;
		}
		
		/**
		 *
		 * @param unknown $controller        	
		 * @param unknown $action        	
		 * @param unknown $parameters        	
		 * @throws Exception\Controller
		 * @throws Exception\Action
		 */
		protected function _pass($controller, $action, $parameters = array()) {
			$name = ucfirst ( $controller );
			$this->_controller = $controller;
			$this->_action = $action;
			
			// var_dump ( $this );
			var_dump ( $name );
			try {
				// $instance = new $name ( array ( "parameters" => $parameters ) );
				// print $name;
				// $name = '\Framework\Controller\\' . $name;
				$instance = new $name ();
				var_dump ( $instance );
				print 'asd';
				// Registry::set ( "controller", $instance );
				// $controller = $instance;
			} catch ( \Exception $e ) {
				throw new Exception\Controller ( "Controller {$name} not found" );
			}
			if (! method_exists ( $instance, $action )) {
				$instance->willRenderLayoutView = false;
				$instance->willRenderActionView = false;
				throw new Exception\Action ( "Action {$action} not found" );
			}
			$inspector = new Inspector ( $instance );
			$methodMeta = $inspector->getMethodMeta ( $action );
			if (! empty ( $methodMeta ["@protected"] ) || ! empty ( $methodMeta ["@private"] )) {
				throw new Exception\Action ( "Action {$action} not found" );
			}
			$hooks = function ($meta, $type) use($inspector, $instance) {
				if (isset ( $meta [$type] )) {
					$run = array ();
					foreach ( $meta [$type] as $method ) {
						$hookMeta = $inspector->getMethodMeta ( $method );
						if (in_array ( $method, $run ) && ! empty ( $hookMeta ["@once"] )) {
							continue;
						}
						$instance->$method ();
						$run [] = $method;
					}
				}
			};
			$hooks ( $methodMeta, "@before" );
			
			call_user_func_array ( array (
					$instance,
					$action 
			), is_array ( $parameters ) ? $parameters : array () );
			$hooks ( $methodMeta, "@after" );
			// unset controller
			Registry::erase ( "controller" );
		}
		
		/**
		 */
		public function dispatch() {
			$url = $this->url;
			$parameters = array ();
			$controller = "home";
			$action = "index";
			
			var_dump ( $url );
			// foreach ( $this->_routes as $route ) {
			
			// var_dump ( $route );
			// $matches = $route->matches ( $url );
			
			// print 'kupa';
			
			// if ($matches) {
			// $controller = $route->controller;
			// $action = $route->action;
			// $parameters = $route->parameters;
			// $this->_pass ( $controller, $action, $parameters );
			// return;
			// }
			// }
			
			$parts = explode ( "/", trim ( $url, "/" ) );
			if (sizeof ( $parts ) > 0) {
				$controller = $parts [0];
				if (sizeof ( $parts ) >= 2) 

				{
					$action = $parts [1];
					$parameters = array_slice ( $parts, 2 );
				}
			}
			// var_dump ( $controller );
			$this->_pass ( $controller, $action, $parameters );
		}
	}
}