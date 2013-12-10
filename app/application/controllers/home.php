<?php
use Shared\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;

/**
 *
 * @author Marcin Pyrka
 *        
 */
class Home extends Controller {
	
	/**
	 */
	public function index() {
		// $session = Registry::get ( "session" );
		// $user = unserialize ( $session->get ( "user", null ) );
		// if (empty ( $user )) {
		// $user = new StdClass ();
		// $user->first = "Mr.";
		// $user->last = "Smith";
		// }
		// $this->getActionView ()->set ( "user", $user );
		print 'Czesław... :D';
	}
}				
					