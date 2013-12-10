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

/**
 * ****************************************************************************
 * Przykład użycia
 * ****************************************************************************
 *
 * @author Marcin Pyrka
 *        
 * @name Hello
 *      
 *       class Hello extends Framework\Base {
 *      
 *      
 *      
 * @var unknown protected $_world;
 *     
 *     
 *     
 * @name setWorld
 * @param unknown $value
 *        	Wywoływana jest przy zapisaniu wartości dla $_world
 *        	
 *        	
 *        	public function setWorld($value) {
 *        	echo "your setter is being called!<br />";
 *        	$this->_world = $value;
 *        	}
 *        	
 *        	
 * @name getWorld
 * @return unknown Wywoływana jest przy próbie odczytu
 *        
 *         public function getWorld() {
 *         echo "your getter is being called!<br />";
 *         return $this->_world;
 *         }
 *         }
 *         $hello = new Hello ();
 *         $hello->world = "foo!<br />";
 *         echo $hello->world;
 *        
 *        
 */


/**
 * ****************************************************************************
 * Przykład użycia
 * ****************************************************************************
 *
 * @author Marcin Pyrka
 * @name class Home extends Framework\Controller
 *
 */
class Home extends Framework\Controller {
	
	/**
	 * @once
	 * @protected
	 */
	public function init() {
		echo "init<br />";
	}
	
	/**
	 * @protected
	 */
	public function authenticate() {
		echo "authenticate<br />";
	}
	
	/**
	 * @before init, authenticate, init
	 * @after notify
	 */
	public function index() {
		echo "hello world!<br />";
	}
	
	/**
	 * @protected
	 */
	public function notify() {
		echo "notify<br />";
	}
}

$router = new Framework\Router ();
$router->addRoute ( new Framework\Router\Route\Simple ( array (
		"pattern" => ":name/profile",
		"controller" => "home",
		"action" => "index" 
) ) );
$router->url = "chris/profile";
$router->dispatch ();

/**
 * ****************************************************************************
 * Przykład użycia
 * ****************************************************************************
 *
 * @author Marcin Pyrka
 * @name $database
 */
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

/*****************************************************************************/
/**
 * @TODO naprawić rejestrowanie zmiennych
 */
// Registry::set("database", $database->initialize()->connect());
// Registry::set ( "database", $database->_mysql );

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
