<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

/**
 */
if ($this->_parameters[1] === 'view') {

    $this->_table['product']['view'] = $product->_createView($this->_parameters[2]);
    $this->_table['orders']['list'] = $orders->_createListLimit(5);
    $this->_table['packages']['list'] = $packages->_createListLimit(5);
    $this->_table['quality_management']['list'] = $quality_management->_createListLimit(5);
} elseif ($this->_parameters[1] === 'add') {
    /**
     * Wyświetla arkusz dodania nowego produktu
     */
    if ($this->_parameters[2] === '1') {
        /**
         * Sprawdza istnienie danego produktu w bazie...
         */
        $session = Registry::get("session");

        /**
         */
        if ($session->getup("product/add/error") === 'idIsExists') {
            $this->_table['product']['add']['error'] = 'idIsExists';
            $this->_table['product']['add']['value']['numer'] = $session->getup("product/add/value/numer");

            /**
             * Wyczyszczenie informacji w sesji
             */
            $session->erase("product/add/error");
            $session->erase("product/add/value/numer");
        } elseif ($session->getup("product/add/error") === 'emptyValueName') {
            $this->_table['product']['add']['error'] = 'emptyValueName';

            /**
             * Wyczyszczenie informacji w sesji
             */
            $session->erase("product/add/error");
            $session->erase("product/add/value/numer");
        } else {}
    } elseif ($this->_parameters[2] === '2') {

        $session = Registry::get("session");

        if ($session->getup("product/add/value/number")) {
            /**
             * Mamy wartość !
             * To znaczy, że prawidłowo prześliśmy do kroku 2...
             */
            /**
             * Możemy wyświetlić pola do wpisania informacji...
             */
            $this->_table['product']['add']['value']['units'] = $product->_createListUnits();
            $this->_table['product']['add']['value']['category'] = $product->_createListCategory();

            /**
             * Obsłuda błędów
             */
            $session = Registry::get("session");
            if ($session->getup("product/add/error")) {
                $this->_table['product']['add']['error'] = TRUE;

                if ($session->getup("product/add/error/units")) {} else {
                    $this->_table['product']['add']['select']['units'] = $session->getup("product/add/value/units");
                }
                if ($session->getup("product/add/error/category")) {} else {
                    $this->_table['product']['add']['select']['category'] = $session->getup("product/add/value/category");
                }

                $session->erase("product/add/error");
            }
        } else {
            /**
             * Nic nie wiemy o detalu, jaki dodajemy...
             * Źle.
             * Cofamy się do kroku 1.
             */
            header("Location: /module/product_technology/product/add/1");
        }
    } elseif ($this->_parameters[2] === '3') {
        /**
         * Krok 3 - podsumowanie dodawania
         */
        $session = Registry::get("session");

        /**
         */
        if ($session->getup("product/add/value/number")) {

            $this->_table['product']['add']['value']['number'] = $session->getup("product/add/value/number");
            $this->_table['product']['add']['select']['units'] = $session->getup("product/add/value/units");
            $this->_table['product']['add']['select']['category'] = $session->getup("product/add/value/category");
        } else {
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

            $this->_table['product']['add']['exists'] = $product->_isExists($_keywords);
            if (! empty($this->_table['product']['add']['exists'])) {
                /**
                 * Istnieje jakiś produkt to takim identyfikatorze.
                 * Należy się cofnąć i zaproponować przejście do p/view oraz zmianę identyfikatora
                 */
                $session = Registry::get("session");
                $session->setup("product/add/error", "idIsExists");
                $session->setup("product/add/value/numer", $this->_table['product']['add']['exists']);
                header("Location: /module/product_technology/product/add/1");
            } else {
                /**
                 * Nie ma w bazie takiego produktu,
                 * można rozpocząć dodawanie.
                 */
                $session = Registry::get("session");
                $session->setup("product/add/value/number", $_keywords);
                header("Location: /module/product_technology/product/add/2");
            }
        } else {

            /**
             * Wpisana wartość nie jest liczbą.
             * Wracamy...
             */
            $session = Registry::get("session");
            $session->setup("product/add/error", "emptyValueName");
            header("Location: /module/product_technology/product/add/1");
        }
    } elseif ($this->_parameters[2] === '2') {

        /**
         * No to kontrolujemy stronę 2 dodawania nowego produktu
         */
        $_units_id_units = RequestMethods::post('units_id_units');
        $_category_product = RequestMethods::post('category_product');

        /**
         */
        if (empty($_units_id_units) or $_units_id_units === '--') {
            $session = Registry::get("session");
            $session->setup("product/add/error", "emptyValue");
            $session->setup("product/add/error/units", "emptyValueUnits");
        } else {
            $session = Registry::get("session");
            $session->setup("product/add/value/units", $_units_id_units);
        }

        /**
         */
        if (empty($_category_product) or $_category_product === '--') {
            $session = Registry::get("session");
            $session->setup("product/add/error", "emptyValue");
            $session->setup("product/add/error/category", "emptyValueCategory");
        } else {
            $session = Registry::get("session");
            $session->setup("product/add/value/category", $_category_product);
        }

        /**
         */
        if ($session->getup("product/add/error") === "emptyValue") {
            header("Location: /module/product_technology/product/add/2");
        } else {
            $session = Registry::get("session");
            $session->setup("product/add/value/units", $_units_id_units);
            $session->setup("product/add/value/category", $_category_product);
            header("Location: /module/product_technology/product/add/3");
        }
    } elseif ($this->_parameters[2] === '3') {

    /**
     * No to mamy krok 3 - podsumowanie
     */
    } elseif ($this->_parameters[2] === '4') {

        /**
         * Tutaj czyścimy wszystkie infomacje przechowywane
         * w sesji i wracamy do page.
         */
        $session = Registry::get("session");
        $session->erase("product/add/error");
        $session->erase("product/add/value/number");
        $session->erase("product/add/value/units");
        $session->erase("product/add/value/category");
        header("Location: /module/product_technology/product/page");
    } elseif ($this->_parameters[2] === '5') {

        $session = Registry::get("session");

        $_checkin = ($session->getup("product/add/value/number") ? TRUE : FALSE);
        $_checkin = ($session->getup("product/add/value/units") ? TRUE : FALSE);
        $_checkin = ($session->getup("product/add/value/category") ? TRUE : FALSE);

        /**
         */
        $_returnID = $product->_addSingleProduct($session->getup("product/add/value/number"), $session->getup("product/add/value/units"), $session->getup("product/add/value/category"));

        $session->erase("product/add/error");
        $session->erase("product/add/value/number");
        $session->erase("product/add/value/units");
        $session->erase("product/add/value/category");
        header("Location: /module/product_technology/product/view/" . $_returnID);
    }
} elseif ($this->_parameters[1] === 'search') {
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

    /**
     */
    if ($this->_parameters[3] === NULL) {
        $limit = 20;
    } else {
        $limit = $this->_parameters[3];
    }

    /**
     * Wywołanie tabeli z bazy
     */
    $this->_table['product']['list'] = $product->_createSoftList($page, $limit);

    // var_dump( $this->_table['product']['list'][0] );

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
} elseif ($this->_parameters[1] === 'delete') {

    // print 'sprawdzamy -> ';
    /**
     * Sprawdzamy, czy został podany parametr "2"
     */
    if ($this->_parameters[2]) {
        // print 'mamy parametr -> ';
        /**
         * Sprawdzamy, czy podany id produktu znajduje się w bazie.
         */
        if ($product->_isExistsByID($this->_parameters[2])) {

            // print 'mamy id -> ';
            /**
             * Możemy zacząć kasować produkt
             */
            if ($status = $product->_statusDeleteSingle($this->_parameters[2])) {

                // print 'kasujemy';

                header("Location: /module/product_technology/product/page/");
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
} else {
    /**
     * W wypadku wyświetlenia dowolnej ze stron
     * pt/product wyświerla listę stron z defaultową
     * pierwszą stroną.
     * Zawiera ona 20 wyników.
     */
    header('Location: /module/product_technology/product/page/1/20');
}