<?php

/**
 *
 * @author Marcin
 *
 */
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
	class Home extends Controller {
		
		/**
		 * @readwrite
		 */
		protected $_parameters;
		
		/**
		 * @readwrite
		 */
		protected $_options;
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			/**
			 */
			$this->_parameters = $options ['parameters'];
		}
		
		/**
		 * @once
		 * @protected
		 *
		 *
		 * Wykonywana jest inicjalizacja wszystkiego co może być potrzebne.
		 *
		 * @TODO
		 * Włącznie z przekazaniem dalszych danych dla Smatry
		 */
		public function init() {
		}
		
		/**
		 * @protected
		 *
		 *
		 * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
		 *
		 * @TODO
		 * Budowa oddzielnej klasy autentykacji.
		 * W tym miejscy jedynie jej uruchmienie.
		 */
		public function authenticate() {
			
			/**
			 */
			// $configuration = Registry::get("configuration");
			// $database = Registry::get("database");
			$session = Registry::get ( "session" );
			
			if (! $session->getup ( 'user' )) {
				header ( "Location: ?url=users/index" );
				// print 'nie jest zalogowany';
			}
			// var_dump($session);
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
		 *
		 * @NOTE
		 * Podstrony możliwe dla settings:
		 * - access permissions
		 * - properties
		 * - system settings
		 */
		public function settings() {
			/**
			 */
			if ($this->_parameters [0] === 'access_permissions') {
				// print 'access permissions';
			}
			
			/**
			 */
			if ($this->_parameters [0] === 'properties') {
				// print 'properties';
			}
			
			/**
			 */
			if ($this->_parameters [0] === 'system settings') {
				// print 'system_settings';
			}
		}
		
		/**
		 * @before init, authenticate,
		 * @after notify
		 *
		 * @NOTE
		 * Podstrony możliwe dla settings:
		 * - access permissions
		 * - properties
		 * - system settings
		 */
		public function quality_management() {
			// $quality_management = new \Module\Quality_management ();
			
			// var_dump($production_quality_management);
			/**
			 */
			if ($this->_parameters [0] === 'review') {
				// print 'review';
			}
			
			/**
			 */
			if ($this->_parameters [0] === 'add') {
				// print 'add';
			}
		}
	}
}