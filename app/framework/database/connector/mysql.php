<?php

namespace Framework\Database\Connector {

	use Framework\Database as Database;
	use Framework\Database\Exception as Exception;

	class Mysql extends Database\Connector {
		protected $_service;

		protected $_host;

		protected $_username;

		protected $_password;

		protected $_schema;

		protected $_port = "3306";

		protected $_charset = "utf8";

		protected $_engine = "InnoDB";

		public function __construct($_options) {
			$this->_data = $this->connect( $_options );
			return $this->_data;
		}
		

		protected $_isConnected = false;

		protected function _isValidService() {
			$isEmpty = empty ( $this->_service );
			$isInstance = $this->_service instanceof \MySQLi;	

			if ($this->isConnected && $isInstance && ! $isEmpty) {
				return true;
			}
			else {
				return false;
			}
		}

		public function connect() {

			if (! $this->_isValidService ()) {

				$this->_service = new \MySQLi ( $this->_host, $this->_username, $this->_password, $this->_schema, $this->_port );
				if ($this->_service->connect_error) {
					throw new Exception\Service ( "Unable to connect to service" );
				}
				$this->isConnected = true;
			}
			return $this;
		}

		public function disconnect() {
			if ($this->_isValidService ()) {
				$this->isConnected = false;
				$this->_service->close ();
			}
			return $this;
		}

		public function query() {
			return new Database\Query\Mysql ( array (
					"connector" => $this 
			) );
		}
		
		public function execute($sql) {
			if (! $this->_isValidService ()) {
				throw new Exception\Service ( "Not connected to a valid service" );
			}
			return $this->_service->query ( $sql );
		}

		public function escape($value) {
			if (! $this->_isValidService ()) {
				throw new Exception\Service ( "Not connected to a valid service" );
			}
			return $this->_service->real_escape_string ( $value );
		}

		public function getLastInsertId() {
			if (! $this->_isValidService ()) {
				throw new Exception\Service ( "Not connected to a valid service" );
			}
			return $this->_service->insert_id;
		}

		public function getAffectedRows() {
			if (! $this->_isValidService ()) {
				throw new Exception\Service ( "Not connected to a valid service" );
			}
			return $this->_service->affected_rows;
		}
		
		public function getLastError() {
			if (! $this->_isValidService ()) {
				
				throw new Exception\Service ( "Not connected to a valid service" );
			}
			return $this->_service->error;
		}
	}
}
