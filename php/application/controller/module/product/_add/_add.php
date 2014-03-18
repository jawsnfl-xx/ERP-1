<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

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