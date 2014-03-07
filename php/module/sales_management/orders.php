<?php
namespace Module\Sales_management
{

    use Module\Sales_management as Sales_management;
    use Framework\Registry as Registry;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Orders extends Sales_management
    {

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            /**
             */
            parent::__construct($options);
        }

        /**
         *
         * @return unknown
         */
        public function _createList()
        {
            $database = Registry::get("database");
            
            /**
             * Wyzerowanie zmienynch
             */
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM orders LIMIT 100;');
            return $data;
        }

        /**
         *
         * @return unknown
         */
        public function _createListLimit($_limit)
        {
            $database = Registry::get("database");
            
            /**
             * Wyzerowanie zmienynch
             */
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM orders LIMIT ' . $_limit . ' ;');
            return $data;
        }
    }
}