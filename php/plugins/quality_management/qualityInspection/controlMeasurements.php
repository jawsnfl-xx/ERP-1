<?php

/**
 *
 * @author Marcin
 *
 */
namespace Plugins\Quality_management\QualityInspection
{

    use Quality_management as Quality_management;
    use Quality_management\QualityInspection as QualityInspection;

    /**
     *
     * @author Marcin Pyrka
     *        
     * @name ControlMeasurements
     * @namespace QualityInspection
     *           
     * @uses Quality_management
     * @uses QualityInspection
     *      
     *      
     */
    class ControlMeasurements extends QualityInspection
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