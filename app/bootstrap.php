<?php
// use Framework;
// use Framework\Registry as Registry;
// use Framework\Session as Session;
/**
 * Bootstrap
 *
 * !!
 * Ważne
 * Zamykam bootstrap.
 *
 *
 *
 * @version 1
 * @author Marcin Pyrka
 *        
 *         Włączenie rejestracji obiektów.
 *         Dzięki temu dostępne są z każdego poziomu,
 *         przy czym dostęp do nich może być
 *         ograniczany i monitorowany. Można także logować kożystanie
 *         z rejestrowanych obiektów.
 *        
 *         Wczytanie konfiguracji
 *         @TODO przeniesienie wszystkich ustanień do pliku ini
 */
$configuration = new Framework\Configuration(array(
    "type" => "ini"
));

$configuration = $configuration->initialize();
$parsed = $configuration->parse('configuration/default_config');
Framework\Registry::set("configuration", $parsed);

/**
 * Manager sesji
 */
$session = new Framework\Session();
$session = $session->initialize();
$session->setup('test', 'test1');
Framework\Registry::set("session", $session);

/**
 * @TODO:
 * - nawiązać połączenie z bazą danych;
 *
 * @SAMPLE
 * Przykład stosowania połączenia z bazą danych MySQL
 * $data = $database->_mysql->fetch_array('SHOW TABLES');
 */

$database = new Framework\Database();

$database->_options = array(
    "options" => array(
        "host" => "localhost",
        "username" => "root",
        "password" => "",
        "schema" => "test",
        "port" => "3306"
    )
);

Framework\Registry::set("database", $database);

/**
 * Wywołanie Kontrolera dla Application\Controller
 * To ostatni krok w bootstrap.
 * Pozostałe działania muszą być wykonywane
 * w lokalnym kontrolerze oraz kontrolerach akcji i modułów.
 */
$controller = new Application\Controller();
