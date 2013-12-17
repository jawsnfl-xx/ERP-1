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
         *
         * @param unknown $options            
         */
        public function __construct ($options = array())
        {
            parent::__construct($options);
            // $database = \Framework\Registry::get("database");
            // $database->connect();
            // print 'namespace Shared -> class Controller -> public function
            // __construct<br />';
        }
    }
}
