<?php
namespace Module\Sales_management
{

    use Module\Sales_management as Sales_management;
    use Framework\Registry as Registry;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Orders extends Sales_management
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

        /**
         *
         * @return unknown
         */
        public function _createList()
        {
            $database = Registry::get("database");
            
            /**
             * Wyzerowanie zmienynch
             */
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM orders
                    left join orders_has_products on orders_has_products.orders_id_orders = orders.id_orders 
	                left join products on products.id_products = orders_has_products.products_id_products
                    ORDER BY ORDER BY orders_date DESC
                    LIMIT 100;');
            return $data;
        }

        /**
         *
         * @return unknown
         */
        public function _createListLimit($_limit)
        {
            $database = Registry::get("database");
            
            /**
             * Wyzerowanie zmienynch
             */
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM orders
                    left join orders_has_products on orders_has_products.orders_id_orders = orders.id_orders 
	                left join products on products.id_products = orders_has_products.products_id_products
                    ORDER BY ORDER BY orders_date DESC
                    LIMIT ' . $_limit . ' ;');
            return $data;
        }
    }
}