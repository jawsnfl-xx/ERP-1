<?php
namespace Plugins\Product_technology
{

    use Plugins\Product_technology as Product_technology;
    use Framework\Registry as Registry;

    /**
     *
     * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     * @copyright Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     *           
     */
    class Technology extends Product_technology
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