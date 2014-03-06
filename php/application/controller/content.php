<?php

/**
 *
 * @author Marcin
 *
 */
namespace Application\Controller
{

    use Application\Controller as Controller;
    use Framework\Registry as Registry;
    use Framework\RequestMethods as RequestMethods;
    use Framework\Session\Driver\Server;
    use Framework\Request;

    /**
     *
     * @author Marcin
     *         @NOTE
     *         W ten sposób można zapisać podstawę działania kontrolerów.
     *         Za pomocą wpisów w komentarzach przez deklaracją
     *         można inicjować kolejność kroków i wymagać dla podnoszenia sie funkcji
     *        
     */
    class Content extends Controller
    {

        /**
         * @readwrite
         */
        protected $_parameters;

        /**
         * @readwrite
         */
        protected $_table = array();

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options)
        {
            /**
             */
            $this->_parameters = $options['parameters'];
            // $database = new Framework\Database();
            // $database->initialize();
        }

        public function givmetable()
        {
            // print 'czosnek';
            return ($this->_table);
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::init()
         */
        public function init()
        {
            parent::init();
        }

        /**
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::authenticate()
         */
        public function authenticate()
        {
            parent::authenticate();
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::notify()
         */
        public function notify()
        {
            parent::notify();
        }

        /**
         * @before init,
         * @after notify
         */
        public function index()
        {}

        /**
         * @before init,
         * @after notify
         */
        public function help()
        {}
    }
}