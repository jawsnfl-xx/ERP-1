<?php

namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;
	use Framework\ArrayMethods as ArrayMethods;
	use Framework\View as View;
	use Framework\Request as Request;
	use Plugins as Plugins;

	class Module extends Controller {

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
		 */
		public function test() {
		}

		/**
		 * @before init, authenticate, @after notify
		 * @NOTE/
		 */
		public function product_technology() {
			$product = new \Plugins\Product_technology\Product ();
			$orders = new \Plugins\Sales_management\Orders ();
			$packages = new \Plugins\Inventory_management\Packages ();
			$quality_management = new \Plugins\Quality_management\Production_quality_management ();

			if ($this->_parameters [0] === 'product') {

				if ($this->_parameters [1] === 'view') {

					$this->_table ['product'] ['view'] = $product->_createView ( $this->_parameters [2] );
					$this->_table ['orders'] ['list'] = $orders->_createListLimit ( 5 );
					$this->_table ['packages'] ['list'] = $packages->_createListLimit ( 5 );
					$this->_table ['quality_management'] ['list'] = $quality_management->_createListLimit ( 5 );
				} elseif ($this->_parameters [1] === 'add') {
					/**
					 * Wyświetla arkusz dodania nowego produktu
					 */
					if ($this->_parameters [2] === '1') {
						/**
						 * Sprawdza istnienie danego produktu w bazie...
						 */
						$session = Registry::get ( "session" );

						/**
						 */
						if ($session->getup ( "product/add/error" ) === 'idIsExists') {
							$this->_table ['product'] ['add'] ['error'] = 'idIsExists';
							$this->_table ['product'] ['add'] ['value'] ['numer'] = $session->getup ( "product/add/value/numer" );

							/**
							 * Wyczyszczenie informacji w sesji
							 */
							$session->erase ( "product/add/error" );
							$session->erase ( "product/add/value/numer" );
						} elseif ($session->getup ( "product/add/error" ) === 'emptyValueName') {
							$this->_table ['product'] ['add'] ['error'] = 'emptyValueName';

							/**
							 * Wyczyszczenie informacji w sesji
							 */
							$session->erase ( "product/add/error" );
							$session->erase ( "product/add/value/numer" );
						} else {
						}
					} elseif ($this->_parameters [2] === '2') {

						$session = Registry::get ( "session" );

						if ($session->getup ( "product/add/value/number" )) {
							/**
							 * Mamy wartość ! To znaczy, że prawidłowo prześliśmy do kroku 2...
							 */
							/**
							 * Możemy wyświetlić pola do wpisania informacji...
							 */
							$this->_table ['product'] ['add'] ['value'] ['units'] = $product->_createListUnits ();
							$this->_table ['product'] ['add'] ['value'] ['category'] = $product->_createListCategory ();

							/**
							 * Obsłuda błędów
							 */
							$session = Registry::get ( "session" );
							if ($session->getup ( "product/add/error" )) {
								$this->_table ['product'] ['add'] ['error'] = TRUE;

								if ($session->getup ( "product/add/error/units" )) {
								} else {
									$this->_table ['product'] ['add'] ['select'] ['units'] = $session->getup ( "product/add/value/units" );
								}
								if ($session->getup ( "product/add/error/category" )) {
								} else {
									$this->_table ['product'] ['add'] ['select'] ['category'] = $session->getup ( "product/add/value/category" );
								}

								$session->erase ( "product/add/error" );
							}
						} else {
							header ( "Location: /module/product_technology/product/add/1" );
						}
					} elseif ($this->_parameters [2] === '3') {
						$session = Registry::get ( "session" );

						/**
						 */
						if ($session->getup ( "product/add/value/number" )) {

							$this->_table ['product'] ['add'] ['value'] ['number'] = $session->getup ( "product/add/value/number" );
							$this->_table ['product'] ['add'] ['select'] ['units'] = $session->getup ( "product/add/value/units" );
							$this->_table ['product'] ['add'] ['select'] ['category'] = $session->getup ( "product/add/value/category" );
						} else {
							header ( "Location: /module/product_technology/product/add/1" );
						}
					} else {
						/**
						 * Nie wpisano numeru kroku w pasek adresu Przechodzimy do kroku 1
						 */
						header ( "Location: /module/product_technology/product/add/1" );
					}
				} elseif ($this->_parameters [1] === '_add') {

					/**
					 * Sprawdza i dodaje dane z arkusza dodania nowego produktu
					 */
					if ($this->_parameters [2] === '1') {
						/**
						 * Sprawdza istnienie danego produktu w bazie...
						 */
						$_keywords = RequestMethods::post ( 'number' );

						if (! empty ( $_keywords )) {

							$this->_table ['product'] ['add'] ['exists'] = $product->_isExists ( $_keywords );
							if (! empty ( $this->_table ['product'] ['add'] ['exists'] )) {
								/**
								 * Istnieje jakiś produkt to takim identyfikatorze.
								 * Należy się cofnąć i zaproponować przejście do p/view oraz zmianę identyfikatora
								 */
								$session = Registry::get ( "session" );
								$session->setup ( "product/add/error", "idIsExists" );
								$session->setup ( "product/add/value/numer", $this->_table ['product'] ['add'] ['exists'] );
								header ( "Location: /module/product_technology/product/add/1" );
							} else {
								/**
								 * Nie ma w bazie takiego produktu, można rozpocząć dodawanie.
								 */
								$session = Registry::get ( "session" );
								$session->setup ( "product/add/value/number", $_keywords );
								header ( "Location: /module/product_technology/product/add/2" );
							}
						} else {

							/**
							 * Wpisana wartość nie jest liczbą.
							 * Wracamy...
							 */
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/error", "emptyValueName" );
							header ( "Location: /module/product_technology/product/add/1" );
						}
					} elseif ($this->_parameters [2] === '2') {

						/**
						 * No to kontrolujemy stronę 2 dodawania nowego produktu
						 */
						$_units_id_units = RequestMethods::post ( 'units_id_units' );
						$_category_product = RequestMethods::post ( 'category_product' );

						/**
						 */
						if (empty ( $_units_id_units ) or $_units_id_units === '--') {
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/error", "emptyValue" );
							$session->setup ( "product/add/error/units", "emptyValueUnits" );
						} else {
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/value/units", $_units_id_units );
						}

						/**
						 */
						if (empty ( $_category_product ) or $_category_product === '--') {
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/error", "emptyValue" );
							$session->setup ( "product/add/error/category", "emptyValueCategory" );
						} else {
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/value/category", $_category_product );
						}

						/**
						 */
						if ($session->getup ( "product/add/error" ) === "emptyValue") {
							header ( "Location: /module/product_technology/product/add/2" );
						} else {
							$session = Registry::get ( "session" );
							$session->setup ( "product/add/value/units", $_units_id_units );
							$session->setup ( "product/add/value/category", $_category_product );
							header ( "Location: /module/product_technology/product/add/3" );
						}
					} elseif ($this->_parameters [2] === '3') {

					/**
					 * No to mamy krok 3 - podsumowanie
					 */
					} elseif ($this->_parameters [2] === '4') {

						/**
						 * Tutaj czyścimy wszystkie infomacje przechowywane w sesji i wracamy do page.
						 */
						$session = Registry::get ( "session" );
						$session->erase ( "product/add/error" );
						$session->erase ( "product/add/value/number" );
						$session->erase ( "product/add/value/units" );
						$session->erase ( "product/add/value/category" );
						header ( "Location: /module/product_technology/product/page" );
					} elseif ($this->_parameters [2] === '5') {

						$session = Registry::get ( "session" );

						$_checkin = ($session->getup ( "product/add/value/number" ) ? TRUE : FALSE);
						$_checkin = ($session->getup ( "product/add/value/units" ) ? TRUE : FALSE);
						$_checkin = ($session->getup ( "product/add/value/category" ) ? TRUE : FALSE);

						/**
						 */
						$_returnID = $product->_addSingleProduct ( $session->getup ( "product/add/value/number" ), $session->getup ( "product/add/value/units" ), $session->getup ( "product/add/value/category" ) );

						$session->erase ( "product/add/error" );
						$session->erase ( "product/add/value/number" );
						$session->erase ( "product/add/value/units" );
						$session->erase ( "product/add/value/category" );
						header ( "Location: /module/product_technology/product/view/" . $_returnID );
					}
				} elseif ($this->_parameters [1] === 'search') {
					/**
					 */
					$_keywords = RequestMethods::post ( 'number' );
					$this->_table ['product'] ['search'] = $_keywords;

					$this->_table ['product'] ['listSearch'] = $product->_createListSearch ( $_keywords );
				} elseif ($this->_parameters [1] === 'page') {
					/**
					 * Sprawdzenie poprawności danych
					 */
					if ($this->_parameters [2] === NULL) {
						$page = 1;
					} else {
						$page = $this->_parameters [2];
					}

					/**
					 */
					if ($this->_parameters [3] === NULL) {
						$limit = 20;
					} else {
						$limit = $this->_parameters [3];
					}

					/**
					 * Wywołanie tabeli z bazy
					 */
					$this->_table ['product'] ['list'] = $product->_createSoftList ( $page, $limit );

					// var_dump( $this->_table['product']['list'][0] );

					/**
					 * Budowa pagera UWAGA! Napisać na szybko, później przenieść jako uniwersalny element...
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
				} elseif ($this->_parameters [1] === 'delete') {

					// print 'sprawdzamy -> ';
					/**
					 * Sprawdzamy, czy został podany parametr "2"
					 */
					if ($this->_parameters [2]) {
						// print 'mamy parametr -> ';
						/**
						 * Sprawdzamy, czy podany id produktu znajduje się w bazie.
						 */
						if ($product->_isExistsByID ( $this->_parameters [2] )) {

							// print 'mamy id -> ';
							/**
							 * Możemy zacząć kasować produkt
							 */
							if ($status = $product->_statusDeleteSingle ( $this->_parameters [2] )) {

								// print 'kasujemy';

								header ( "Location: /module/product_technology/product/page/" );
								die ();
								return TRUE;
							} else {

								// print 'nie udało się skasować';
								/**
								 * Nie udało się skasowanie wpisu w bazie
								 */
								return FALSE;
							}
						} else {
							// print 'brak detalu o podanym id';
							/**
							 * Nie istnieje detal o podanym id w bazie
							 */
							return FALSE;
						}
					} else {
						// print 'brak id w zapytaniu';
						/**
						 * Nie podano id w zapytaniu
						 */
						return FALSE;
					}
				} elseif ($this->_parameters [1] === 'edit') {
					/**
					 * Wyświetla stronę, na której można dokonać edycji danego produktu
					 */
					if ($this->_parameters [2]) {
						/**
						 * Posiada jakąś wartość To znaczy, że mamy podaną nazwę detalu
						 */
						if ($product->_isExistsByID ( $this->_parameters [2] )) {
							/**
							 * Sprawdzamy, czy detal o takim idzie istnieje.
							 * To ważne, bo co możemy edytować, jak nie będzie produktu w bazie danych.
							 */
							$this->_table ['product'] ['edit'] = $product->_createView ( $this->_parameters [2] );
							// var_dump($this->_table['product']['edit'] );
						} else {
							/**
							 * Nie mamy takiego detalu.
							 * Można wyświetlić info o błędzie, albo wrócić do product/page
							 */
							header ( "Location: /module/product_technology/product/page/" );
							die ();
						}
					} else {
						/**
						 * Nie wprowadzono parametru.
						 * Hmmm. Strona wyświetlona niepotrzebnie. Wracamy do product/page
						 */
						header ( "Location: /module/product_technology/product/page/" );
						die ();
					}
				} else {
					/**
					 * W wypadku wyświetlenia dowolnej ze stron pt/product wyświerla listę stron z defaultową pierwszą stroną.
					 * Zawiera ona 20 wyników.
					 */
					header ( 'Location: /module/product_technology/product/page/1/20' );
				}
			} elseif ($this->_parameters [0] === 'technology') {
				/**
				 * Jakieś tam informacje dla technologii
				 */
				$data = 0;
			}
		}

		/**
		 * @before init, authenticate, @after notify
		 * @NOTE
		 */
		public function quality_management() {
			$quality_management = new \Plugins\Quality_management\Production_quality_management ();
			// $controlSheet = new \Plugins();

			// var_dump($controlSheet);
			if ($this->_parameters [0] === 'review') {
				/**
				 * Sprawdzenie poprawności danych
				 */

				if ($this->_parameters [1] === NULL) {
					$page = 1;
				} else {
					$page = $this->_parameters [1];
				}

				if ($this->_parameters [2] === NULL) {
					$limit = 20;
				} else {
					$limit = $this->_parameters [2];
				}

				/**
				 * Wywołanie tabeli z bazy
				 */
				$this->_table ['quality_management'] ['list'] = $quality_management->_createSoftList ( $page, $limit );

				/**
				 * Budowa pagera
				 * UWAGA! Napisać na szybko, później przenieść jako uniwersalny element.../
				 * $count = $quality_management->_createListCount();
				 *
				 * /**
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
				$this->_table ['quality_management'] ['pager'] = $pager;
			} elseif ($this->_parameters [0] === 'view') {

				/**
				 * Wyświetla arkusz kontrolny z badania
				 */
				$this->_table ['quality_management'] ['view'] = ArrayMethods::clean ( $quality_management->_createView ( $this->_parameters [1] ) );
				// var_dump($this->_table['quality_management']['view']);
				/**
				 * Tymczasowo ładowany widok ControlSheet.
				 * Do rozbudowy.
				 */
				$controlSheet = new \Plugins\Quality_management\QualityInspection\ControlMeasurements\ControlSheet ();
				// var_dump($controlSheet);
			}

			elseif ($this->_parameters [0] === 'add') {

				/**
				 * Wyświetla arkusz kontroli pomiaru.
				 * Na tym etapie musi być podzielony na 3 etapy. 1. wprowadzenie danych początkowych 2. wprowadzenie pomiarów wymiarów kontolnych 3. wprowadzenie pomiarów tolerancji geometrii i kształtu
				 * Do tego dochodzi jeszcze podsumowanie, ale to nie na teraz... :)
				 * Lol - jak zabawnie :D
				 */

				if ($this->_parameters [1] === 'step1') {
					/**
					 * Krok 1.
					 * Widok robi pola do wpisania informacji Kontroler chyba nie będzie robił nic... Nie nie i nie... ! Kontroler musi sprawdzić, czy nie zostały do niego przekazane błedy dotyczące brakujących lub niepoprawnych danych z niego samego z _step1
					 * UWAGA! Dane błędów przekazywane będą przez _GET['form_err']/
					 *
					 * /**
					 * Sprawdzenie _GET['form_err'] Jeśli zawiera pola błędów trzeba przekazać tablicę do widoku... :D
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
					 * Musi sprawdzić zawartość wszystkich pól w które zostały wpisane informacje. Jeśli są te, które niezbędne są do założenia karty pomiaru, robi to. Jeśli brakuje wymaganych informacji wróci do poprzedniej strony i zakomunikuje które pola były brzydkie, a które puste.
					 */

					/**
					 * - text - amount - quan
					 */

					/**
					 *
					 * @todo Należy tak rozbudować kontrolę pól, aby móc automatyzować przekazywanie watrości tych pól do strony z inputami, oraz przekazywać wartości pól błędnie wpisanych lub bez wartości wpisanej przez użytkownika.
					 */

					/**
					 *
					 * @todo do wprowadzenia: 1. sprawdzić wartości zmiennych przekazywanych z pól a) puste b) liczbowe (bardzo ważne) 2. sprawdzić istnienie danych, które mogą / muszą znajdować się w bazie a) nazwy detali b) numery skrzyń c) pracownicy
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
						header ( 'Location: ?url=module/quality_management/add/step1&form_err=' . $tmp_array . '&form_name=' . $tmp_name . '&form_amount=' . $tmp_amount . '&form_quan=' . $tmp_quan );
						exit ();
					} else {
						/**
						 * Cholerka...
						 * Wszystko zapowiada się dobrze. Poza otworzyć arkusz (sheet) kontroli jakości... :)
						 */

						/**
						 * Po utworzeniu arkusza należy przejść do kroku 2...
						 * Trzeba zastanowić się tylko jak przekazać identyfikator nowego arkusza :D
						 */
						header ( 'Location: /module/quality_management/add/step2' );
					}
				} elseif ($this->_parameters [1] === 'step2') {
				/**
				 * Krok 2.
				 * Widok wyświetla tabelę do pomiarów zgodną z wpisanym wcześniej detalem. Kontroler przelicza rozmiar tabeli, czyta pola wymiarów, tolerancji itp., utrzymuje rozpoczęta kartę pomiaru.
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
				 * Wydaje mi się, że na sprawdzeniu podsumowania powinien przelecieć jeszcze raz spójność podsumowania oraz przejść do review z podkreślonym danym wspisem, albo do view z danym wpisem.
				 */
				} else {
				}
			} else

			{
			}
		}
	}
}