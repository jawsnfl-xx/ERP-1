<?php

/**
 * 
 * @author Jet
 *
 */
class Controller {
	
	/**
	 *
	 * @var unknown
	 */
	private $actions;

	/**
	 *
	 * @var unknown
	 */
	private $core_name;
	
	/**
	 *
	 * @var unknown
	 */
	private $module_name;
	
	/**
	 *
	 * @var unknown
	 */
	private $action_name;


	/**
	 *
	 * @var unknown
	 */
	private $core_names;
	
	/**
	 *
	 * @var unknown
	 */
	private $module_names;
	
	/**
	 *
	 * @var unknown
	 */
	private $action_names;
	
	/**
	 *
	 * @param unknown $vars        	
	 */
	public function setDefaultUrl($vars) {
		if (empty ( $_GET )) {
			foreach ( $vars as $k => $v ) {
				$_GET [$k] = $v;
			}
		}
	}
	
	/**
	 *
	 * @param unknown $vars        	
	 */
	public function __construct($vars = array()) {
		$this->setDefaultUrl ( $vars );
		$this->module_names = glob ( 'modules/*' );
		$tmp = count ( $this->module_names );
		
		for($i = 0; $i < $tmp; $i ++) {
			$this->module_names [$i] = str_replace ( 'modules/', '', $this->module_names [$i] );
		}
		
		$this->module_name = 'main';
		
		if (isset ( $_GET ['module'] ) && in_array ( $_GET ['module'], $this->module_names )) {
			$this->module_name = $_GET ['module'];
		}
		
		require_once 'modules/' . $this->module_name . '/actions.class.php';
		
		$methods = get_class_methods ( 'Actions' );
		
		$this->action_names = array ();
		
		foreach ( $methods as $method ) 

		{
			
			if (preg_match ( '/^execute_([a-zA-Z0-9_]+)$/', $method, 

			$m )) 

			{
				
				$this->action_names [] = $m [1];
			}
		}
		
		$this->action_name = '404';
		
		if (empty ( $_GET )) 

		{
			
			$this->action_name = 'home';
		} else 

		if (isset ( $_GET ['action'] ) && 

		in_array ( $_GET ['action'], $this->action_names )) 

		{
			
			$this->action_name = $_GET ['action'];
		}
		
		$this->actions = new Actions ();
	}
	
	/**
	 */
	public function dispatch() {
		$this->actions->setCore ( $this->core_name );
		
		$this->actions->setModule ( $this->module_name );
		
		$this->actions->setAction ( $this->action_name );
		
		$method_name = 'execute_' . $this->action_name;
		
		$this->actions->$method_name ();
		
		$this->actions->display ();
		
		exit ();
	}
}

