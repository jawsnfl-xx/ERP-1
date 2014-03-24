<?php
namespace Framework\Request
{

    use Framework\Base as Base;
    use Framework\Request\Exception as Exception;

    /**
     *
     * @author Marcin Pyrka
     *
     */
    class Response extends Base
    {

        /**
         *
         * @var unknown
         */
        protected $_response;

        /**
         * * @read
         */
        protected $_body = null;

        /**
         * * @read
         */
        protected $_headers = array();

        /**
         * (non-PHPdoc)
         *
         * @see \Framework\Base::_getExceptionForImplementation()
         */
        protected function _getExceptionForImplementation($method)
        {
            return new Exception\Implementation("{$method} not implemented");
        }

        /**
         *
         * @return \Framework\Request\Exception\Argument
         */
        protected function _getExceptionForArgument()
        {
            return new Exception\Argument("Invalid argument");
        }

        /**
         *
         * @param unknown $options
         */
        function __construct($options = array())
        {
            if (! empty($options["response"])) {
                $response = $this->_response = $options["response"];
                unset($options["response"]);
            }
            parent::__construct($options);
            $pattern = '#HTTP/\d\.\d.*?$.*?\r\n\r\n#ims';
            preg_match_all($pattern, $response, $matches);
            $headers = array_pop($matches[0]);
            $headers = explode("\r\n", str_replace("\r\n\r\n", "", $headers));
            $this->_body = str_replace($headers, "", $response);
            $version = array_shift($headers);
            preg_match('#HTTP/(\d\.\d)\s(\d\d\d)\s(.*)#', $version, $matches);
            $this->_headers["Http-Version"] = $matches[1];
            $this->_headers["Status-Code"] = $matches[2];
            $this->_headers["Status"] = $matches[2] . " " . $matches[3];
            foreach ($headers as $header) {
                preg_match('#(.*?)\:\s(.*)#', $header, $matches);
                $this->_headers[$matches[1]] = $matches[2];
            }
        }

        /**
         */
        function __toString()
        {
            return $this->getBody();
        }

        /**
         *
         * @param unknown $tree
         * @param unknown $content
         * @return string
         */
        protected function _partial($tree, $content)
        {
            $address = trim($tree["raw"], " /");
            if (StringMethods::indexOf($address, "http") != 0) {
                $host = RequestMethods::server("HTTP_HOST");
                $address = "http://{$host}/{$address}";
            }
            $request = new Request();
            $response = addslashes(trim($request->get($address)));
            return "\$_text[] =  \"{$response}\";";
        }

        /**
         *
         * @param unknown $tree
         * @return NULL string
         */
        protected function _getKey($tree)
        {
            if (empty($tree["arguments"]["key"])) {
                return null;
            }
            return trim($tree["arguments"]["key"]);
        }

        /**
         *
         * @param unknown $key
         * @param unknown $value
         */
        protected function _setValue($key, $value)
        {
            if (! empty($key)) {
                $default = $this->getDefaultKey();
                $data = Registry::get($default, array());
                $data[$key] = $value;
                Registry::set($default, $data);
            }
        }

        /**
         *
         * @param unknown $key
         * @return unknown string
         */
        protected function _getValue($key)
        {
            $data = Registry::get($this->getDefaultKey());
            if (isset($data[$key])) {
                return $data[$key];
            }
            return "";
        }

        /**
         *
         * @param unknown $key
         * @param unknown $value
         */
        public function set($key, $value)
        {
            if (StringMethods::indexOf($value, "\$_text") > 1) {
                $first = StringMethods::indexOf($value, "\"");
                $last = StringMethods::lastIndexOf($value, "\"");
                $value = stripslashes(substr($value, $first + 1, ($last - $first) - 1));
            }
            if (is_array($key)) {
                $key = $this->_getKey($key);
            }
            $this->_setValue($key, $value);
        }

        /**
         *
         * @param unknown $key
         * @param unknown $value
         */
        public function append($key, $value)
        {
            if (is_array($key)) {
                $key = $this->_getKey($key);
            }
            $previous = $this->_getValue($key);
            $this->set($key, $previous . $value);
        }

        /**
         *
         * @param unknown $key
         * @param unknown $value
         */
        public function prepend($key, $value)
        {
            if (is_array($key)) {
                $key = $this->_getKey($key);
            }
            $previous = $this->_getValue($key);
            $this->set($key, $value . $previous);
        }

        /**
         *
         * @param unknown $tree
         * @param unknown $content
         * @return string
         */
        public function yield($tree, $content)
        {
            $key = trim($tree["raw"]);
            $value = addslashes($this->_getValue($key));
            return "\$_text[] =  \"{$value}\";";
        }
    }
}