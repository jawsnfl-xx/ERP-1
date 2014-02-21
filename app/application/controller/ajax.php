<?php

namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\Request as Request;
	use Framework\RequestMethods as RequestMethods;
	use Framework\View;

	/**
	 *
	 * @author Marcin
	 *
	 */
	class Ajax extends Controller {

		/**
		 * @readwrite
		 */
		protected $_parameters;
		/**
		 * @readwrite
		 */
		protected $_table = array ();

		/**
		 * @readwrite
		 */
		protected $_options;
		public function __construct($options = array()) {
			$this->_parameters = $options ['parameters'];
		}
		public function givmetable() {
			return ($this->_table);
		}

		/**
		 * @once
		 * @protected
		 */
		public function init() {
			// $request = new Request ();
			// var_dump ( $request );
		}

		/**
		 * @protected
		 */
		public function authenticate() {

			/**
			 */
			// $configuration = Registry::get("configuration");
			// $database = Registry::get("database");
			$session = Registry::get ( "session" );

			if (! $session->getup ( 'user' )) {
				header ( "Location: users/index" );
			}
		}

		/**
		 * @once
		 * @protected
		 */
		public function notify() {
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index() {
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index1() {
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index2() {
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index3() {
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index4() {
		}
	}
}