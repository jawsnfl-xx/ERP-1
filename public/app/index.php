﻿<?php
define ( 'APP_DIR', dirname ( realpath ( __FILE__ ) ) );
define ( 'DISPLAY_ERRORS', 1 );
define ( 'MIN_PHP_VERSION', '5.3.7' );
define ( 'DEVELOP_MODE', 0 );
define ( 'BOOTSTRAP_FILE', 'bootstrap.php' );

try {

	error_reporting ( E_ERROR | E_PARSE );
	ini_set ( "display_errors", DISPLAY_ERRORS );

	if (version_compare ( PHP_VERSION, MIN_PHP_VERSION, '<' )) {
		exit ( "PHP version smaller than " . MIN_PHP_VERSION . " !" );
	}

	require_once '../../vendor/autoload.php';
	require_once (BOOTSTRAP_FILE);
} catch ( Exception $e ) {
	$exceptions = array (
			"500" => array (
					"Framework\Cache\Exception",
					"Framework\Cache\Exception\Argument",
					"Framework\Cache\Exception\Implementation",
					"Framework\Cache\Exception\Service",
					"Framework\Configuration\Exception",
					"Framework\Configuration\Exception\Argument",
					"Framework\Configuration\Exception\Implementation",
					"Framework\Configuration\Exception\Syntax",
					"Framework\Controller\Exception",
					"Framework\Controller\Exception\Argument",
					"Framework\Controller\Exception\Implementation",
					"Framework\Core\Exception",
					"Framework\Core\Exception\Argument",
					"Framework\Core\Exception\Implementation",
					"Framework\Core\Exception\Property",
					"Framework\Core\Exception\ReadOnly",
					"Framework\Core\Exception\WriteOnly",
					"Framework\Database\Exception",
					"Framework\Database\Exception\Argument",
					"Framework\Database\Exception\Implementation",
					"Framework\Database\Exception\Service",
					"Framework\Database\Exception\Sql",
					"Framework\Model\Exception",
					"Framework\Model\Exception\Argument",
					"Framework\Model\Exception\Connector",
					"Framework\Model\Exception\Implementation",
					"Framework\Model\Exception\Primary",
					"Framework\Model\Exception\Type",
					"Framework\Model\Exception\Validation",
					"Framework\Request\Exception",
					"Framework\Request\Exception\Argument",
					"Framework\Request\Exception\Implementation",
					"Framework\Request\Exception\Response",
					"Framework\Router\Exception",
					"Framework\Router\Exception\Argument",
					"Framework\Router\Exception\Implementation",
					"Framework\Session\Exception",
					"Framework\Session\Exception\Argument",
					"Framework\Session\Exception\Implementation",
					"Framework\Template\Exception",
					"Framework\Template\Exception\Argument",
					"Framework\Template\Exception\Implementation",
					"Framework\Template\Exception\Parser",
					"Framework\View\Exception",
					"Framework\View\Exception\Argument",
					"Framework\View\Exception\Data",
					"Framework\View\Exception\Implementation",
					"Framework\View\Exception\Renderer",
					"Framework\View\Exception\Syntax"
			),
			"404" => array (
					"Framework\Router\Exception\Action",
					"Framework\Router\Exception\Controller"
			)
	);

	$exception = get_class ( $e );

	header ( "Content-type: text/html" );
	var_dump ( $e );
	echo "An error occurred.";
	exit ();
}