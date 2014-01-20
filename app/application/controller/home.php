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
         * @read
         */
        protected $_parameters;

        public function __construct($options)
        {
            $this->_parameters = $options['parameters'];
        }

        /**
         * @once
         * @protected
         */
        /**
         * Wykonywana jest inicjalizacja wszystkiego co może być potrzebne.
         *
         * @TODO
         * Włącznie z przekazaniem dalszych danych dla Smatry
         */
        public function init()
        {}

        /**
         * @protected
         */
        /**
         * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
         *
         * @TODO
         * Budowa oddzielnej klasy autentykacji.
         * W tym miejscy jedynie jej uruchmienie.
         */
        public function authenticate()
        {}

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function index()
        {
            $data = "hello world!<br />";
        }

        public function login()
        {
            
            // print 'nic nie rtoib';
        }

        public function begin()
        {
            
            // print 'nic nie rtoib';
        }

        public function second()
        {
            
            // print 'nic nie rtoib';
        }
    }
}