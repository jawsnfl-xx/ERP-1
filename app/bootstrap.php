<?php
use Framework\Registry;
/**
 * Bootstrap
 *
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
Registry::set("configuration", $parsed);

/**
 * Manager sesji
 */
$session = new Framework\Session();
Registry::set("session", $session);

/**
 * @TODO:
 * - nawiązać połączenie z bazą danych;
 */

$database = new \Framework\Database();

$database->_options = array(
    "options" => array(
        "host" => "localhost",
        "username" => "root",
        "password" => "",
        "schema" => "test",
        "port" => "3306"
    )
);

Registry::set("database", $database);

// Przykład stosowania połączenia z bazą danych MySQL
// $data = $database->_mysql->fetch_array('SHOW TABLES');

/**
 * Wywołanie Kontrolera dla Application\Controller
 */
$controller = new Application\Controller();
