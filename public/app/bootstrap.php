<?php
use Framework as Framework;
use Framework\Configuration;
use Framework\Registry;
use Framework\Database;
use Framework\Session;
function ini_configuration() {
	$configuration = new Framework\Configuration ( array (
			"type" => "ini"
	) );
	$configuration = $configuration->initialize ();
	$parsed = $configuration->parse ( 'configuration/default_config' );
	Framework\Registry::set ( "configuration", $parsed );
}
function ini_database() {
	$database = new Framework\Database ();
	$configuration = Framework\Registry::get ( 'configuration' );

	$database->_options = array (
			"options" => array (
					"host" => ( string ) $configuration->database->default->host,
					"username" => ( string ) $configuration->database->default->username,
					"password" => ( string ) $configuration->database->default->password,
					"schema" => ( string ) $configuration->database->default->schema,
					"port" => ( string ) $configuration->database->default->port
			)
	);
	$database->initialize ();

	Framework\Registry::set ( "database", $database );
}
function ini_session() {
	$session = new Framework\Session ();
	$session = $session->initialize ();
	Framework\Registry::set ( "session", $session );
}
function ini_request() {
	$request = new Framework\Request ();
	Framework\Registry::set ( "request", $request );
}
function ini_bootstrap() {
	ini_configuration ();
	ini_database ();
	ini_session ();
	ini_request ();

	$controller = new Application\Controller ();
}

ini_bootstrap ();