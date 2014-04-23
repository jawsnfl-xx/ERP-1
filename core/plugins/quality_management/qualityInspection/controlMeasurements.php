<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Plugins\Quality_management\QualityInspection {

	use Plugins\Quality_management\QualityInspection as QualityInspection;
	use Plugins\Product_technology\Product as Product;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 * @name ControlMeasurements
	 * @namespace QualityInspection
	 * @uses QualityInspection
	 * @uses Product
	 */
	class ControlMeasurements extends QualityInspection {

		/**
		 * @readwrite
		 */
		public $_id;

		/**
		 *
		 * @param unknown $options
		 */
		public function __construct($options = array()) {
			/**
			 */
			parent::__construct ( $options );
		}

		/**
		 *
		 * @param unknown $param
		 */
		public function _addControlMeasurement($param) {
		}

		/**
		 *
		 * @param unknown $param
		 */
		public function _statusControlMeasurement($param) {
		}
	}
}