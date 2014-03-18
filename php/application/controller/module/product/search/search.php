<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

/**
 */
$_keywords = RequestMethods::post('number');
$this->_table['product']['search'] = $_keywords;

$this->_table['product']['listSearch'] = $product->_createListSearch($_keywords);