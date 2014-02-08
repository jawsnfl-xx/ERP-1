<?php

/**
 *
 *
 *
 * Testujemy :D
 */

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
			// print 'asd';
			$this->_parameters = $options ['parameters'];
		}
		public function givmetable() {
			// print 'czosnek';
			return ($this->_table);
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
			elseif ($this->_parameters [0] === 'properties') {
				// print 'properties';
			}

			/**
			 */
			elseif ($this->_parameters [0] === 'system settings') {
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

			/**
			 */
			if ($this->_parameters [0] === 'review') {

			/**
			 * Wyświetla listę wszystkich rozpoczętych do tej pory arkuszy kontrolnych
			 * Dziwnie działa edycja na tablecie.
			 * :-)
			 */
				// print 'review';
			} elseif ($this->_parameters [0] === 'view') {

			/**
			 * Wyświetla arkusz kontrolny z badania
			 */
				// print 'view';
			} /**
			 */

			elseif ($this->_parameters [0] === 'add') {
				/**
				 * Wyświetla arkusz kontroli pomiaru.
				 * Na tym etapie musi być podzielony na 3 etapy.
				 * 1. wprowadzenie danych początkowych
				 * 2. wprowadzenie pomiarów wymiarów kontolnych
				 * 3. wprowadzenie pomiarów tolerancji geometrii i kształtu
				 *
				 * Do tego dochodzi jeszcze podsumowanie,
				 * ale to nie na teraz... :)
				 *
				 * Lol - jak zabawnie :D
				 */

				if ($this->_parameters [1] === 'step1') {
					/**
					 * Krok 1.
					 * Widok robi pola do wpisania informacji
					 * Kontroler chyba nie będzie robił nic... Nie nie i nie... !
					 * Kontroler musi sprawdzić, czy nie zostały do niego przekazane błedy dotyczące brakujących lub niepoprawnych danych
					 * z niego samego z _step1
					 *
					 * UWAGA!
					 * Dane błędów przekazywane będą przez _GET['form_err']
					 */

					/**
					 * Sprawdzenie _GET['form_err']
					 * Jeśli zawiera pola błędów trzeba przekazać tablicę do widoku...
					 * :D
					 */
					if (RequestMethods::get ( "form_err" )) {
						/**
						 * No to mamy jakieś błędy.
						 * Trzeba sprawdzić poprawność tego co tam jest i zbudować tablicę.
						 */
						$form_err = explode ( '|', RequestMethods::get ( "form_err" ) );

						$this->_table ['form_err'] = $form_err;
					}
				} elseif ($this->_parameters [1] === '_step1') {
				/**
				 * Sprawdzenie Krok 1.
				 * Musi sprawdzić zawartość wszystkich pól w które zostały wpisane informacje.
				 * Jeśli są te, które niezbędne są do założenia karty pomiaru, robi to.
				 * Jeśli brakuje wymaganych informacji wróci do poprzedniej strony i zakomunikuje które pola były brzydkie, a które puste.
				 */
				} elseif ($this->_parameters [1] === 'step2') {
				/**
				 * Krok 2.
				 * Widok wyświetla tabelę do pomiarów zgodną z wpisanym wcześniej detalem.
				 * Kontroler przelicza rozmiar tabeli, czyta pola wymiarów, tolerancji itp., utrzymuje rozpoczęta kartę pomiaru.
				 */
				} elseif ($this->_parameters [1] === '_step2') {
				/**
				 * Sprawdzenie krok 2.
				 */
				} elseif ($this->_parameters [1] === 'step3') {
				/**
				 * Krok 3.
				 */
				} elseif ($this->_parameters [1] === '_step3') {
				/**
				 * Sprawdzenie krok 3.
				 */
				} elseif ($this->_parameters [1] === 'summary') {
				/**
				 * Podsumowanie.
				 */
				} elseif ($this->_parameters [1] === '_summary') {
				/**
				 * Sprawdzenie podsumowania.
				 */
				} else {
					// jeśli to zostanie wywołane?
					// czy to jest błąd?
				}
			} else

			{
			/**
			 * Główna qm? Nie wiem...
			 *
			 * 1. Zdecydowanie to główna dla QM :S :S :S :S :S :S :S
			 *
			 * 2. Tutaj chyba nic nie będzie się robić. To póki co głowna
			 */
				// print 'else na qm :D';
			}
		}
	}
}