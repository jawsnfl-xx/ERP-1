<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

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
            $this->_table['product']['units'] = $product->_createListUnits();
            $this->_table['product']['category'] = $product->_createListCategory();
            
            /**
             * Obsłuda błędów
             */
            $session = Registry::get("session");
            if ($session->getup("product/add/error")) {
                $this->_table['product']['error'] = TRUE;
                
                if ($session->getup("product/add/error/units")) {} else {
                    $this->_table['product']['unitsSelect'] = $session->getup("product/add/name_valueUnits");
                }
                if ($session->getup("product/add/error/category")) {} else {
                    $this->_table['product']['categorySelect'] = $session->getup("product/add/name_valueCategory");
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
        
        $this->_table['product']['view'] = $session->getup("product/add/return_value");
        $this->_table['product']['units'] = $session->getup("product/add/name_valueUnits");
        $this->_table['product']['category'] = $session->getup("product/add/name_valueCategory");
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
    } elseif ($this->_parameters[2] === '2') {
        
        /**
         * No to kontrolujemy stronę 2 dodawania nowego produktu
         */
        $_units_id_units = RequestMethods::post('units_id_units');
        $_category_product = RequestMethods::post('category_product');
        
        // var_dump($_units_id_units);
        // var_dump($_category_product);
        
        if (empty($_units_id_units) or $_units_id_units === '--') {
            $session = Registry::get("session");
            $session->setup("product/add/error", "emptyValue");
            $session->setup("product/add/error/units", "emptyValueUnits");
        } else {
            $session = Registry::get("session");
            $session->setup("product/add/name_valueUnits", $_units_id_units);
        }
        if (empty($_category_product) or $_category_product === '--') {
            $session = Registry::get("session");
            $session->setup("product/add/error", "emptyValue");
            $session->setup("product/add/error/category", "emptyValueCategory");
        } else {
            $session = Registry::get("session");
            $session->setup("product/add/name_valueCategory", $_category_product);
        }
        // var_dump($session->getup("product/add/error"));
        if ($session->getup("product/add/error") === "emptyValue") {
            var_dump($session->getup("product/add/error"));
            var_dump($session->getup("product/add/name_valueUnits"));
            var_dump($session->getup("product/add/name_valueCategory"));
            // print '2';
            header("Location: /module/product_technology/product/add/2");
        } else {
            var_dump($session->getup("product/add/error"));
            var_dump($session->getup("product/add/name_valueUnits"));
            var_dump($session->getup("product/add/name_valueCategory"));
            // print '3';
            header("Location: /module/product_technology/product/add/3");
        }
    } elseif ($this->_parameters[2] === '3') {
    
    /**
     * No to mamy krok 3 - podsumowanie
     */
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