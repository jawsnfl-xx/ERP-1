<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

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