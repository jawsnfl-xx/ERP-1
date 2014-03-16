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
     * @author Marcin Pyrka
     *        
     */
    class ORM extends Database
    {

        public function __construct()
        {
            // $isDevMode = TRUE;
            // $config = Doctrine\ORM\Tools\Setup::createXMLMetadataConfiguration(array(
            // '../../php/configuration/xml'
            // ), $isDevMode);
            
            // var_dump( $config);
            
            // $connectionOptions = array(
            // 'driver' => 'pdo_mysql',
            // 'host' => '127.0.0.1',
            // 'dbname' => 'test1',
            // 'user' => 'root',
            // 'password' => ''
            // );
            
            // $em = Doctrine\ORM\EntityManager::create($connectionOptions, $config);
            $config = new \Doctrine\DBAL\Configuration();
            
            $connectionParams = array(
                'driver' => 'pdo_mysql',
                'host' => '127.0.0.1',
                'dbname' => 'test1',
                'user' => 'root',
                'password' => ''
            );
            $conn = \Doctrine\DBAL\DriverManager::getConnection($connectionParams, $config);
            
            var_dump($config);
            var_dump($conn);
            
            $sql = "SELECT * FROM products";
            $stmt = $conn->query($sql);
            
            var_dump($stmt);
            
            while ($row = $stmt->fetch()) {
                var_dump($row);
            }
        }
    }
}
