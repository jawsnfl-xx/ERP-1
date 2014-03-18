<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

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