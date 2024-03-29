<?php

/**
 * @author Marcin Pyrka
 *
 */
namespace Framework\Database {

	use Framework\Database as Database;
	use Framework\Database\Exception as Exception;
	use Framework\ArrayMethods as ArrayMethods;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class MySQL extends Database {

		/**
		 *
		 * @var unknown
		 */
		protected $_service;

		/*
		 * protected $_host; protected $_username; protected $_password; protected $_schema; protected $_port;
		 */
		protected $_isConnected = false;

		/**
		 * @var unknown
		 */
		public $_query;

		/**
		 */
		public function query($_query) {
		}

		/**
		 *
		 * @param unknown $_options
		 * @throws Exception\Service
		 * @return \Framework\Database\MySQL
		 */
		public function connect($_options) {
			$this->_service = new \MySQLi ( $_options ['options'] ['host'], $_options ['options'] ['username'], $_options ['options'] ['password'], $_options ['options'] ['schema'], $_options ['options'] ['port'] );
			if ($this->_service->connect_error) {
				throw new Exception\Service ( "Unable to connect to service" );
			}
			$this->_isConnected = true;
			return $this;
		}

		/**
		 *
		 * @param unknown $sql
		 */
		public function execute($sql) {
			return $this->_service->query ( $sql );
		}

		/**
		 *
		 * @param unknown $value
		 */
		public function escape($value) {
			return $this->_service->real_escape_string ( $value );
		}

		/**
		 */
		public function getLastInsertId() {
			return $this->_service->insert_id;
		}

		/**
		 */
		public function getAffectedRows() {
			return $this->_service->affected_rows;
		}

		/**
		 */
		public function getLastError() {
			return $this->_service->error;
		}

		/**
		 *
		 * @param unknown $sql
		 * @return multitype:NULL
		 */
		/**
		 *
		 * @param unknown $sql
		 */
		public function fetch_array($sql) {
			$result = $this->_service->query ( $sql );

			$rows = array ();

			for($i = 0; $i < $result->num_rows; $i ++) {
				$rows [] = $result->fetch_array ( MYSQLI_ASSOC );
			}
			return $rows;
		}
	}
}
