<?php
namespace Framework
{

    /**
     *
     * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     * @copyright Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     *           
     */
    class Registry
    {

        /**
         *
         * @var unknown
         */
        private static $_instances = array();

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
         * @return \Framework\unknown string
         */
        public static function get($key, $default = null)
        {
            if (isset(self::$_instances[$key])) {
                return self::$_instances[$key];
            }
            return $default;
        }

        /**
         *
         * @param unknown $key            
         * @param string $instance            
         */
        public static function set($key, $instance = null)
        {
            self::$_instances[$key] = $instance;
        }

        /**
         *
         * @param unknown $key            
         */
        public static function erase($key)
        {
            unset(self::$_instances[$key]);
        }
    }
}