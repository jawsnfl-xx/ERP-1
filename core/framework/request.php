<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Framework {

	use Framework\Base as Base;
	use Framework\StringMethods as StringMethods;
	use Framework\RequestMethods as RequestMethods;
	use Framework\Request\Exception as Exception;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Request extends Base {

		/**
		 *
		 * @var unknown
		 */
		protected $_request;

		/**
		 * * @readwrite
		 */
		public $_willFollow = true;

		/**
		 * * @readwrite
		 */
		protected $_headers = array ();

		/**
		 * * @readwrite
		 */
		protected $_options = array ();

		/**
		 * * @readwrite
		 */
		protected $_referer;

		/**
		 * * @readwrite
		 */
		protected $_agent;

		/**
		 * (non-PHPdoc)
		 *
		 * @see \Framework\Base::_getExceptionForImplementation()
		 */
		protected function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} not implemented" );
		}

		/**
		 *
		 * @return \Framework\Request\Exception\Argument
		 */
		protected function _getExceptionForArgument() {
			return new Exception\Argument ( "Invalid argument" );
		}

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
			$this->setAgent ( RequestMethods::server ( "HTTP_USER_AGENT", "Curl/PHP " . PHP_VERSION ) );
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 */
		public function delete($url, $parameters = array()) {
			return $this->request ( "DELETE", $url, $parameters );
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 */
		function get($url, $parameters = array()) {
			if (! empty ( $parameters )) {
				$url .= StringMethods::indexOf ( $url, "?" ) ? "&" : "?";
				$url .= is_string ( $parameters ) ? $parameters : http_build_query ( $parameters, "", "&" );
			}
			return $this->request ( "GET", $url );
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 */
		function head($url, $parameters = array()) {
			return $this->request ( "HEAD", $url, $parameters );
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 */
		function post($url, $parameters = array()) {
			return $this->request ( "POST", $url, $parameters );
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 */
		function put($url, $parameters = array()) {
			return $this->request ( "PUT", $url, $parameters );
		}

		/**
		 *
		 * @param unknown $method
		 * @param unknown $url
		 * @param unknown $parameters
		 * @throws Exception\Response
		 * @return Ambigous <\Framework\Request\Response, mixed>
		 */
		function request($method, $url, $parameters = array()) {
			$request = $this->_request = curl_init ();
			if (is_array ( $parameters )) {
				$parameters = http_build_query ( $parameters, "", "&" );
			}
			$this->_setRequestMethod ( $method )->_setRequestOptions ( $url, $parameters )->_setRequestHeaders ();
			$response = curl_exec ( $request );
			if ($response) {
				$response = new Request\Response ( array (
						"response" => $response
				) );
			} else {
				throw new Exception\Response ( curl_errno ( $request ) . ' - ' . curl_error ( $request ) );
			}
			curl_close ( $request );
			return $response;
		}

		/**
		 *
		 * @param unknown $key
		 * @param unknown $value
		 * @return \Framework\Request
		 */
		protected function _setOption($key, $value) {
			curl_setopt ( $this->_request, $key, $value );
			return $this;
		}

		/**
		 *
		 * @param unknown $key
		 * @return string
		 */
		protected function _normalize($key) {
			return "CURLOPT_" . str_replace ( "CURLOPT_", "", strtoupper ( $key ) );
		}

		/**
		 *
		 * @param unknown $method
		 * @return \Framework\Request
		 */
		protected function _setRequestMethod($method) {
			switch (strtoupper ( $method )) {
				case "HEAD" :
					$this->_setOption ( CURLOPT_NOBODY, true );
					break;
				case "GET" :
					$this->_setOption ( CURLOPT_HTTPGET, true );
					break;
				case "POST" :
					$this->_setOption ( CURLOPT_POST, true );
					break;
				default :
					$this->_setOption ( CURLOPT_CUSTOMREQUEST, $method );
					break;
			}
			return $this;
		}

		/**
		 *
		 * @param unknown $url
		 * @param unknown $parameters
		 * @return \Framework\Request
		 */
		protected function _setRequestOptions($url, $parameters) {
			$this->_setOption ( CURLOPT_URL, $url )->_setOption ( CURLOPT_HEADER, true )->_setOption ( CURLOPT_RETURNTRANSFER, true )->_setOption ( CURLOPT_USERAGENT, $this->getAgent () );
			if (! empty ( $parameters )) {
				$this->_setOption ( CURLOPT_POSTFIELDS, $parameters );
			}
			if ($this->getWillFollow ()) {
				$this->_setOption ( CURLOPT_FOLLOWLOCATION, true );
			}
			if ($this->getReferer ()) {
				$this->_setOption ( CURLOPT_REFERER, $this->getReferer () );
			}
			foreach ( $this->_options as $key => $value ) {
				$this->_setOption ( constant ( $this->_normalize ( $key ) ), $value );
			}
			return $this;
		}

		/**
		 *
		 * @return \Framework\Request
		 */
		protected function _setRequestHeaders() {
			$headers = array ();
			foreach ( $this->getHeaders () as $key => $value ) {
				$headers [] = $key . ': ' . $value;
			}
			$this->_setOption ( CURLOPT_HTTPHEADER, $headers );
			return $this;
		}
	}
}