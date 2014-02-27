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
	use Framework\Session\Driver\Server;
	use Framework\Request;

	/**
	 *
	 * @author Marcin
	 *         @NOTE
	 *         W ten sposób można zapisać podstawę działania kontrolerów.
	 *         Za pomocą wpisów w komentarzach przez deklaracją
	 *         można inicjować kolejność kroków i wymagać dla podnoszenia sie funkcji
	 *
	 */
	class Content extends Controller {

		/**
		 * @readwrite
		 */
		protected $_parameters;
		/**
		 * @readwrite
		 */
		protected $_table = array ();

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options) {
			/**
			 */
			$this->_parameters = $options ['parameters'];
			// $database = new Framework\Database();
			// $database->initialize();
		}
		public function givmetable() {
			// print 'czosnek';
			return ($this->_table);
		}

		/**
		 * @once
		 * @protected
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
		 * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
		 *
		 * @TODO
		 * Budowa oddzielnej klasy autentykacji.
		 * W tym miejscy jedynie jej uruchmienie.
		 */
		public function authenticate() {
			// $session = Registry::get("session");

			// var_dump($session);
			// var_dump($session->get("user"));

			// if (empty($session->get("user"))) {

			// header("Location: ?url=users/index");
			// exit();
			// }

			/**
			 */
			// $configuration = Registry::get("configuration");
			// $database = Registry::get("database");
			$session = Registry::get ( "session" );

			if ($session->getup ( 'user' )) {

				header ( "Location: /home/index" );
				// print 'nie jest zalogowany';
			} elseif (RequestMethods::get ( url ) === 'users/index') {
				// nic nie robi
			} else {

				header ( "Location: /users/index" );
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
		 * @before init,
		 * @after notify
		 */
		public function index() {
		}
	}
}