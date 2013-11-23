<?php

	$configuration = new Framework\Configuration ( array (
			"type" => "ini" 
	) );
	$configuration = $configuration->initialize ();
	$parsed = $configuration->parse ( 'configuration/default_config' );

	class Hello extends Framework\Base {
		/*
		 * @readwrite
		 */
		protected $_world;
		public function setWorld($value) {
			echo "your setter is being called!<br />";
			$this->_world = $value;
		}
		public function getWorld() {
			echo "your getter is being called!<br />";
			return $this->_world;
		}
	}
	$hello = new Hello ();
	$hello->world = "foo!<br />";
	echo $hello->world;


	class Home extends Framework\Controller {
		public function index() {
			echo "here<br />";
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


	$database = new Framework\MySQL( );
	$database->initialize( 'localhost', 'root', '', 'mysql');
	$data = $database->fetch_array( 'SELECT * FROM  `help_topic` LIMIT 0 , 3' );

	var_dump( $data );
