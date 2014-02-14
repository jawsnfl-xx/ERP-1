<?php

/**
 *
 * @author Marcin
 *
 */
namespace Application {

	use Framework\Events as Events;
	use Framework\Registry as Registry;
	use Framework\Session as Session;
	use Framework\Request as Request;
	use Framework\Request\Response as Response;

	/**
	 * framework.cache.initialize.before function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the cache resource
	 *
	 * framework.cache.initialize.after function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the cache resource
	 *
	 * framework.configuration.initialize.before function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the configuration resource
	 *
	 * framework.configuration.initialize.after function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the configuration resource
	 *
	 * framework.controller.construct.before function($name)
	 * $name—The name of the controller class
	 *
	 * framework.controller.construct.after function($name)
	 * $name—The name of the controller class
	 *
	 * framework.controller.render.before function($name)
	 * $name—The name of the controller class
	 *
	 * framework.controller.render.after function($name)
	 * $name—The name of the controller class
	 *
	 * framework.controller.destruct.before function($name)
	 * $name—The name of the controller class
	 *
	 * framework.controller.destruct.after function($name)
	 * $name—The name of the controller class
	 *
	 * framework.database.initialize.before function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the database resource
	 *
	 * framework.database.initialize.after function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the database resource
	 *
	 * framework.request.request.before function($method, $url, $parameters)
	 * $method—The request method (GET, POST, PUT, etc.)
	 * $url—The URL to send the request to
	 * $parameters—Parameters for the request
	 *
	 * framework.request.request.after function($method, $url, $parameters, $response)
	 * $method—The request method (GET, POST, PUT, etc.)
	 * $url—The URL to send the request to
	 * $parameters—Parameters for the request
	 * $response—The response received after making the request
	 *
	 * framework.router.dispatch.before function($url)
	 * $url—The URL to dispatch
	 *
	 * framework.router.dispatch.after function($url, $controller, $action, $parameters)
	 * $url—The URL to dispatch
	 * $controller—The intended controller
	 * $action—The intended action
	 * $parameters—The parameters supplied for the request
	 *
	 * framework.session.initialize.before function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the session resource
	 *
	 * framework.session.initialize.after function($type, $options)
	 * $type—The type of driver required
	 * $options—Initialization options for the session resource
	 *
	 * framework.view.construct.before function($file)
	 * $file—The template file that should be rendered
	 *
	 * framework.view.construct.after function($file, $template)
	 * $file—The template file that should be rendered
	 * $template—The template that was instantiated
	 *
	 * framework.view.render.before function($file)
	 * $file—The template file that should be rendered
	 */

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 *
	 */
	class Controller extends \Framework\Controller {

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );

			/**
			 * WAŻNE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			 * Sprawdzić czy działa to poprawnie i czy popranie przenosi
			 * wewnętrze informacje.
			 */

			/**
			 * object(Framework\Request)[31]
			 * protected '_request' => null
			 * public '_willFollow' => boolean true
			 * protected '_headers' =>
			 * array (size=0)
			 * empty
			 * protected '_options' =>
			 * array (size=0)
			 * empty
			 * protected '_referer' => null
			 * protected '_agent' => string 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36' (length=109)
			 * private '_inspector' (Framework\Base) =>
			 * object(Framework\Inspector)[32]
			 * protected '_class' =>
			 * &object(Framework\Request)[31]
			 * protected '_meta' =>
			 * array (size=3)
			 * 'class' =>
			 * array (size=0)
			 * ...
			 * 'properties' =>
			 * array (size=0)
			 * ...
			 * 'methods' =>
			 * array (size=0)
			 * ...
			 * protected '_properties' =>
			 * array (size=0)
			 * empty
			 * protected '_methods' =>
			 * array (size=0)
			 * empty
			 */
			$request = new Request ();
			// var_dump ( $request );
		}
	}
}
