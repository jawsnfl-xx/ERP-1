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

        /**
         */
        public function initialize()
        {

            /**
             * Inicjowanie połączenia z bazą MySQL przez MySQLi
             */
            $this->_mysql = new Database\Mysql();
            $this->_mysql->connect($this->_options);

            /**
             * Inicjowanie połączenia z bazą MySQL przez DBAL
             */
            $this->_orm = new Database\ORM($this->_options);
        }
    }
}
