<?php
/**
 *
 */
namespace Application\Controller
{

    use Application\Controller as Controller;
    use Framework\Registry as Registry;
    use Framework\RequestMethods as RequestMethods;
    use Framework\View;
    use Framework\Request;

    /**
     *
     * @author Marcin Pyrka
     *
     */
    class Module extends Controller
    {

        /**
         * @readwrite
         */
        protected $_parameters;

        /**
         * @readwrite
         */
        protected $_table = array();

        /**
         * @readwrite
         */
        protected $_options;

        /**
         *
         * @param unknown $options
         */
        public function __construct($options = array())
        {
            $this->_parameters = $options['parameters'];
        }

        /**
         *
         * @return multitype:
         */
        public function givmetable()
        {
            return ($this->_table);
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::init()
         */
        public function init()
        {
            parent::init();
        }

        /**
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::authenticate()
         */
        public function authenticate()
        {
            parent::authenticate();
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::notify()
         */
        public function notify()
        {
            parent::notify();
        }

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function index()
        {}

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         */
        public function product_technology()
        {
            $product = new \Plugins\Product_technology\Product();
            $orders = new \Plugins\Sales_management\Orders();
            $packages = new \Plugins\Inventory_management\Packages();
            $quality_management = new \Plugins\Quality_management\Production_quality_management();

            if ($this->_parameters[0] === 'product') {

                include_once 'module/product/product.php';
            } elseif ($this->_parameters[0] === 'technology') {

                include_once 'module/technology/technology.php';
            }
        }

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         */
        public function quality_management()
        {
            $quality_management = new \Plugins\Quality_management\Production_quality_management();
            // $controlSheet = new \Plugins\Quality_management\QualityInspection\ControlMeasurements\ControlSheet();
            if ($this->_parameters[0] === 'review') {

                include_once 'module/quality_management/review/review.php';
            } elseif ($this->_parameters[0] === 'view') {
                include_once 'module/quality_management/view/view.php';
            }

            elseif ($this->_parameters[0] === 'add') {

                include_once 'module/quality_management/add/add.php';
            } else {}
        }
    }
}