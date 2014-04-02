<?php
namespace Framework\Database
{

    use Framework\Database as Database;
    use Framework\Database\Exception as Exception;
    use Framework\ArrayMethods as ArrayMethods;
    // use Doctrine as Doctrine;
    // use Doctrine\ORM\Tools\Setup;
    // use Doctrine\ORM\EntityManager;
    
    /**
     *
     * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     *        
     *        
     */
    class DBAL extends Database
    {

        /**
         * @readwrite
         */
        public $_config;

        /**
         * @readwrite
         */
        protected $_connectionParams;

        /**
         * @readwrite
         */
        public $_conn;

        public function __construct()
        {
            $this->_config = new \Doctrine\DBAL\Configuration();
            
            $this->_connectionParams = array(
                'driver' => 'pdo_mysql',
                'host' => '127.0.0.1',
                'dbname' => 'test1',
                'user' => 'root',
                'password' => '',
                'charset' => 'utf8',
                'driverOptions' => array(
                    1002 => 'SET NAMES utf8'
                )
            );
            
            $driver = new \Doctrine\ORM\Mapping\Driver\YamlDriver(array(
                './database/ERP.dcm.yml'
            ));
            
            $this->_conn = \Doctrine\DBAL\DriverManager::getConnection($this->_connectionParams, $this->_config);
            
            return $this->_conn;
        }
    }
}
