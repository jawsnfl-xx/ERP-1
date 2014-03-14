<?php

/**
 *
 * @name ini_configuration
 *       @TODO
 *       - przenieść wszystkie edytowalne zmienne do pliku default_config
 *      
 */
function ini_configuration()
{
    $configuration = new Framework\Configuration(array(
        "type" => "ini"
    ));
    $configuration = $configuration->initialize();
    $parsed = $configuration->parse('configuration/default_config');
    Framework\Registry::set("configuration", $parsed);
}

/**
 *
 * @name ini_database
 *       @TODO:
 *       - nawiązać połączenie z bazą danych;
 *      
 *      
 *       @SAMPLE
 *       Przykład stosowania połączenia z bazą danych MySQL
 *       $data = $database->_mysql->fetch_array('SHOW TABLES');
 */
function ini_database()
{
    $database = new Framework\Database();
    $configuration = Framework\Registry::get('configuration');
    
    $database->_options = array(
        "options" => array(
            "host" => (string) $configuration->database->default->host,
            "username" => (string) $configuration->database->default->username,
            "password" => (string) $configuration->database->default->password,
            "schema" => (string) $configuration->database->default->schema,
            "port" => (string) $configuration->database->default->port
        )
    );
    $database->initialize();
    
    Framework\Registry::set("database", $database);
}

/**
 *
 * @name ini_session
 */
function ini_session()
{
    $session = new Framework\Session();
    $session = $session->initialize();
    Framework\Registry::set("session", $session);
}

/**
 */
function ini_request()
{
    $request = new Framework\Request();
    Framework\Registry::set("request", $request);
}

/**
 *
 * @name ini_bootstrap
 *      
 *       Inicjalizacja wszystkich funkcji, jakie wymagane są do
 *       poprawnej pracy systemu.
 *      
 *       Wczytanie konfiguracji
 *       @TODO przeniesienie wszystkich ustanień do pliku ini
 */
function ini_bootstrap()
{
    ini_configuration();
    ini_database();
    ini_session();
    ini_request();
    
    /**
     * Start kontrolera aplikacji
     */
    $controller = new Application\Controller();
}

/**
 * Wywołanie funkcji bootstrap
 */
ini_bootstrap();
