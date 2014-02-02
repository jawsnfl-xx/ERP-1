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
	class Control_measurements extends Model {

		/**
		 * @column
		 * @readwrite
		 * @primary
		 * @type autonumber
		 */
		protected $id_control_measurements;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $orders_id_orders;

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
		protected $packages_id_packages;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $type_of_control_measurements_id_type_of_control_measurements;

		/**
		 * @column
		 * @readwrite
		 * @type integer
		 *
		 * @var unknown
		 */
		protected $sample_size;

		/**
		 * @column
		 * @readwrite
		 * @type datetime
		 *
		 * @var unknown
		 */
		protected $date_start;

		/**
		 * @column
		 * @readwrite
		 * @type datetime
		 *
		 * @var unknown
		 */
		protected $date_end;
	}
}
