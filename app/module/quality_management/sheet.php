<?php

/**
 *
 * @author Marcin
 *
 */
namespace Module\Quality_management {

	/**
	 */
	use Module as Module;
	use Module\Quality_management as Quality_management;

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 */
	class Sheet extends Quality_management {

		/**
		 * @readwrite
		 */
		public $_sheet_id;
		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
		}
		public function initialize($_sheet_id = NULL) {
			if ($_sheet_id == NULL) {
			/**
			 * Można rozpocząć tworzenie nowego arkusza...
			 */
			} else {
			/**
			 * Można inicjalizować arkusz, jeśli okaże się, że jest wszystko ok...
			 *
			 * :D
			 */
			}
		}
	}
}