<?php

/**
 *
 * @author Marcin
 *
 */
namespace Plugins\Quality_management
{

    use Plugins\Quality_management as Quality_management;

    /**
     *
     * @author Marcin Pyrka
     *        
     * @name QualityAssurance
     * @namespace Quality_management
     *           
     *            Zapewnienie jakości
     *           
     */
    class QualityAssurance extends Quality_management
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