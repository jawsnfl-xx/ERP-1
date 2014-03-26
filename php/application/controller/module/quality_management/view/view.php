<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\ArrayMethods as ArrayMethods;
use Framework\View;
use Framework\Request;

/**
 * Wyświetla arkusz kontrolny z badania
 */
$this->_table['quality_management']['view'] = ArrayMethods::clean($quality_management->_createView($this->_parameters[1]));
// var_dump($this->_table['quality_management']['view']);
/**
 * Tymczasowo ładowany widok ControlSheet.
 * Do rozbudowy.
 */
$controlSheet = new \Plugins\Quality_management\QualityInspection\ControlMeasurements\ControlSheet();
// var_dump($controlSheet);