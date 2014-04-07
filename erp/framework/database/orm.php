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
    class ORM extends Database
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
            // $config = new \Doctrine\ORM\Configuration();
            
            // $connectionParams = array(
            // 'driver' => 'pdo_mysql',
            // 'host' => '127.0.0.1',
            // 'dbname' => 'test1',
            // 'user' => 'root',
            // 'password' => '',
            // 'charset' => 'utf8',
            // 'driverOptions' => array(
            // 1002 => 'SET NAMES utf8'
            // )
            // );
            
            // $driver = new \Doctrine\ORM\Mapping\Driver\YamlDriver(array(
            // './database/ERP.dcm.yml'
            // ));
            
            // $config->setMetadataDriverImpl($driver);
            
            // $evm = new \Doctrine\Common\EventManager();
            
            // // var_dump($driver);
            // // var_dump($evm);
            // // var_dump($conn);
            // // var_dump($config);
            
            // // try {
            // // // $entityManager = \Doctrine\ORM\EntityManager::create($connectionParams, $config, $evm);
            // // // $entityManager->getConfiguration()->setMetadataDriverImpl($driverImpl);
            // // // $entityManager = \Doctrine\ORM\EntityManager::create($conn, $config);
            // // } catch (Exception $e) {
            // // var_dump($e);
            // // }
            
            // return $this->_conn;
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
