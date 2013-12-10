<?php

namespace Framework\Model {

	use Framework\Base as Base;
	use Framework\Model as Model;

	/**
	 * 
	 * @author Marcin Pyrka
	 *
	 */
	class Test extends Model {
		
		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $_id_test1;
		
		/**
		 * @column
		 * @readwrite
		 * @type text
		 * @length 50
		 */
		protected $_value_of_test1;
	}
}
