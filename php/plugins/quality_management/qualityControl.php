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
     * @name QualityControl
     * @namespace Quality_management
     *
     *            Sterowanie jakością
     *
     */
    class QualityControl extends Quality_management
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