<?php

/**
 *
 * @author Marcin
 *
 */
namespace Application\Controller
{

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
    class Module extends Controller
    {

        /**
         * @readwrite
         */
        protected $_parameters;

        /**
         * @readwrite
         */
        protected $_table = array();

        /**
         * @readwrite
         */
        protected $_options;

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options = array())
        {
            $this->_parameters = $options['parameters'];
        }

        public function givmetable()
        {
            return ($this->_table);
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::init()
         */
        public function init()
        {
            parent::init();
        }

        /**
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::authenticate()
         */
        public function authenticate()
        {
            parent::authenticate();
        }

        /**
         * @once
         * @protected
         *
         * (non-PHPdoc)
         *
         * @see \Application\Controller::notify()
         */
        public function notify()
        {
            parent::notify();
        }

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function index()
        {}

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
        public function settings()
        {
            /**
             */
            if ($this->_parameters[0] === 'access_permissions') {} 

            /**
             */
            elseif ($this->_parameters[0] === 'properties') {} 

            /**
             */
            elseif ($this->_parameters[0] === 'system settings') {}
        }

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         */
        public function product_technology()
        {
            $product = new \Plugins\Product_technology\Product();
            $orders = new \Plugins\Sales_management\Orders();
            $packages = new \Plugins\Inventory_management\Packages();
            $quality_management = new \Plugins\Quality_management\Production_quality_management();
            
            if ($this->_parameters[0] === 'product') {
                
                if ($this->_parameters[1] === 'view') {
                    
                    $this->_table['product']['view'] = $product->_createView($this->_parameters[2]);
                    $this->_table['orders']['list'] = $orders->_createListLimit(5);
                    $this->_table['packages']['list'] = $packages->_createListLimit(5);
                    $this->_table['quality_management']['list'] = $quality_management->_createListLimit(5);
                    
                    // var_dump( $this->_table['product']);
                } 

                elseif ($this->_parameters[1] === 'add') {
                    /**
                     * Wyświetla arkusz dodania nowego produktu
                     */
                    if ($this->_parameters[2] === '1') {
                        /**
                         * Sprawdza istnienie danego produktu w bazie...
                         */
                        $session = Registry::get("session");
                        
                        // var_dump($session->getup("product/add/error"));
                        
                        if ($session->getup("product/add/error") === 'idIsExists') {
                            $this->_table['product']['error'] = 'idIsExists';
                            $this->_table['product']['link'] = $session->getup("product/add/return_value");
                            
                            // var_dump( $this->_table['product']['link']);
                            $session->erase("product/add/error");
                            $session->erase("product/add/name_value");
                        } elseif ($session->getup("product/add/error") === 'emptyValueName') {
                            $this->_table['product']['error'] = 'emptyValueName';
                            $session->erase("product/add/error");
                            $session->erase("product/add/name_value");
                        } else {
                            // print 'nic';
                        }
                    } elseif ($this->_parameters[2] === '2') {
                        
                        $session = Registry::get("session");
                        
                        if ($session->getup("product/add/name_value")) {
                        /**
                         * Mamy wartość !
                         * To znaczy, że prawidłowo prześliśmy do kroku 2...
                         */
                        /**
                         * Możemy wyświetlić pola do wpisania informacji...
                         */
                        
                        /**
                         * Obsłuda błędów
                         */
                        } else {
                            /**
                             * Nic nie wiemy o detalu, jaki dodajemy...
                             * Źle.
                             * Cofamy się do kroku 1.
                             */
                            header("Location: /module/product_technology/product/add/1");
                        }
                    } else {
                        /**
                         * Nie wpisano numeru kroku w pasek adresu
                         * Przechodzimy do kroku 1
                         */
                        header("Location: /module/product_technology/product/add/1");
                    }
                } elseif ($this->_parameters[1] === '_add') {
                    /**
                     * Sprawdza i dodaje dane z arkusza dodania nowego produktu
                     */
                    
                    if ($this->_parameters[2] === '1') {
                        /**
                         * Sprawdza istnienie danego produktu w bazie...
                         */
                        $_keywords = RequestMethods::post('number');
                        
                        if (! empty($_keywords)) {
                            // print 'mamy wartość';
                            $this->_table['product']['exists'] = $product->_isExists($_keywords);
                            // var_dump($this->_table['product']['exists']);
                            if (! empty($this->_table['product']['exists'])) {
                                /**
                                 * Istnieje jakiś produkt to takim identyfikatorze.
                                 * Należy się cofnąć i zaproponować przejście do p/view oraz zmianę identyfikatora
                                 */
                                $session = Registry::get("session");
                                $session->setup("product/add/error", "idIsExists");
                                $session->setup("product/add/return_value", $this->_table['product']['exists']);
                                header("Location: /module/product_technology/product/add/1");
                            } else {
                                /**
                                 * Nie ma w bazie takiego produktu,
                                 * można rozpocząć dodawanie.
                                 */
                                $session = Registry::get("session");
                                $session->setup("product/add/name_value", $_keywords);
                                header("Location: /module/product_technology/product/add/2");
                            }
                        } else {
                            
                            /**
                             * Wpisana wartość nie jest liczbą.
                             * Wracamy...
                             */
                            // print "?";
                            // print 'jest puste';
                            $session = Registry::get("session");
                            $session->setup("product/add/error", "emptyValueName");
                            header("Location: /module/product_technology/product/add/1");
                        }
                    }
                } 

                elseif ($this->_parameters[1] === 'search') {
                    
                    /**
                     */
                    $_keywords = RequestMethods::post('number');
                    $this->_table['product']['search'] = $_keywords;
                    
                    $this->_table['product']['listSearch'] = $product->_createListSearch($_keywords);
                } elseif ($this->_parameters[1] === 'page') {
                    
                    /**
                     * Sprawdzenie poprawności danych
                     */
                    
                    if ($this->_parameters[2] === NULL) {
                        $page = 1;
                    } else {
                        $page = $this->_parameters[2];
                    }
                    
                    if ($this->_parameters[3] === NULL) {
                        $limit = 20;
                    } else {
                        $limit = $this->_parameters[3];
                    }
                    
                    /**
                     * Wywołanie tabeli z bazy
                     */
                    $this->_table['product']['list'] = $product->_createSoftList($page, $limit);
                    
                    /**
                     * Budowa pagera
                     *
                     * UWAGA!
                     * Napisać na szybko, później przenieść jako uniwersalny element...
                     */
                    $count = $product->_createListCount();
                    
                    /**
                     * oblicza ile jest stron pełnych lub napoczętych
                     */
                    $countPage = ceil($count / $limit);
                    /**
                     * Teraz powinnien zbudować tablicę, z wartościami dla poszczególych klocków pagiera ;P
                     */
                    $pager = array();
                    for ($i = 1; $i <= $countPage; $i ++) {
                        $tmp = array();
                        $tmp['page'] = $i;
                        $tmp['limit'] = $limit;
                        $pager[] = $tmp;
                    }
                    $this->_table['product']['pager'] = $pager;
                } else {
                    header('Location: /module/product_technology/product/page/1/20');
                }
            } elseif ($this->_parameters[0] === 'technology') {
                
                /**
                 * Jakieś tam informacje dla technologii
                 */
                $data = 0;
            }
        }

        /**
         * @before init, authenticate,
         * @after notify
         *
         * @NOTE
         */
        public function quality_management()
        {
            $quality_management = new \Plugins\Quality_management\Production_quality_management();
            
            /**
             */
            if ($this->_parameters[0] === 'review') {
                
                /**
                 * Sprawdzenie poprawności danych
                 */
                
                if ($this->_parameters[1] === NULL) {
                    $page = 1;
                } else {
                    $page = $this->_parameters[1];
                }
                
                if ($this->_parameters[2] === NULL) {
                    $limit = 20;
                } else {
                    $limit = $this->_parameters[2];
                }
                
                /**
                 * Wywołanie tabeli z bazy
                 */
                $this->_table['quality_management']['list'] = $quality_management->_createSoftList($page, $limit);
                
                /**
                 * Budowa pagera
                 *
                 * UWAGA!
                 * Napisać na szybko, później przenieść jako uniwersalny element...
                 */
                $count = $quality_management->_createListCount();
                
                /**
                 * oblicza ile jest stron pełnych lub napoczętych
                 */
                $countPage = ceil($count / $limit);
                /**
                 * Teraz powinnien zbudować tablicę, z wartościami dla poszczególych klocków pagiera ;P
                 */
                $pager = array();
                for ($i = 1; $i <= $countPage; $i ++) {
                    $tmp = array();
                    $tmp['page'] = $i;
                    $tmp['limit'] = $limit;
                    $pager[] = $tmp;
                }
                $this->_table['quality_management']['pager'] = $pager;
            } elseif ($this->_parameters[0] === 'view') {
                /**
                 * Wyświetla arkusz kontrolny z badania
                 */
                $this->_table['quality_management']['view'] = $quality_management->_createView($this->_parameters[1]);
            } /**
             */
            
            elseif ($this->_parameters[0] === 'add') {
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
                
                if ($this->_parameters[1] === 'step1') {
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
                    if (RequestMethods::get("form_err")) {
                        /**
                         * No to mamy jakieś błędy.
                         * Trzeba sprawdzić poprawność tego co tam jest i zbudować tablicę.
                         */
                        $form_err = explode('|', RequestMethods::get("form_err"));
                        
                        $this->_table['form_err'] = $form_err;
                        $this->_table['form_name'] = RequestMethods::get("form_name");
                        $this->_table['form_amount'] = RequestMethods::get("form_amount");
                        $this->_table['form_quan'] = RequestMethods::get("form_quan");
                    }
                } elseif ($this->_parameters[1] === '_step1') {
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
                    
                    $tmp_array = array();
                    $tmp_error = FALSE;
                    if (! RequestMethods::post('name')) {
                        $tmp_array[] = 'name';
                        $tmp_error = TRUE;
                    } else {
                        $tmp_name = RequestMethods::post('name');
                    }
                    if (! RequestMethods::post('amount')) {
                        $tmp_array[] = 'amount';
                        $tmp_error = TRUE;
                    } else {
                        $tmp_amount = RequestMethods::post('amount');
                    }
                    if (! RequestMethods::post('quan')) {
                        $tmp_array[] = 'quan';
                        $tmp_error = TRUE;
                    } else {
                        $tmp_quan = RequestMethods::post('quan');
                    }
                    
                    if ($tmp_error) {
                        $tmp_array = implode('|', $tmp_array);
                        header('Location: ?url=module/quality_management/add/step1&form_err=' . $tmp_array . '&form_name=' . $tmp_name . '&form_amount=' . $tmp_amount . '&form_quan=' . $tmp_quan);
                        exit();
                    } else {
                        /**
                         * Cholerka...
                         * Wszystko zapowiada się dobrze.
                         * Poza otworzyć arkusz (sheet) kontroli jakości... :)
                         */
                        
                        /**
                         * Po utworzeniu arkusza należy przejść do kroku 2...
                         * Trzeba zastanowić się tylko jak przekazać identyfikator nowego arkusza :D
                         */
                        header('Location: /module/quality_management/add/step2');
                    }
                } elseif ($this->_parameters[1] === 'step2') {
                /**
                 * Krok 2.
                 * Widok wyświetla tabelę do pomiarów zgodną z wpisanym wcześniej detalem.
                 * Kontroler przelicza rozmiar tabeli, czyta pola wymiarów, tolerancji itp.,
                 * utrzymuje rozpoczęta kartę pomiaru.
                 */
                } elseif ($this->_parameters[1] === '_step2') {
                /**
                 * Sprawdzenie krok 2.
                 */
                } elseif ($this->_parameters[1] === 'step3') {
                /**
                 * Krok 3.
                 */
                } elseif ($this->_parameters[1] === '_step3') {
                /**
                 * Sprawdzenie krok 3.
                 */
                } elseif ($this->_parameters[1] === 'summary') {
                /**
                 * Podsumowanie.
                 */
                } elseif ($this->_parameters[1] === '_summary') {
                /**
                 * Sprawdzenie podsumowania.
                 * Wydaje mi się, że na sprawdzeniu podsumowania
                 * powinien przelecieć jeszcze raz spójność podsumowania
                 * oraz przejść do review z podkreślonym danym wspisem,
                 * albo do view z danym wpisem.
                 */
                } else {}
            } else {
            /**
             * Główna qm? Nie wiem...
             *
             * 1. Zdecydowanie to główna dla QM :S :S :S :S :S :S :S
             *
             * 2. Tutaj chyba nic nie będzie się robić. To póki co głowna
             */
            }
        }
    }
}