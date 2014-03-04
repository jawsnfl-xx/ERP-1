<?php

/**
 *
 * @author Marcin
 *
 */
namespace Application\Controller {

	use Application\Controller as Controller;
	use Framework\Registry as Registry;
	use Framework\RequestMethods as RequestMethods;

	/**
	 *
	 * @author Marcin
	 *         @NOTE
	 *         W ten sposób można zapisać podstawę działania kontrolerów.
	 *         Za pomocą wpisów w komentarzach przez deklaracją
	 *         można inicjować kolejność kroków i wymagać dla podnoszenia sie funkcji
	 *
	 */
	class Action extends Controller {

		/**
		 * @readwrite
		 */
		protected $_parameters;

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options) {
			/**
			 */
			$this->_parameters = $options ['parameters'];
		}

		/**
		 * @once
		 * @protected
		 *
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::init()
		 */
		public function init() {
			parent::init ();
		}

		/**
		 * @protected
		 *
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::authenticate()
		 */
		public function authenticate() {
			parent::authenticate ();
		}

		/**
		 * @once
		 * @protected
		 *
		 * (non-PHPdoc)
		 *
		 * @see \Application\Controller::notify()
		 */
		public function notify() {
			parent::notify ();
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 */
		public function index() {
			print 'index';
		}

		/**
		 * @before init, authenticate,
		 * @after notify
		 *
		 * @NOTE
		 * ref = references
		 *
		 * @TODO
		 * Dodać wartości ref
		 */
		public function ref() {
			print 'ref';
			if (RequestMethods::get ( "ref" )) {
				header ( 'Location: ' . RequestMethods::get ( "ref" ) );
			} else {
				return new Exception\Argument ( "Invalid function REF parametrs." );
				exit ();
			}
		}

		/**
		 * @before init,
		 * @after notify
		 *
		 * @NOTE
		 * rat = retrying
		 *
		 * @TODO
		 * Dodać wartości ret
		 */
		public function ret() {
			print 'ret';
		}
	}
}