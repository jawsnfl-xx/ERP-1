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
        protected $_defaultExtension = "tpl";

        /**
         * * @readwrite
         */
        protected $_defaultContentType = "text/html";

        /**
         * (non-PHPdoc)
         *
         * @see \Framework\Base::_getExceptionForImplementation()
         */
        protected function _getExceptionForImplementation($method)
        {
            return new Exception\Implementation("{$method} method not implemented");
        }

        /**
         *
         * @return \Framework\Controller\Exception\Argument
         */
        protected function _getExceptionForArgument()
        {
            return new Exception\Argument("Invalid argument");
        }

        /**
         *
         * @throws View\Exception\Renderer
         */
        public function render()
        {
            $defaultContentType = $this->_defaultContentType;
            $results = null;
            $doAction = $this->_willRenderActionView && $this->_actionView;
            $doLayout = $this->_willRenderLayoutView && $this->_layoutView;
            try {
                if ($doAction) {
                    $view = $this->_actionView;
                    $results = $view->render();
                    header("Content-type: {$defaultContentType}");
                    echo $results;
                }
                if ($doLayout) {
                    $view = $this->_layoutView;
                    $view->set("template", $results);
                    $results = $view->render();
                    header("Content-type: {$defaultContentType}");
                    echo $results;
                } else {
                    header("Content-type: {$defaultContentType}");
                    echo $results;
                    $this->_willRenderLayoutView = FALSE;
                    $this->_willRenderActionView = FALSE;
                }
            } catch (\Exception $e) {
                throw new View\Exception\Renderer("Invalid layout/template syntax");
            }
        }

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            parent::__construct($options);
            
            if ($this->getWillRenderLayoutView()) {
                $defaultPath = $this->getDefaultPath();
                $defaultLayout = $this->getDefaultLayout();
                $defaultExtension = $this->getDefaultExtension();
                $view = new View(array(
                    "file" => DIRECTORY_SEPARATOR . $defaultPath . DIRECTORY_SEPARATOR . $defaultLayout . '.' . $defaultExtension
                ));
                $this->_layoutView = $view;
            }
            if ($this->getWillRenderActionView()) {
                $router = new \Framework\Router(array(
                    "url" => isset($_GET["url"]) ? $_GET["url"] : "home/index",
                    "extension" => isset($_GET["url"]) ? $_GET["url"] : "html"
                ));
                $router->dispatch();
                $controller = $router->getController();
                $action = $router->getAction();
                $view = new View(array(
                    "file" => DIRECTORY_SEPARATOR . $defaultPath . DIRECTORY_SEPARATOR . $controller . DIRECTORY_SEPARATOR . $action . '.' . $defaultExtension
                ));
                $this->setActionView($view);
            }
        }

        /**
         */
        public function __destruct()
        {
            // print 'public function __destruct() <br />';
            $this->render();
            // print 'asd';
        }
    }
}