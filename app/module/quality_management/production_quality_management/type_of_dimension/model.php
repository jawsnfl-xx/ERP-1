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
	class Type_of_dimension extends Model {
		
		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $idtype_of_io_operations;
	}
}
