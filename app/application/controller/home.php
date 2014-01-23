<?php
namespace Application\Controller
{

    use Application\Controller as Controller;
    use Framework\Registry as Registry;
    use Framework\RequestMethods as RequestMethods;

    /**
     *
     * @author Marcin
     *        
     */
    class Home extends Controller
    {

        /**
         * @readwrite
         */
        protected $_parameters;

        /**
         * @readwrite
         */
        protected $_options;

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            /**
             */
            $this->_parameters = $options['parameters'];
        }

        /**
         * @once
         * @protected
         *
         *
         * Wykonywana jest inicjalizacja wszystkiego co może być potrzebne.
         *
         * @TODO
         * Włącznie z przekazaniem dalszych danych dla Smatry
         */
        public function init()
        {
            // parent::init();
            
            // var_dump($this);
            // var_dump(parent::$database);
            // $data = $database->_mysql->fetch_array('SHOW TABLES');
        }

        /**
         * @protected
         *
         *
         * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
         *
         * @TODO
         * Budowa oddzielnej klasy autentykacji.
         * W tym miejscy jedynie jej uruchmienie.
         */
        public function authenticate()
        {
            // parent::authenticate();
        }

        /**
         * @once
         * @protected
         */
        public function notify()
        {
            // parent::notify();
        }

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function index()
        {}

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         * Podstrony możliwe dla settings:
         * - access permissions
         * - properties
         * - system settings
         */
        public function settings()
        {
            /**
             */
            if ($this->_parameters[0] === 'access_permissions') {
                // print 'access permissions';
            }
            
            /**
             */
            if ($this->_parameters[0] === 'properties') {
                // print 'properties';
            }
            
            /**
             */
            if ($this->_parameters[0] === 'system settings') {
                // print 'system_settings';
            }
        }

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         * Podstrony możliwe dla settings:
         * - access permissions
         * - properties
         * - system settings
         */
        public function quality_management()
        {
            /**
             */
            if ($this->_parameters[0] === 'review') {
                // print 'access permissions';
            }
            
            /**
             */
            if ($this->_parameters[0] === 'add') {
                // print 'properties';
            }
        }
    }
}