<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Plugins\Quality_management\QualityInspection
{

    use Plugins\Quality_management\QualityInspection as QualityInspection;

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
         * @readwrite
         */
        public $_id;

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

        public function _addControlMeasurement($param)
        {}

        public function _statusControlMeasurement($param)
        {}
    }
}