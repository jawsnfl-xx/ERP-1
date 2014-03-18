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
                $this->_table['product']['add']['units'] = $session->getup("product/add/value/units");
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
    
    $this->_table['product']['add']['view'] = $session->getup("product/add/return_value");
    $this->_table['product']['add']['select']['units'] = $session->getup("product/add/value/numberUnits");
    $this->_table['product']['add']['select']['category'] = $session->getup("product/add/value/numberCategory");
} else {
    /**
     * Nie wpisano numeru kroku w pasek adresu
     * Przechodzimy do kroku 1
     */
    header("Location: /module/product_technology/product/add/1");
}