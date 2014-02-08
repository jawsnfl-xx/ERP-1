<?php

namespace Module {

	/**
	 *
	 * @author Marcin Pyrka
	 *
	 */
	class Quality_management extends Module {

		/**
		 * @readwrite
		 */
		public $sheet;

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
		}
		// public function view_sheet() {
		// print 'asdasd';
		// $this->sheet = new \Module\Quality_management\Production_quality_management ();
		// return $this->sheet;
		// }
	}
}
