<?php
/**
 * deleleleleleoooop
 *
 *
 * delelelop
 *
 *
 * deleleleop
 *
 * deleleleleleleeeeeeeeeeeleop
 *
 * fuck you
 * @author Marcin
 *
 */
namespace Application {

	use Framework\Events as Events;
	use Framework\Registry as Registry;
	use Framework\Session as Session;

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
		 * Planowane działanie przy rozłączeniu bazy danych
		 */
			// Events::add("framework.controller.destruct.after", function ($name)
			// {
			// $database = Registry::get("database");
			// });
		}
	}
}
