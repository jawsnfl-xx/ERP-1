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
 */
function ini_router()
{
    $router = new Framework\Router(array(
        "url" => isset($_GET["url"]) ? $_GET["url"] : "home/index",
        "extension" => isset($_GET["url"]) ? $_GET["url"] : "html"
    ));
    Framework\Registry::set("router", $router);
    
    /**
     */
    $routes = array(
        array(
            "pattern" => "login",
            "controller" => "users",
            "action" => "login"
        ),
        array(
            "pattern" => "index",
            "controller" => "users",
            "action" => "index"
        ),
        array(
            "pattern" => "logout",
            "controller" => "users",
            "action" => "logout"
        ),
        array(
            "pattern" => "signup",
            "controller" => "users",
            "action" => "signup"
        ),
        array(
            "pattern" => "home/index",
            "controller" => "home",
            "action" => "index"
        ),
        array(
            "pattern" => "settings",
            "controller" => "home",
            "action" => "settings"
        ),
        array(
            "pattern" => "quality_management",
            "controller" => "module",
            "action" => "quality_management"
        ),
        array(
            "pattern" => "product_technology",
            "controller" => "module",
            "action" => "product_technology"
        )
    );
    
    /**
     */
    foreach ($routes as $route) {
        $router->addRoute(new Framework\Router\Route\Regex($route));
    }
    unset($routes);
    
    $router->dispatch();
    
    // var_dump($router);
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
    ini_router();
    
    /**
     * Start kontrolera aplikacji
     */
    $controller = new Application\Controller();
}

/**
 * Wywołanie funkcji bootstrap
 */
ini_bootstrap();
