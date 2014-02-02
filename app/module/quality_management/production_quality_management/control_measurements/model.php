<?php

namespace Framework\Model {

	use Framework\Base as Base;
	use Framework\Model as Model;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Control_measurements extends Model {
		
		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $_id_test;
	}
}
