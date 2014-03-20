<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

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