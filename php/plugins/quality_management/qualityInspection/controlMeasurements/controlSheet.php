<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Plugins\Quality_management\QualityInspection\ControlMeasurements
{

    use Plugins\Quality_management\QualityInspection\ControlMeasurements as ControlMeasurements;

    /**
     *
     * @author Marcin Pyrka
     *        
     * @name ControlSheet
     * @namespace Plugins\Quality_management\QualityInspection\ControlMeasurements
     *           
     *           
     */
    class ControlSheet extends ControlMeasurements
    {

        /**
         * @readwrite
         */
        public $_id;

        /**
         * @readwrite
         */
        public $_id_product;

        /**
         * @readwrite
         */
        public $_complited_progress;

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