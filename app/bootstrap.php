<?php

/**
 * Inicjalizacja koncuguracji.
 * @TODO przenieść wszystkie stałe i zmienne do plików *.ini.
 */
$configuration = new Framework\Configuration ( array (
		"type" => "ini" 
) );
$configuration = $configuration->initialize ();
$parsed = $configuration->parse ( 'configuration/default_config' );

// class Hello extends Framework\Base {
// protected $_world;
// public function setWorld($value) {
// echo "your setter is being called!<br />";
// $this->_world = $value;
// }
// public function getWorld() {
// echo "your getter is being called!<br />";
// return $this->_world;
// }
// }
// $hello = new Hello ();
// $hello->world = "foo!<br />";
// echo $hello->world;
// class Home extends Framework\Controller {
// public function index() {
// echo "here<br />";
// }
// }

// $router = new Framework\Router ();
// $router->addRoute ( new Framework\Router\Route\Simple ( array (
// "pattern" => ":name/profile",
// "controller" => "home",
// "action" => "index"
// ) ) );
// $router->url = "chris/profile";
// $router->dispatch ();

$database = new Framework\Database ();

$database->_options = array (
		"options" => array (
				"host" => "localhost",
				"username" => "root",
				"password" => "",
				"schema" => "test",
				"port" => "3306" 
		) 
);

$database->initialize ();
// Pryzkad stosowania połączenia z bazą danych MySQL
// $data = $database->_mysql->fetch_array ( 'DESCRIBE test1' );
// var_dump ( $data );

// $user = new Test(array( "connector" => $database->_mysql ));
$test = new Framework\Model\Test ( array (
		"connector" => $database->_mysql 
) );

// Połączenie z bazą z którego rozwoju tymczasowo rezygnuję.
// Wrócę do tematu w przyszłości.

// $database = new Framework\Database ();

// $database->_options = array (
// 		"options" => array (
// 				"host" => "localhost",
// 				"username" => "root",
// 				"password" => "",
// 				"schema" => "test",
// 				"port" => "3306" 
// 		) 
// );

// $database->initialize ();
// $database->_mysql->connect ( $database->_options );
// // $database->_mysql->connect( );

// $all = $database->_mysql->query ( 'SHOW TABLES' );

// var_dump( $all );

// // var_dump ( $database );
