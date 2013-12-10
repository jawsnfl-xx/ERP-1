<?php

namespace Framework {

	use Framework\Base as Base;
	use Framework\Registry as Registry;
	use Framework\Inspector as Inspector;
	use Framework\StringMethods as StringMethods;
	use Framework\Model\Exception as Exception;

	/**
	 *
	 * @author Marcin Pyrka
	 *        
	 */
	class Model extends Base {
		
		/**
		 * @readwrite
		 */
		protected $_table;
		
		/**
		 * @readwrite
		 */
		protected $_connector;
		
		/**
		 * @read
		 */
		protected $_types = array (
				"autonumber",
				"text",
				"integer",
				"decimal",
				"boolean",
				"datetime" 
		);
		
		/**
		 *
		 * @var unknown
		 */
		protected $_columns;
		
		/**
		 *
		 * @var unknown
		 */
		protected $_primary;
		
		/**
		 * (non-PHPdoc)
		 *
		 * @see \Framework\Base::_getExceptionForImplementation()
		 */
		public function _getExceptionForImplementation($method) {
			return new Exception\Implementation ( "{$method} method not implemented" );
		}
		
		/**
		 *
		 * @param unknown $options        	
		 */
		public function __construct($options = array()) {
			parent::__construct ( $options );
			// var_dump ( $this );
			$this->load ();
		}
		
		/**
		 * 
		 */
		public function load() {
			$primary = $this->primaryColumn;
			$raw = $primary ["raw"];
			$name = $primary ["name"];
			$table = $this->getTable ();
			
			if (! empty ( $this->$raw )) {
				print 'as';
				// $previous = $this->connector->query ()->from ( $this->table )->where ( "{$name} = ?", $this->$raw )->first ();
				// if ($previous == null) {
				// throw new Exception\Primary ( "Primary key value invalid" );
				// }
				// foreach ( $previous as $key => $value ) {
				// $prop = "_{$key}";
				// if (! empty ( $previous->$key ) && ! isset ( $this->$prop )) {
				// $this->$key = $previous->$key;
				// }
				// }
			}
			
			// var_dump( $this );
		}
		
		/**
		 * 
		 */
		public function delete() {
			$primary = $this->primaryColumn;
			$raw = $primary ["raw"];
			$name = $primary ["name"];
			if (! empty ( $this->$raw )) {
				return $this->connector->

				query ()->from ( $this->table )->where ( "{$name} = ?", $this->$raw )->delete ();
			}
		}
		
		/**
		 * 
		 * @param unknown $where
		 */
		public static function deleteAll($where = array()) {
			$instance = new static ();
			$query = $instance->connector->query ()->from ( $instance->table );
			foreach ( $where as $clause => $value ) {
				$query->where ( $clause, $value );
			}
			return $query->delete ();
		}
		
		/**
		 * 
		 * @return unknown
		 */
		public function save() {
			$primary = $this->primaryColumn;
			$raw = $primary ["raw"];
			$name = $primary ["name"];
			$query = $this->connector->query ()->from ( $this->table );
			if (! empty ( $this->$raw )) {
				$query->where ( "{$name} = ?", $this->$raw );
			}
			$data = array ();
			foreach ( $this->columns as $key => $column ) {
				if (! $column ["read"]) {
					$prop = $column ["raw"];
					$data [$key] = $this->$prop;
					continue;
				}
				if ($column != $this->primaryColumn && $column) {
					$method = "get" . ucfirst ( $key );
					$data [$key] = $this->$method ();
					continue;
				}
			}
			
			$result = $query->save ( $data );
			if ($result > 0) {
				$this->$raw = $result;
			}
			return $result;
		}
		
		/**
		 * 
		 */
		public function getTable() {
			if (empty ( $this->_table )) {
				$this->_table = strtolower ( StringMethods::singular ( get_class ( $this ) ) );
				$this->_table = str_replace ( 'framework\\model\\', '', $this->_table );
			}
			return $this->_table;
		}
		
		/**
		 * 
		 * @throws Exception\Connector
		 */
		public function getConnector() {
			if (empty ( $this->_connector )) {
				$database = Registry::get ( "database" );
				if (! $database) {
					throw new Exception\Connector ( "No connector availible" );
				}
				$this->_connector = $database->initialize ();
			}
			return $this->_connector;
		}
		
