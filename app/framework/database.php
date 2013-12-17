<?php
namespace Framework
{
    use Framework\Base as Base;
    use Framework\Database as Database;
    use Framework\Database\Exception as Exception;

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
        public function initialize ()
        {
            $this->_mysql = new Database\Mysql();
            $this->_mysql->connect($this->_options);
            
            // var_dump( $this->_mysql );
            // $this->_mysql->query();
            // return $dupa;
            
            // print 'public function initialize() {';
        }
    }
}
