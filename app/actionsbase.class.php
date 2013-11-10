<?php

/**
 * 
 * @author Jet
 *
 */
class ActionsBase {
	
	/**
	 *
	 * @var unknown
	 */
	private $s;
	
	/**
	 *
	 * @var unknown
	 */
	protected $core;
	
	/**
	 *
	 * @var unknown
	 */
	protected $module;
	
	/**
	 *
	 * @var unknown
	 */
	protected $action;
	
	/**
	 */
	public function __construct() {
		$this->s = new Smarty ();
	}
	
	/**
	 */
	public function display() {
		$this->set ( 'core', $this->core );
		$this->set ( 'module', $this->module );
		$this->set ( 'action', $this->action );
		$this->s->display ( 'index.tpl' );
	}
	
	/**
	 *
	 * @param unknown $m        	
	 */
	public function setCore($c) {
		$this->core = $c;
	}
	/**
	 *
	 * @param unknown $m        	
	 */
	public function setModule($m) {
		$this->module = $m;
	}
	
	/**
	 *
	 * @param unknown $a        	
	 */
	public function setAction($a) {
		$this->action = $a;
	}
	
	/**
	 *
	 * @param unknown $name        	
	 * @param unknown $value        	
	 */
	public function set($name, $value) {
		$this->s->assign ( $name, $value );
	}
	
	/**
	 */
	public function execute_404() {
		header ( 'HTTP/1.x 404 Not Found' );
		$this->action = '404';
		$this->module = 'main';
		$this->display ();
		exit ();
	}
}