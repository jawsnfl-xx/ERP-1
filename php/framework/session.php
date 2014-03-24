<?php
namespace Framework
{

    use Framework\Base as Base;
    use Framework\Registry as Registry;
    use Framework\Session\Exception as Exception;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Session extends Base
    {

        /**
         * @readwrite
         */
        protected $_type;

        /**
         * @readwrite
         */
        protected $_options;

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
         * @return \Framework\Session\Exception\Argument
         */
        protected function _getExceptionForArgument()
        {
            return new Exception\Argument("Invalid argument");
        }

        /**
         *
         * @todo Sprawdzić działanie
         *      
         * @throws Exception\Argument
         * @return \Framework\Session\Driver\Server
         */
        public function initialize()
        {
            $type = $this->getType();
            if (empty($type)) {
                // $configuration = Registry::get("configuration");
                // if ($configuration) {
                // $configuration = $configuration->initialize();
                // $parsed = $configuration->parse("configuration/session");
                // if (! empty($parsed->session->default) && ! empty($parsed->session->default->type)) {
                // $type = $parsed->session->default->type;
                // unset($parsed->session->default->type);
                // $this->__construct(array(
                // "type" => $type,
                // "options" => (array) $parsed->session->default
                // ));
                // }
                // }
                
                /**
                 * tymczasowe
                 */
                $type = 'server';
                // var_dump($this);
            }
            // if (empty($type)) {
            // print 'jest puste';
            // throw new Exception\Argument("Invalid type");
            // }
            switch ($type) {
                case "server":
                    {
                        return new Session\Driver\Server($this->getOptions());
                        break;
                    }
                default:
                    {
                        throw new Exception\Argument("Invalid type");
                        break;
                    }
            }
        }
    }
}