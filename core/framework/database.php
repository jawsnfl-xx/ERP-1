<?php
namespace Framework {

	use Framework\Base as Base;
	use Framework\Database as Database;
	use Framework\Database\Exception as Exception;
	use Framework\Database\ORM;
	use Framework\Database\MySQL;

	/**
	 *
	 * @author Marcin 'jetAlone' Pyrka, pyrka.marcin@gmail.com
	 */
	class Database extends Base {

		/**
		 *
		 * @var unknown
		 */
		public $_options;

		/**
		 *
		 * @var unknown
		 */
		public $_mysql;

		/**
		 *
		 * @var unknown
		 */
		public $_orm;

		/**
		 *
		 * @var unknown
		 */
		public $_dbal;

		/**
		 */
		public function initialize() {
			
			/**
			 * Inicjowanie połączenia z bazą MySQL przez MySQLi
			 */
			$this->_mysql = new Database\MySQL();
			$this->_mysql->connect($this->_options);
			
			/**
			 * Inicjowanie połączenia z bazą MySQL przez DBAL
			 */
			// $this->_orm = new Database\ORM($this->_options);
			
			/**
			 * Inicjowanie połączenia z bazą MySQL przez DBAL
			 */
			$this->_dbal = new Database\DBAL($this->_options);
		}
	}
}
