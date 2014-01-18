<?php

/**
 * Bootstrap
 * @version 0.2
 * @author Marcin Pyrka
 */

/**
 * Wczytanie konfiguracji
 * @TODO przeniesienie wszystkich ustanień do pliku ini
 */
$configuration = new Framework\Configuration(array(
    "type" => "ini"
));

$configuration = $configuration->initialize();
$parsed = $configuration->parse('configuration/default_config');

/**
 * Manager sesji
 */
$session = new Framework\Session();

/**
 * Wywołanie Kontrolera dla Application\Controller
 */
$controller = new Application\Controller();