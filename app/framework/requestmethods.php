<?php
namespace Framework
{

    /**
     *
     * @author Marcin
     *        
     */
    class RequestMethods
    {

        /**
         */
        private function __construct()
        {
            // do nothing
        }

        /**
         */
        private function __clone()
        {
            // do nothing
        }

        /**
         *
         * @param unknown $key            
         * @param string $default            
         * @return unknown string
         */
        public static function get($key, $default = "")
        {
            if (! empty($_GET[$key])) {
                return $_GET[$key];
            }
            return $default;
        }

        /**
         * @NOTE
         * Kasia <3 na to patrzyła.
         *
         * @param unknown $key            
         * @param string $default            
         * @return unknown string
         */
        public static function post($key, $default = "")
        {
            if (! empty($_POST[$key])) {
                return $_POST[$key];
            }
            return $default;
        }

        /**
         *
         * @param unknown $key            
         * @param string $default            
         * @return unknown string
         */
        public static function server($key, $default = "")
        {
            if (! empty($_SERVER[$key])) {
                return $_SERVER[$key];
            }
            return $default;
        }
    }
}