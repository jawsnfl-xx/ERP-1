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
         * @return number
         */
        public function __construct($options = array())
        {
            parent::__construct($options);

            if ($options['']) {
                return 1;
            } else {
                return 0;
            }
        }

        /**
         *
         * @return number
         */
        public function _listOfControlMeasurement()
        {
            return 0;
        }

        /**
         *
         * @return number
         */
        public function _pageOfControlMeasurement()
        {
            return 0;
        }

        /**
         *
         * @return number
         */
        public function _countOfControlMeasurement()
        {
            return 0;
        }
    }
}