		/**
		 * 
		 * @throws Exception\Type
		 * @throws Exception\Primary
		 * @return NULL|\Framework\unknown
		 */
		public function getColumns() {
			if (empty ( $_columns )) {
				$primaries = 0;
				$columns = array ();
				$class = get_class ( $this );
				$types = $this->types;
				$inspector = new Inspector ( $this );
				$properties = $inspector->getClassProperties ();
				$first = function ($array, $key) {
					if (! empty ( $array [$key] ) && sizeof ( $array [$key] ) == 1) {
						return $array [$key] [0];
					}
					return null;
				};
				
				foreach ( $properties as $property ) {
					$propertyMeta = $inspector->getPropertyMeta ( $property );
					if (! empty ( $propertyMeta ["@column"] )) {
						$name = preg_replace ( "#^_#", "", $property );
						$primary = ! empty ( $propertyMeta ["@primary"] );
						$type = $first ( $propertyMeta, "@type" );
						$length = $first ( $propertyMeta, "@length" );
						$index = ! empty ( $propertyMeta ["@index"] );
						$readwrite = ! empty ( $propertyMeta ["@readwrite"] );
						$read = ! empty ( $propertyMeta ["@read"] ) || $readwrite;
						$write = ! empty ( $propertyMeta ["@write"] ) || $readwrite;
						$validate = ! empty ( $propertyMeta ["@validate"] ) ? $propertyMeta ["@validate"] : false;
						$label = $first ( $propertyMeta, "@label" );
						if (! in_array ( $type, $types )) {
							throw new Exception\Type ( "{$type} is not a valid type" );
						}
						if ($primary) {
							$primaries ++;
						}
						$columns [$name] = array (
								"raw" => $property,
								"name" => $name,
								"primary" => $primary,
								"type" => $type,
								"length" => $length,
								"index" => $index,
								"read" => $read,
								"write" => $write,
								"validate" => $validate,
								"label" => $label 
						);
					}
				}
				if ($primaries !== 1) {
					throw new Exception\Primary ( "{$class} must have exactly one É
								@primary column" );
				}
				$this->_columns = $columns;
			}
			return $this->_columns;
		}
		
		/**
		 * 
		 * @param unknown $name
		 * @return \Framework\unknown|NULL
		 */
		public function getColumn($name) {
			if (! empty ( $this->_columns [$name] )) {
				return $this->_columns [$name];
			}
			return null;
		}
		
		/**
		 * 
		 */
		public function getPrimaryColumn() {
			if (! isset ( $this->_primary )) {
				$primary;
				foreach ( $this->columns as $column ) {
					if ($column ["primary"]) {
						$primary = $column;
						break;
					}
				}
				$this->_primary = $primary;
			}
			return $this->_primary;
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @param unknown $fields
		 * @param É $order
		 * @param string $direction
		 * @return Ambigous <unknown, NULL>
		 */
		public static function first($where = array(), $fields = array("*"), É $order = null, $direction = null) {
			$model = new static ();
			return $model->_first ( $where, $fields, $order, $direction );
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @param unknown $fields
		 * @param É $order
		 * @param string $direction
		 * @return unknown|NULL
		 */
		protected function _first($where = array(), $fields = array("*"), É $order = null, $direction = null) {
			$query = $this->connector->query ()->from ( $this->table, $fields );
			foreach ( $where as $clause => $value ) {
				$query->where ( $clause, $value );
			}
			if ($order != null) {
				$query->order ( $order, $direction );
			}
			
			$first = $query->first ();
			$class = get_class ( $this );
			if ($first) {
				return new $class ( $query->first () );
			}
			return null;
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @param unknown $fields
		 * @param É $order
		 * @param string $direction
		 * @param string $limit
		 * @param string $page
		 * @return multitype:unknown
		 */
		public static function all($where = array(), $fields = array("*"), É $order = null, $direction = null, $limit = null, $page = null) {
			$model = new static ();
			return $model->_all ( $where, $fields, $order, $direction, $limit, $page );
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @param unknown $fields
		 * @param É $order
		 * @param string $direction
		 * @param string $limit
		 * @param string $page
		 * @return multitype:unknown
		 */
		protected function _all($where = array(), $fields = array("*"), É $order = null, $direction = null, $limit = null, $page = null) {
			$query = $this->connector->query ()->from ( $this->table, $fields );
			foreach ( $where as $clause => $value ) {
				$query->where ( $clause, $value );
			}
			if ($order != null) {
				$query->order ( $order, $direction );
			}
			if ($limit != null) {
				$query->limit ( $limit, $page );
			}
			$rows = array ();
			$class = get_class ( $this );
			foreach ( $query->all () as $row ) {
				$rows [] = new $class ( $row );
			}
			return $rows;
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @return number
		 */
		public static function count($where = array()) {
			$model = new static ();
			return $model->_count ( $where );
		}
		
		/**
		 * 
		 * @param unknown $where
		 * @return number
		 */
		protected function _count($where = array()) {
			$query = $this->connector->query ()->from ( $this->table );
			foreach ( $where as $clause => $value ) {
				$query->where ( $clause, $value );
			}
			return $query->count ();
		}
	}
}
