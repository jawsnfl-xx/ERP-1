<?php

/**
 *
 * @author Marcin
 *
 */
namespace Module\Quality_management\Production_quality_management
{

    /**
     */
    use Module\Quality_management\Production_quality_management as Production_quality_management;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Control_measurements extends Production_quality_management
    {

        /**
         * @readwrite
         */
        public $sheet;

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