<?php
namespace Application
{

    /**
     *
     * @author Marcin
     *        
     */
    class Controller extends \Framework\Controller
    {

        /**
         * @readwrite
         */
        public $database;

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            /**
             */
            parent::__construct($options);
        }

        /**
         * @once
         * @protected
         */
        public function init()
        {
            print 'init';
        }
    }
}
