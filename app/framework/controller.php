<?php
namespace Framework
{
    use Framework\Base as Base;
    use Framework\View as View;
    use Framework\Registry as Registry;
    use Framework\Template as Template;
    use Framework\Controller\Exception as Exception;

    class Controller extends Base
    {

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
        protected $_defaultPath = "application\\view";

        /**
         * * @readwrite
         */
        protected $_defaultLayout = "layouts\\standard";

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
        protected function _getExceptionForImplementation ($method)
        {
            return new Exception\Implementation(
                    "{$method} method not implemented");
        }

        /**
         *
         * @return \Framework\Controller\Exception\Argument
         */
        protected function _getExceptionForArgument ()
        {
            return new Exception\Argument("Invalid argument");
        }

        /**
         *
         * @throws View\Exception\Renderer
         */
        public function render ()
        {
            // print 'public function render() <br />';
            $defaultContentType = $this->_defaultContentType;
            $results = null;
            // $doAction = $this->_willRenderActionView && $this->_actionView;
            // $doLayout = $this->_willRenderLayoutView && $this->_layoutView;
            $doAction = $this->_willRenderActionView && $this->_actionView;
            $doLayout = $this->_willRenderLayoutView && $this->_layoutView;
            
            // var_dump($this);
            // var_dump($doAction);
            // var_dump($doLayout);
            
            // var_dump($this->_actionView);
            try {
                if ($doAction) {
                    // var_dump($this->_actionView);
                    $view = $this->_actionView;
                    $results = $view->render();
                    // var_dump($results);
                    header("Content-type: {$defaultContentType}");
                    echo $results;
                    // print 'asd1';
                }
                if ($doLayout) {
                    $view = $this->_layoutView;
                    $view->set("template", $results);
                    $results = $view->render();
                    header("Content-type: {$defaultContentType}");
                    echo $results;
                    // print 'asd2';
                } else 
                    if ($doAction) {
                        header("Content-type: {$defaultContentType}");
                        echo $results;
                        $this->_willRenderLayoutView = FALSE;
                        $this->_willRenderActionView = FALSE;
                        // print 'asd3';
                    }
                // var_dump($this);
            } catch (\Exception $e) {
                // print 'gówno';
                throw new View\Exception\Renderer(
                        "Invalid layout/template syntax");
            }
        }

        /**
         *
         * @param unknown $options            
         */
        public function __construct ($options = array())
        {
            parent::__construct($options);
            // print 'asdasd1';
            
            // $dupa = $this->getWillRenderLayoutView();
            // var_dump($dupa);
            
            if ($this->getWillRenderLayoutView()) {
                $defaultPath = $this->getDefaultPath();
                $defaultLayout = $this->getDefaultLayout();
                $defaultExtension = $this->getDefaultExtension();
                $view = new View(
                        array(
                                "file" => "\\" . $defaultPath . "\\" .
                                         $defaultLayout . "." . $defaultExtension
                        ));
                // var_dump($view);
                $this->_layoutView = $view;
            }
            if ($this->getWillRenderActionView()) {
                $router = new \Framework\Router(
                        array(
                                // "url" => "home/index",
                                "url" => isset($_GET["url"]) ? $_GET["url"] : "home/index",
                                "extension" => isset($_GET["url"]) ? $_GET["url"] : "html"
                        ));
                $router->dispatch();
                // var_dump($router);
                $controller = $router->getController();
                $action = $router->getAction();
                $view = new View(
                        array(
                                "file" => "\\" . $defaultPath . "\\" .
                                         $controller . "\\" . $action . "." .
                                         $defaultExtension
                        ));
                $this->setActionView($view);
            }
            // print 'qwe';
            
            // var_dump($this);
        }

        /**
         */
        public function __destruct ()
        {
            // print 'public function __destruct() <br />';
            $this->render();
            // print 'asd';
        }
    }
}