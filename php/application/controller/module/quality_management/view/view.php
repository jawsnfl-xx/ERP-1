<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

/**
 * Wyświetla arkusz kontrolny z badania
 */
$this->_table['quality_management']['view'] = $quality_management->_createView($this->_parameters[1]);


// var_dump($controlSheet);