<?php

namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;
	use Framework\View;

	/**
	 *
	 * @author Marcin
	 *
	 */
	class Development extends Controller {

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
				header ( "Location: ?url=users/index" );
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
	}
}