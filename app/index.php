<?php

/**
 * Włączenie raportowania błędów na ekran.
 * @TODO podpięcie tych informacji pod konfigurację
 * @TODO dodanie defaultowych wartości oraz narzędzia kontrolnego
 */
error_reporting ( E_ALL );
ini_set ( "display_errors", 1 );

/**
 * Kontrola wersji
 * @TODO podpięcie tych informacji pod konfigurację
 */
if (version_compare ( PHP_VERSION, '5.3.7', '<' )) {
	exit ( "PHP version smaller than 5.3.7 !" );
}

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
 * @author Marcin Pyrka
 *        
 */
class Autoloader {
	public static function autoload($class) {
		autoload ( $class );
	}
}

/**
 */
spl_autoload_register ( 'autoload' );
spl_autoload_register ( array (
		'autoloader',
		'autoload' 
) );

/**
 */
require_once ('bootstrap.php');