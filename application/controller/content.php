<?php
namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;
	use Framework\Session\Driver\Server;
	use Framework\Request;

	class Content extends Controller {

		/**
		 * @readwrite
		 */
		protected $_parameters;

		/**
		 * @readwrite
		 */
		protected $_table = array();

		public function __construct($options) {
			$this->_parameters = $options['parameters'];
		}

		public function givmetable() {
			// print 'czosnek';
			return ($this->_table);
		}

		/**
		 * @once @protected (non-PHPdoc)
		 *
		 * @see \Application\Controller::init()
		 */
		public function init() {
			parent::init();
		}

		/**
		 * @protected (non-PHPdoc)
		 *
		 * @see \Application\Controller::authenticate()
		 */
		public function authenticate() {
			parent::authenticate();
		}

		/**
		 * @once @protected (non-PHPdoc)
		 *
		 * @see \Application\Controller::notify()
		 */
		public function notify() {
			parent::notify();
		}

		/**
		 * @before init, @after notify
		 */
		public function index() {}

		/**
		 * @before init, @after notify
		 */
		public function help() {}

		/**
		 * @before init, @after notify
		 */
		public function about() {}

		/**
		 * @before init, @after notify
		 */
		public function about_modules() {}

		/**
		 * @before init, @after notify
		 */
		public function about_faq() {}
	}
}