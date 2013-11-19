<?php
/**
 */
error_reporting ( 1 );
ini_set ( 'display_errors', 1 );

/**
 *
 * @param unknown $class        	
 * @throws Exception
 */
function autoload($class) {
	$paths = explode ( PATH_SEPARATOR, get_include_path () );
	$flags = PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE;
	$file = strtolower ( str_replace ( "\\", DIRECTORY_SEPARATOR, trim ( $class, "\\" ) ) ) . ".php";
	foreach ( $paths as $path ) {
		$combined = $path . DIRECTORY_SEPARATOR . $file;
		if (file_exists ( $combined )) {
			include ($combined);
			return;
		}
	}
	//throw new Exception ( "{$class} not found" );
}

/**
 *
 * @author Jet
 *        
 */
class Autoloader {
	
	/**
	 *
	 * @param unknown $class        	
	 */
	public static function autoload($class) {
		autoload ( $class );
	}
}
spl_autoload_register ( 'autoload' );
spl_autoload_register ( array (
		'autoloader',
		'autoload' 
) );

Framework\Core::initialize ();

$configuration = new Framework\Configuration ( array (
		"type" => "ini",
		"options" => array (
				"path" => "/configuration/sample_config.ini",
				"path2" => "test2" 
		) 
) );

Framework\Registry::get ( "configuration" );
$configuration = $configuration->initialize ();

/**
 * Przykład użycia plików konfiguracji
 */
// var_dump ( $configuration );
// var_dump ( $configuration->_data->database );

// /**
// * Przykład wczytywania konfiguracji:
// */

// $configuration = new Framework\Configuration ( array (
// "type" => "ini"
// ) );
// $configuration = $configuration->initialize ( "/configuration.ini" );

// var_dump ( $configuration );

// /**
// *
// * @author Jet
// * Przykłady działania:
// *
// */
// class Home extends Framework\Controller {
// public function index() {
// echo "here";
// }
// }

/** 
 
class Kontroler extends Framework\Controller {
	public function Stronka() {
	}
}

$router = new Framework\Router ();
$router->addRoute ( new Framework\Router\Route\Simple ( array (
		"pattern" => ":name/profile",
		"controller" => "Kontroler",
		"action" => "Stronka" 
) ) );
$router->url = "chris/profile";
$router->dispatch ();

// var_dump ( $router );

$database = new Framework\Database ( array (
		"type" => "mysql",
		"options" => array (
				"host" => "localhost",
				"username" => "erpsystem",
				"password" => "erpsystem",
				"schema" => "erpsystem",
				"port" => "3306" 
		)
) );


print '1asd';
// $database = $database->initialize ();
// var_dump( $database );
// $all = $database->query()->from ( "sample", array ( "text1","text2" ) )->limit ( 100 )->all ();

// $print = print_r($all, true);
*/
