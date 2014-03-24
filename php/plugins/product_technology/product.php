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
         */
        public function _createListCount()
        {
            $database = Registry::get("database");

            $data = array();

            $sql = "SELECT COUNT(`id_products`) FROM products";
            $stmt = $database->_orm->_conn->query($sql);

            // var_dump($stmt);

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data['0']['COUNT(`id_products`)'];
        }

        /**
         * Zwraca tabelę assoc z pojedyńczą stroną z listy produktów
         *
         * SELECT COUNT(`id_products`) FROM table_name;
         * SELECT * FROM test.products LIMIT 100;
         *
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
         * @param unknown $_id
         * @return multitype:unknown
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

        /**
         *
         * @param unknown $_name
         * @return multitype:unknown
         */
        public function _isExists($_name)
        {
            $database = Registry::get("database");

            $queryBuilder = $database->_orm->_conn->createQueryBuilder();

            $queryBuilder->select('*')
                ->from('products', 'products')
                ->where($queryBuilder->expr()
                ->eq("products.products_name", $_name))
                ->setMaxResults(1);

            $stmt = $database->_orm->_conn->query($queryBuilder);

            $data = array();

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data;
        }

        /**
         *
         * @return multitype:unknown
         */
        public function _createListUnits()
        {
            $database = Registry::get("database");

            $queryBuilder = $database->_orm->_conn->createQueryBuilder();

            $queryBuilder->select('*')
                ->from('units', 'units')
                ->setMaxResults(100);

            $stmt = $database->_orm->_conn->query($queryBuilder);

            $data = array();

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data;
        }

        /**
         *
         * @return unknown
         */
        public function _createListCategory()
        {
            $database = Registry::get("database");

            $queryBuilder = $database->_orm->_conn->createQueryBuilder();

            $queryBuilder->select('*')
                ->from('category', 'category')
                ->setMaxResults(100);

            $stmt = $database->_orm->_conn->query($queryBuilder);

            $data = array();

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data;
        }

        public function _getUnitsID($_name)
        {
            $database = Registry::get("database");

            $data = array();

            $sql = 'select id_units from units WHERE units.name = \'' . $_name . '\' LIMIT 1';
            // var_dump($sql);
            $stmt = $database->_orm->_conn->query($sql);

            // var_dump($stmt);

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data[0]['id_units'];
        }

        /**
         *
         * @param unknown $_category
         */
        public function _getCategoryID($_category)
        {
            $database = Registry::get("database");

            $data = array();

            $sql = 'select id_category from category WHERE category.category_name = \'' . $_category . '\' LIMIT 1';
            // var_dump($sql);
            $stmt = $database->_orm->_conn->query($sql);

            // var_dump($stmt);

            while ($row = $stmt->fetch()) {
                $data[] = $row;
            }

            return $data[0]['id_category'];
        }

        /**
         *
         * @param unknown $array
         */
        public function _addSingleProduct($_number, $_units, $_category)
        {
            // $database = Registry::get("database");

            // $queryBuilder = $database->_orm->_conn->createQueryBuilder();

            // $sql = 'INSERT INTO products (products_name, units_id_units) VALUES (' . rand() . ', 1)';

            // $queryBuilder->insert('products')->values(array(
            // 'products_name' => rand(),
            // 'units_id_units' => $_units
            // ));
            // var_dump($sql);
            $database = Registry::get("database");

            $_units = $this->_getUnitsID($_units);
            $_category = $this->_getCategoryID($_category);

            $data = array();
            $sql = 'INSERT INTO products (products_name, units_id_units) VALUES (\'' . $_number . '\', \'' . $_units . '\')';
            $stmt = $database->_orm->_conn->query($sql);
            $_lastID = $database->_orm->_conn->lastInsertId();

            $sql = 'INSERT INTO category_product (category_id_category, product_id_product) VALUES (' . $_category . ', \'' . $_lastID . '\')';

            // var_dump($stmt);

            // $sql = 'INSERT INTO products (products_name, units_id_units) VALUES (' . rand() . ', 1)';

            // var_dump($stmt);

            // while ($row = $stmt->fetch()) {
            // $data[] = $row;
            // }

            return $_lastID;
        }
    }
}