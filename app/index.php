<?php

/**
 * 
 */
error_reporting ( 1 );
ini_set ( 'display_errors', 1 );
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
class Autoloader {
	public static function autoload($class) {
		autoload ( $class );
	}
}
spl_autoload_register ( 'autoload' );
spl_autoload_register ( array (
		'autoloader',
		'autoload' 
) );

/**
 * 
 * @author Jet
 * @example
 *
 */
class Hello extends Framework\Base {
	/*
	 * @readwrite
	 */
	protected $_world;
	public function setWorld($value) {
		echo "your setter is being called!";
		$this->_world = $value;
	}
	public function getWorld() {
		echo "your getter is being called!";
		return $this->_world;
	}
}
$hello = new Hello ();
$hello->world = "foo!";
echo $hello->world;