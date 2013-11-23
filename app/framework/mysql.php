<?php

namespace Framework {

	class MySQL {
		public $_service;
		public function initialize($host, $user, $pass, $db) {
			$this->_service = new \MySQLi ( $host, $user, $pass, $db );
		}
		public function query($sql) {
			return $this->_service->query ( $sql );
		}
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
