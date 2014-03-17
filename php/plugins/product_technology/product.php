<?php
namespace Plugins\Product_technology
{

    use Plugins\Product_technology as Product_technology;
    use Framework\Registry as Registry;

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

        /**
         *
         * @return unknown
         */
        public function _createList()
        {
            $database = Registry::get("database");
            
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM products 
                	left join units on units.id_units = products.units_id_units
                	left join category_product on category_product.product_id_product = products.id_products
                	left join category on category.id_category = category_product.category_id_category
                    LIMIT 100;');
            return $data;
        }

        /**
         *
         * @return unknown
         */
        public function _createListSearch($_keywords)
        {
            $database = Registry::get("database");
            $data = NULL;
            
            $data = $database->_mysql->fetch_array('SELECT * FROM products
                	left join units on units.id_units = products.units_id_units
                	left join category_product on category_product.product_id_product = products.id_products
                	left join category on category.id_category = category_product.category_id_category
                    WHERE `products_name` LIKE \'%' . $_keywords . '%\' LIMIT 100;');
            return $data;
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
            
            $count = $database->_mysql->fetch_array('SELECT COUNT(`id_products`) FROM products;');
            return $count['0']['COUNT(`id_products`)'];
        }

        /**
         * Zwraca tabelę assoc z pojedyńczą stroną z listy produktów
         *
         * SELECT COUNT(`id_products`) FROM table_name;
         * SELECT * FROM test.products LIMIT 100;
         */
        /**
         *
         * @param number $_pageNumber            
         * @param number $_limitAtPage            
         * @return unknown
         */
        public function _createSoftList($_pageNumber = 1, $_limitAtPage = 20)
        {
            $database = Registry::get("database");
            
            $queryBuilder = $database->_orm->_conn->createQueryBuilder();
            
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
            
            $queryBuilder->select('*')
                ->from('products', 'products')
                ->leftJoin("products", "units", "units", "units.id_units = products.units_id_units")
                ->leftJoin("products", "category_product", "category_product", "category_product.product_id_product = products.id_products")
                ->leftJoin("products", "category", "category", "category.id_category = category_product.category_id_category")
                ->orderBy('products.products_name', 'ASC')
                ->setFirstResult($limit_down)
                ->setMaxResults($limit_up);
            
            $stmt = $database->_orm->_conn->query($queryBuilder);
            // var_dump($stmt);
            
            $data = array();
            
            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }
            
            // $data = $database->_mysql->fetch_array('SELECT * FROM products
            // left join units on units.id_units = products.units_id_units
            // left join category_product on category_product.product_id_product = products.id_products
            // left join category on category.id_category = category_product.category_id_category
            // ORDER BY `products_name` ASC LIMIT ' . $limit_down . ' , ' . $limit_up . ';');
            
            return $data;
        }

        /**
         *
         * @return unknown
         */
        public function _createView($_id)
        {
            $database = Registry::get("database");
            
            $queryBuilder = $database->_orm->_conn->createQueryBuilder();
            
            $queryBuilder->select('*')
                ->from('products', 'products')
                ->leftJoin("products", "units", "units", "units.id_units = products.units_id_units")
                ->leftJoin("products", "category_product", "category_product", "category_product.product_id_product = products.id_products")
                ->leftJoin("products", "category", "category", "category.id_category = category_product.category_id_category")
                ->where($queryBuilder->expr()
                ->eq("products.id_products", $_id))
                ->setMaxResults(1);
            
            $stmt = $database->_orm->_conn->query($queryBuilder);
            
            $data = array();
            
            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }
            
            return $data;
        }
    }
}