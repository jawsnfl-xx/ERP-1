<?php

namespace Application {

	use Framework\Events as Events;
	use Framework\Registry as Registry;
	use Framework\Session as Session;
	use Framework\Request as Request;
	use Framework\RequestMethods as RequestMethods;

	class Controller extends \Framework\Controller {

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
		}
		public function init() {
			$configuration = Registry::get ( "configuration" );

			$database = Registry::get ( "database" );

			$session = Registry::get ( "session" );
		}
		public function authenticate() {
			$configuration = Registry::get ( "configuration" );

			$database = Registry::get ( "database" );

			$session = Registry::get ( "session" );

			if ($session->getup ( 'user' )) {

				if (RequestMethods::get ( url ) === 'users/index') {
					header ( "Location: /home/index" );
				}
			} elseif (RequestMethods::get ( url ) === 'users/index') {
			} else {
				header ( "Location: /users/index" );
			}
		}
		public function notify() {
			$configuration = Registry::get ( "configuration" );

			$database = Registry::get ( "database" );

			$session = Registry::get ( "session" );
		}
	}
}
