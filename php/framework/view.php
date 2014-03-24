<?php
namespace Framework
{

    use Framework\Base as Base;
    use Framework\Template as Template;
    use Framework\View\Exception as Exception;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class View extends Base
    {

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
        protected $_data = array();

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
         * @return \Framework\View\Exception\Argument
         */
        public function _getExceptionForArgument()
        {
            return new Exception\Argument("Invalid argument");
        }

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            parent::__construct($options);
            
            require_once '..' . DIRECTORY_SEPARATOR . 'php' . DIRECTORY_SEPARATOR . 'librays' . DIRECTORY_SEPARATOR . 'smarty-master' . DIRECTORY_SEPARATOR . 'Smarty.class.php';
            
            $this->_template = new \Smarty();
            
            $this->_template->setTemplateDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_tp');
            $this->_template->setCompileDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_cp');
            $this->_template->setCacheDir(APP_DIR . DIRECTORY_SEPARATOR . 'cache_cd');
            
            $this->_template->assign('parameters', $options['parameters']);
            $this->_template->assign('table', $options['table']);
        }

        /**
         *
         * @return string
         */
        public function render()
        {
            $path = $this->getFile();
            $path = APP_DIR . $path;
            
            if (! file_exists($path)) {
                
                return "";
                // return $path;
            }
            
            return $this->_template->fetch($path);
        }

        /**
         *
         * @param unknown $key            
         * @param string $default            
         * @return \Framework\unknown string
         */
        public function get($key, $default = "")
        {
            if (isset($this->_data[$key])) {
                return $this->_data[$key];
            }
            return $default;
        }

        /**
         *
         * @param unknown $key            
         * @param unknown $value            
         * @throws Exception\Data
         */
        protected function _set($key, $value)
        {
            if (! is_string($key) && ! is_numeric($key)) {
                throw new Exception\Data("Key must be a string or a number");
            }
            $this->_data[$key] = $value;
        }

        /**
         *
         * @param unknown $key            
         * @param string $value            
         * @return \Framework\View
         */
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

        /**
         *
         * @param unknown $key            
         * @return \Framework\View
         */
        public function erase($key)
        {
            unset($this->_data[$key]);
            return $this;
        }
    }
}