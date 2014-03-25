<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Plugins\Quality_management\QualityControl
{

    use Plugins\Quality_management\QualityControl as QualityControl;
    use Plugins\Product_technology\Product as Product;

    /**
     *
     * @author Marcin Pyrka
     *        
     * @name ControlMeasurements
     * @namespace QualityInspection
     *           
     * @uses QualityInspection
     * @uses Product
     *      
     *      
     */
    class Analystics extends QualityControl
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
    }
}