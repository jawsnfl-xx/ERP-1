<?php
namespace Plugins\Quality_management
{

    /**
     */
    use Framework\Registry as Registry;
    use Plugins\Quality_management as Quality_management;
    use Plugins\Product_technology as Product_technology;
    use Plugins\Product_technology\Product as Product;

    /**
     *
     * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     * @copyright Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
     *
     */
    class Production_quality_management extends Quality_management
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

        /**
         *
         * @return unknown
         */
        public function _createListCount()
        {
            $database = Registry::get("database");
            /**
             * Wyzerowanie zmienynch
             */
            $count = NULL;

            $count = $database->_mysql->fetch_array('SELECT COUNT(`orders_id_orders`) FROM control_measurements;');
            return $count['0']['COUNT(`orders_id_orders`)'];
        }

        /**
         *
         * @return unknown
         */
        public function _createList()
        {
            $database = Registry::get("database");

            /**
             * Wyzerowanie zmiennych
             */
            $data = NULL;

            $data = $database->_mysql->fetch_array('select * from control_measurements
					left join orders ON control_measurements.orders_id_orders = orders.id_orders
        			left join products ON control_measurements.products_id_products = products.id_products
        			left join packages ON control_measurements.packages_id_packages = packages.id_packages
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
             * Wyzerowanie zmiennych
             */
            $data = NULL;

            $data = $database->_mysql->fetch_array('select * from control_measurements
					left join orders ON control_measurements.orders_id_orders = orders.id_orders
        			left join products ON control_measurements.products_id_products = products.id_products
        			left join packages ON control_measurements.packages_id_packages = packages.id_packages
					LIMIT  ' . $_limit . ' ;');
            return $data;
        }

        /**
         *
         * @param number $_pageNumber
         * @param number $_limitAtPage
         * @return unknown
         */
        public function _createSoftList($_pageNumber = 1, $_limitAtPage = 20)
        {
            $database = Registry::get("database");

            /**
             * Wyzerowanie zmienynch
             */
            $data = NULL;
            $limit_down = NULL;
            $limit_up = NULL;

            /**
             * Obliczenia
             */
            $limit_down = $_limitAtPage * ($_pageNumber - 1);
            $limit_up = $_limitAtPage;

            /**
             * PAMIĘTAJ!!!
             * limit działa przyrostowo!
             */
            $data = $database->_mysql->fetch_array('select * from control_measurements
					left join orders ON control_measurements.orders_id_orders = orders.id_orders
        			left join products ON control_measurements.products_id_products = products.id_products
      				left join packages ON control_measurements.packages_id_packages = packages.id_packages
					ORDER BY products_name ASC
                    LIMIT ' . $limit_down . ' , ' . $limit_up . ';');
            return $data;
        }

        /**
         *
         * @param unknown $_id
         * @return unknown
         */
        public function _createView($_id)
        {
            $database = Registry::get("database");
            $data = NULL;

            $data = $database->_mysql->fetch_array('select * from control_measurements
      				left join orders ON control_measurements.orders_id_orders = orders.id_orders
        			left join products ON control_measurements.products_id_products = products.id_products
      				left join packages ON control_measurements.packages_id_packages = packages.id_packages
					where id_control_measurements = ' . $_id . '
					LIMIT 1;');
            return $data[0];
        }
    }
}