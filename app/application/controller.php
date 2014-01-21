<?php
namespace Application
{

    /**
     *
     * @author Marcin
     *        
     */
    class Controller extends \Framework\Controller
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
            
            /**
             * @TODO:
             * - nawiązać połączenie z bazą danych;
             */
            $database = new \Framework\Database();
            
            $database->_options = array(
                "options" => array(
                    "host" => "localhost",
                    "username" => "root",
                    "password" => "",
                    "schema" => "test",
                    "port" => "3306"
                )
            );
            
            $database->initialize();
            // Przykład stosowania połączenia z bazą danych MySQL
            $data = $database->_mysql->fetch_array('SHOW TABLES');
        }
    }
}
