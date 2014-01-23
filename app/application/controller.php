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
         * @readwrite
         */
        public $database;

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
            $this->database = new \Framework\Database();
            
            $this->database->_options = array(
                "options" => array(
                    "host" => "localhost",
                    "username" => "root",
                    "password" => "",
                    "schema" => "test",
                    "port" => "3306"
                )
            );
            
            $this->database->initialize();
            
            // Przykład stosowania połączenia z bazą danych MySQL
            // $data = $database->_mysql->fetch_array('SHOW TABLES');
        }

        /**
         * @once
         * @protected
         */
        public function init()
        {
            print 'init';
        }
    }
}
