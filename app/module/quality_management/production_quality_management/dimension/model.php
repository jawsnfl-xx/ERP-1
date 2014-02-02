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
	class Dimension extends Model {

		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $id_dimension;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $products_id_products;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $type_of_dimension_id_type_of_dimension;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $value;

		/**
		 * @column
		 * @readwrite
		 * @type text
		 *
		 * @var unknown
		 */
		protected $tolerance;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $interval_max;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $interval_min;
	}
}
