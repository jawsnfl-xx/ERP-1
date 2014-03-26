<?php
namespace Framework
{

    use Framework\Base as Base;
    use Framework\Registry as Registry;
    use Framework\Inspector as Inspector;
    use Framework\Router\Exception as Exception;

    /**
     *
     * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     * @copyright Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     *           
     */
    class Router extends Base
    {

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
        protected $_parameters;

        /**
         * @read
         */
        protected $_table;

        /**
         * @read
         */
        protected $_action;

        /**
         *
         * @var unknown
         */
        protected $_routes = array();

        /**
         * (non-PHPdoc)
         *
         * @see \Framework\Base::_getExceptionForImplementation()
         */
        public function _getExceptionForImplementation($method)
        {
            return new Exception\Implementation("{$method} method not implemented");
        }

        /**
         *
         * @param unknown $route            
         * @return \Framework\Router
         */
        public function addRoute($route)
        {
            $this->_routes[] = $route;
            return $this;
        }

        /**
         *
         * @param unknown $route            
         * @return \Framework\Router
         */
        public function removeRoute($route)
        {
            foreach ($this->_routes as $i => $stored) 

            {
                if ($stored == $route) {
                    unset($this->_routes[$i]);
                }
            }
            return $this;
        }

        /**
         *
         * @return multitype:string
         */
        public function getRoutes()
        {
            $list = array();
            foreach ($this->_routes as $route) 

            {
                $list[$route->pattern] = get_class($route);
            }
            return $list;
        }

        /**
         *
         * @param unknown $controller            
         * @param unknown $action            
         * @param unknown $parameters            
         * @param unknown $table            
         * @throws Exception\Controller
         * @throws Exception\Action
         */
        protected function _pass($controller, $action, $parameters = array(), $table = array())
        {
            $name = ucfirst($controller);
            $this->_controller = $controller;
            $this->_action = $action;
            $this->_parameters = $parameters;
            $this->_table = $table;
            
            /**
             */
            try {
                $temporary = 'Application\Controller\\' . $name;
                $instance = new $temporary(array(
                    "parameters" => $parameters,
                    "table" => $table
                ));
            } catch (\Exception $e) {
                
                throw new Exception\Controller("Controller {$name} not
                found");
            }
            if (! method_exists($instance, $action)) {
                $instance->willRenderLayoutView = false;
                $instance->willRenderActionView = false;
                throw new Exception\Action("Action {$action} not found");
            }
            $inspector = new Inspector($instance);
            $methodMeta = $inspector->getMethodMeta($action);
            if (! empty($methodMeta["@protected"]) || ! empty($methodMeta["@private"])) {
                throw new Exception\Action("Action {$action} not found");
            }
            $hooks = function ($meta, $type) use($inspector, $instance)
            {
                if (isset($meta[$type])) {
                    $run = array();
                    foreach ($meta[$type] as $method) {
                        $hookMeta = $inspector->getMethodMeta($method);
                        if (in_array($method, $run) && ! empty($hookMeta["@once"])) {
                            continue;
                        }
                        $instance->$method();
                        // var_dump( $instance);
                        // print 'asd';
                        $run[] = $method;
                    }
                }
            };
            $hooks($methodMeta, "@before");
            
            call_user_func_array(array(
                $instance,
                $action
            ), is_array($parameters) ? $parameters : array());
            $hooks($methodMeta, "@after");
            $this->_table = $instance->givmetable();
            
            // var_dump ( $instance );
        }

        /**
         */
        public function dispatch()
        {
            
            // print 'robi dispatch';
            // var_dump( $this);
            $url = $this->url;
            $parameters = array();
            $table = array();
            $controller = "home";
            $action = "index";
            
            $parts = explode("/", trim($url, "/"));
            if (sizeof($parts) > 0) {
                $controller = $parts[0];
                if (sizeof($parts) >= 2) 

                {
                    $action = $parts[1];
                    $parameters = array_slice($parts, 2);
                }
            }
            
            /**
             * To nie jest wykonywane
             */
            
            // var_dump($this);
            
            foreach ($this->_routes as $route) {
                
                // print 'as';
                // var_dump ( $route );
                $matches = $route->matches($url);
                
                // var_dump($route->getController());
                // var_dump($matches);
                
                if ($matches) {
                    
                    // var_dump($matches);
                    // var_dump($route);
                    $controller = $route->getController();
                    $action = $route->getAction();
                    $parameters = $route->getParameters();
                    // $table = $route->getTable();
                    $this->_pass($controller, $action, $parameters, $table);
                    return;
                }
            }
            
            $this->_pass($controller, $action, $parameters, $table);
        }
    }
}