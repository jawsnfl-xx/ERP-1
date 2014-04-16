<?php

namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;
	use Framework\View as View;
	use Framework\Request as Request;
	use Framework\Events as Events;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 * @name Home
	 * @namespace Application\Controller
	 * @version 1
	 * @uses Application\Controller
	 * @uses Framework\Registry
	 * @uses Framework\RequestMethods
	 * @uses Framework\View
	 * @uses Framework\Request
	 * @uses Framework\Events
	 */
	class Home extends Controller {

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

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			$this->_parameters = $options ['parameters'];
		}

		/**
		 *
		 * @return multitype:
		 */
		public function givmetable() {
			return ($this->_table);
		}

		/**
		 * @once @protected
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::init()
		 */
		public function init() {
			parent::init ();
			Events::fire ( "framework.controller.construct.before", array (
					$this->name
			) );
		}

		/**
		 * @protected
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::authenticate()
		 */
		public function authenticate() {
			parent::authenticate ();
		}

		/**
		 * @once @protected
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::notify()
		 */
		public function notify() {
			parent::notify ();
		}

		/**
		 * @before init, authenticate, @after notify
		 */
		public function index() {
		}

		/**
		 * @before init, authenticate, @after notify
		 * @NOTE Podstrony możliwe dla settings: - access permissions - properties - system settings
		 */
		public function settings() {
			/**
			 */
			if ($this->_parameters [0] === 'access_permissions') {
			}

			/**
			 */
			elseif ($this->_parameters [0] === 'properties') {
			}

			/**
			 */
			elseif ($this->_parameters [0] === 'system settings') {
			}
		}
	}
}