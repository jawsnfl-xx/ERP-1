<?php

namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;

	/**
	 *
	 * @author Marcin
	 *         @NOTE
	 *         W ten sposób można zapisać podstawę działania kontrolerów.
	 *         Za pomocą wpisów w komentarzach przez deklaracją
	 *         można inicjować kolejność kroków i wymagać dla podnoszenia sie funkcji
	 *        
	 */
	class Action extends Controller {
		
		/**
		 * @readwrite
		 */
		protected $_parameters;
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options) {
			/**
			 */
			$this->_parameters = $options ['parameters'];
		}
		
		/**
		 * @once
		 * @protected
		 */
		/**
		 * Wykonywana jest inicjalizacja wszystkiego co może być potrzebne.
		 *
		 * @TODO
		 * Włącznie z przekazaniem dalszych danych dla Smatry
		 */
		public function init() {
			// parent::init();
			
			// var_dump($this);
			// var_dump(parent::$database);
			// $data = $database->_mysql->fetch_array('SHOW TABLES');
		}
		
		/**
		 * @protected
		 */
		/**
		 * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
		 *
		 * @TODO
		 * Budowa oddzielnej klasy autentykacji.
		 * W tym miejscy jedynie jej uruchmienie.
		 */
		public function authenticate() {
			// parent::authenticate();
		}
		
		/**
		 * @once
		 * @protected
		 */
		public function notify() {
			// parent::notify();
		}
		
		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index() {
			print 'index';
		}
		
		/**
		 * @before init, authenticate,
		 * @after notify
		 *
		 * @NOTE
		 * ref = references
		 *
		 * @TODO
		 * Dodać wartości ref
		 */
		public function ref() {
			print 'ref';
		}
		
		/**
		 * @before init,
		 * @after notify
		 *
		 * @NOTE
		 * rat = retrying
		 *
		 * @TODO
		 * Dodać wartości ret
		 */
		public function ret() {
			print 'ret';
		}
	}
}