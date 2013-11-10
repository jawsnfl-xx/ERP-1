<?php

/**
 * 
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
	throw new Exception ( "{$class} not found" );
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

class Home extends Framework\Controller {
	public function index() {
		echo "here";
	}
}


class Kontroler extends Framework\Controller {
	public function Stronka() {
		echo "To jest treść stronki";
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