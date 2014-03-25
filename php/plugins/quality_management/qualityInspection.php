<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Plugins\Quality_management
{

    use Plugins\Quality_management as Quality_management;

    /**
     *
     * @author Marcin Pyrka
     *        
     * @name QualityInspection
     * @namespace Quality_management
     *           
     *            Inspekcja jakości
     *           
     */
    class QualityInspection extends Quality_management
    {

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
    }
}