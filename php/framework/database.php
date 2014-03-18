<?php
namespace Framework
{

    use Framework\Base as Base;
    use Framework\Database as Database;
    use Framework\Database\Exception as Exception;
    use Framework\Database\ORM;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Database extends Base
    {

        /**
         *
         * @var unknown
         */
        public $_options;

        /**
         *
         * @var unknown
         */
        public $_mysql;

        /**
         *
         * @var unknown
         */
        public $_orm;
        
        // /**
        // * (non-PHPdoc)
        // *
        // * @see \Framework\Base::_getExceptionForImplementation()
        // */
        // protected function _getExceptionForImplementation($method) {
        // return new Exception\Implementation ( "{$method} method not
        // implemented" );
        // }
        
        /**
         */
        public function initialize()
        {
            
            /**
             */
            $this->_mysql = new Database\Mysql();
            $this->_mysql->connect($this->_options);
            
            // var_dump($this->_mysql);
            
            // var_dump( $this->_mysql );
            // $this->_mysql->query();
            // return $dupa;
            
            /**
             */
            
            // $this->_pdo = new Database\PDO();
            // $this->_pdo->connect($this->_options);
            
            // $stmt = $this->_pdo->query('SELECT * FROM products
            // left join units on units.id_units = products.units_id_units
            // left join category_product on category_product.product_id_product = products.id_products
            // left join category on category.id_category = category_product.category_id_category
            // LIMIT 100;');
            
            // var_dump($stmt);
            
            /**
             */
            $this->_orm = new Database\ORM($this->_options);
            
            // var_dump($this);
        }
    }
}
