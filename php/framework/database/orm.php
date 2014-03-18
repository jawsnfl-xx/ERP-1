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
                'password' => ''
            );
            $this->_conn = \Doctrine\DBAL\DriverManager::getConnection($this->_connectionParams, $this->_config);
            
            // var_dump($config);
            // var_dump($conn);
            
            // $queryBuilder = $conn->createQueryBuilder();
            
            // $queryBuilder->select('*')
            // ->from('products', 'products')
            // ->setFirstResult(5)
            // ->setMaxResults(5);
            
            // var_dump($queryBuilder);
            
            // $stmt = $conn->query($queryBuilder);
            
            // var_dump($stmt);
            // while ($row = $stmt->fetch()) {
            // var_dump($row);
            // }
            
            // $sql = "SELECT * FROM products";
            // $stmt = $conn->query($sql);
            
            // var_dump($stmt);
            
            // while ($row = $stmt->fetch()) {
            // var_dump($row);
            // }
            
            return $this->_conn;
        }
    }
}
