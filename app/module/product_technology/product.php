<?php
namespace Module
{

    use Module\Product_technology as Product_technology;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Product extends Product_technology
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