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
	use Framework\Request;

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
			$this->_parameters = $options ['parameters'];
		}
		public function givmetable() {
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
		 */
		public function product_technology() {
			$product = new \Module\Product_technology\Product ();

			if ($this->_parameters [0] === 'product') {

				if ($this->_parameters [1] === 'view') {
					$this->_table ['product'] ['view'] = $product->_createView ( $this->_parameters [2] );
				}

				elseif ($this->_parameters [1] === 'search') {

					/**
					 */
					$_keywords = RequestMethods::post ( 'number' );
					$this->_table ['product'] ['search'] = $_keywords;

					$this->_table ['product'] ['listSearch'] = $product->_createListSearch ( $_keywords );

					// var_dump ( $this->_table ['product'] ['listSearch'] );
				} else {

					/**
					 * Sprawdzenie poprawności danych
					 */
					if (RequestMethods::get ( 'page' ) == NULL) {
						$page = 1;
					} else {
						$page = RequestMethods::get ( 'page' );
					}

					if (RequestMethods::get ( 'limit' ) == NULL) {
						$limit = 20;
					} else {
						$limit = RequestMethods::get ( 'limit' );
					}

					/**
					 * Wywołanie tabeli z bazy
					 */

					$this->_table ['product'] ['list'] = $product->_createSoftList ( $page, $limit );

					/**
					 * Budowa pagera
					 *
					 * UWAGA!
					 * Napisać na szybko, później przenieść jako uniwersalny element...
					 */
					$count = $product->_createListCount ();

					/**
					 * oblicza ile jest stron pełnych lub napoczętych
					 */
					$countPage = ceil ( $count / $limit );
					/**
					 * Teraz powinnien zbudować tablicę, z wartościami dla poszczególych klocków pagiera ;P
					 */
					$pager = array ();
					for($i = 1; $i <= $countPage; $i ++) {
						$tmp = array ();
						$tmp ['page'] = $i;
						$tmp ['limit'] = $limit;
						$pager [] = $tmp;
					}
					$this->_table ['product'] ['pager'] = $pager;
				}
			} elseif ($this->_parameters [0] === 'technology') {

				/**
				 * Jakieś tam informacje dla technologii
				 */
				$data = 0;
				// nic nie robi
			}
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 *
		 * @NOTE
		 */
		public function quality_management() {
			$quality_management = new \Module\Quality_management\Production_quality_management ();

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
					 * Kontroler musi sprawdzić, czy nie zostały do niego przekazane błedy
					 * dotyczące brakujących lub niepoprawnych danych
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
						$this->_table ['form_name'] = RequestMethods::get ( "form_name" );
						$this->_table ['form_amount'] = RequestMethods::get ( "form_amount" );
						$this->_table ['form_quan'] = RequestMethods::get ( "form_quan" );
					}
				} elseif ($this->_parameters [1] === '_step1') {
					/**
					 * Sprawdzenie Krok 1.
					 * Musi sprawdzić zawartość wszystkich pól w które zostały wpisane informacje.
					 * Jeśli są te, które niezbędne są do założenia karty pomiaru, robi to.
					 * Jeśli brakuje wymaganych informacji wróci do poprzedniej
					 * strony i zakomunikuje które pola były brzydkie, a które puste.
					 */

					/**
					 * - text
					 * - amount
					 * - quan
					 */

					/**
					 *
					 * @todo Należy tak rozbudować kontrolę pól,
					 *       aby móc automatyzować przekazywanie watrości
					 *       tych pól do strony z inputami, oraz przekazywać wartości pól
					 *       błędnie wpisanych lub bez wartości wpisanej przez użytkownika.
					 */

					$tmp_array = array ();
					$tmp_error = FALSE;
					if (! RequestMethods::post ( 'name' )) {
						$tmp_array [] = 'name';
						$tmp_error = TRUE;
					} else {
						$tmp_name = RequestMethods::post ( 'name' );
					}
					if (! RequestMethods::post ( 'amount' )) {
						$tmp_array [] = 'amount';
						$tmp_error = TRUE;
					} else {
						$tmp_amount = RequestMethods::post ( 'amount' );
					}
					if (! RequestMethods::post ( 'quan' )) {
						$tmp_array [] = 'quan';
						$tmp_error = TRUE;
					} else {
						$tmp_quan = RequestMethods::post ( 'quan' );
					}

					if ($tmp_error) {
						$tmp_array = implode ( '|', $tmp_array );
						header ( 'Location: ?url=home/quality_management/add/step1&form_err=' . $tmp_array . '&form_name=' . $tmp_name . '&form_amount=' . $tmp_amount . '&form_quan=' . $tmp_quan );
						exit ();
					} else {
						/**
						 * Cholerka...
						 * Wszystko zapowiada się dobrze.
						 * Poza otworzyć arkusz (sheet) kontroli jakości... :)
						 */

						// $quality_management->sheet = new \Module\Quality_management\Sheet ();

						/**
						 * Po utworzeniu arkusza należy przejść do kroku 2...
						 * Trzeba zastanowić się tylko jak przekazać identyfikator nowego arkusza :D
						 */
						header ( 'Location: ?url=home/quality_management/add/step2' );
					}
				} elseif ($this->_parameters [1] === 'step2') {
				/**
				 * Krok 2.
				 * Widok wyświetla tabelę do pomiarów zgodną z wpisanym wcześniej detalem.
				 * Kontroler przelicza rozmiar tabeli, czyta pola wymiarów, tolerancji itp.,
				 * utrzymuje rozpoczęta kartę pomiaru.
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
				 * Wydaje mi się, że na sprawdzeniu podsumowania
				 * powinien przelecieć jeszcze raz spójność podsumowania
				 * oraz przejść do review z podkreślonym danym wspisem,
				 * albo do view z danym wpisem.
				 */
				} else {
					// jeśli to zostanie wywołane?
					// czy to jest błąd?
				}
			} else {
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