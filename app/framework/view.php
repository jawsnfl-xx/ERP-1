<?php
namespace Framework
{

    use Framework\Base as Base;
    use Framework\Template as Template;
    use Framework\View\Exception as Exception;

    class View extends Base
    {

        /**
         * * @readwrite
         */
        protected $_file;

        /**
         * * @read
         */
        protected $_template;

        protected $_data = array();

        public function _getExceptionForImplementation($method)
        {
            return new Exception\Implementation("{$method} method not implemented");
        }

        public function _getExceptionForArgument()
        {
            return new Exception\Argument("Invalid argument");
        }

        public function __construct($options = array())
        {
            parent::__construct($options);
            // $this->_template = new Template(
            // array(
            // "implementation" => new Template\Implementation\Extended()
            // ));
            
            require_once 'template' . DIRECTORY_SEPARATOR . 'smarty' . DIRECTORY_SEPARATOR . 'libs' . DIRECTORY_SEPARATOR . 'Smarty.class.php';
            
            $this->_template = new \Smarty();
            // $smarty->display('index.tpl');
            // fetch
            // exit();
        }

        public function render()
        {
            $path = $this->getFile();
            $path = APP_DIR . $path;
            
            if (! file_exists($path)) {
                return "";
            }
            
            // $content = file_get_contents($path);
            // $this->_template->parse($content);
            // exit();
            return $this->_template->fetch($path);
            // return $this->_template->process($this->_data);
        }

        public function get($key, $default = "")
        {
            if (isset($this->_data[$key])) {
                return $this->_data[$key];
            }
            return $default;
        }

        protected function _set($key, $value)
        {
            if (! is_string($key) && ! is_numeric($key)) {
                throw new Exception\Data("Key must be a string or a number");
            }
            $this->_data[$key] = $value;
        }

        public function set($key, $value = null)
        {
            if (is_array($key)) {
                foreach ($key as $_key => $value) {
                    $this->_set($_key, $value);
                }
                return $this;
            }
            $this->_set($key, $value);
            return $this;
        }

        public function erase($key)
        {
            unset($this->_data[$key]);
            return $this;
        }
    }
}