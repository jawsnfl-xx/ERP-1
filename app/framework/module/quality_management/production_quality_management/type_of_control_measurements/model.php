<?php

/**
 *
 * @author Marcin
 *
 */
namespace Framework\Model {

	/**
	 */
	use Framework\Base as Base;
	use Framework\Model as Model;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Type_of_control_measurements extends Model {
		
		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $id_type_of_control_measurements;
	}
}
