<?php
namespace Framework\Database
{

    use Framework\Base as Base;
    use Framework\ArrayMethods as ArrayMethods;
    use Framework\MySQL\Exception as Exception;

    class Query extends Base
    {

        /**
         * @readwrite
         */
        protected $_connector;

        /**
         * @read
         */
        protected $_from;

        /**
         * @read
         */
        protected $_fields;

        /**
         * @read
         */
        protected $_limit;

        /**
         * @read
         */
        protected $_offset;

        /**
         * @read
         */
        protected $_order;

        /**
         * @read
         */
        protected $_direction;

        /**
         * @read
         */
        protected $_join = array();

        /**
         * @read
         */
        protected $_where = array();

        /**
         * (non-PHPdoc)
         *
         * @see \Framework\Base::_getExceptionForImplementation()
         */
        /**
         * (non-PHPdoc)
         *
         * @see \Framework\Base::_getExceptionForImplementation()
         */
        protected function _getExceptionForImplementation($method)
        {
            return new Exception\Implementation("{$method} method not implemented");
        }

        /**
         *
         * @param unknown $value            
         * @return string number
         */
        protected function _quote($value)
        {
            if (is_string($value)) {
                $escaped = $this->connector->escape($value);
                return "'{$escaped}'";
            }
            if (is_array($value)) {
                $buffer = array();
                foreach ($value as $i) {
                    array_push($buffer, $this->_quote($i));
                }
                $buffer = join(", ", $buffer);
                return "({$buffer})";
            }
            if (is_null($value)) {
                return "NULL";
            }
            if (is_bool($value)) {
                return (int) $value;
            }
            return $this->connector->escape($value);
        }

        /**
         *
         * @param unknown $from            
         * @param unknown $fields            
         * @throws Exception\Argument
         * @return \Framework\MySQL\Query
         */
        public function from($from, $fields = array("*"))
        {
            print 'help_topic3 from';
            
            if (empty($from)) {
                throw new Exception\Argument("Invalid argument");
            }
            $this->_from = $from;
            if ($fields) {
                $this->_fields[$from] = $fields;
            }
            print 'help_topic4 from';
            return $this;
        }

        /**
         *
         * @param unknown $join            
         * @param unknown $on            
         * @param unknown $fields            
         * @throws Exception\Argument
         * @return \Framework\MySQL\Query
         */
        public function join($join, $on, $fields = array())
        {
            print 'help_topic4 join';
            if (empty($join)) {
                throw new Exception\Argument("Invalid argument");
            }
            if (empty($on)) {
                throw new Exception\Argument("Invalid argument");
            }
            $this->_fields += array(
                $join => $fields
            );
            $this->_join[] = "JOIN {$join} ON {$on}";
            print 'help_topic4 join';
            return $this;
        }

        /**
         *
         * @param unknown $limit            
         * @param number $page            
         * @throws Exception\Argument
         * @return \Framework\MySQL\Query
         */
        public function limit($limit, $page = 1)
        {
            if (empty($limit)) {
                throw new Exception\Argument("Invalid argument");
            }
            $this->_limit = $limit;
            $this->_offset = $limit * ($page - 1);
            return $this;
        }

        /**
         *
         * @param unknown $order            
         * @param string $direction            
         * @throws Exception\Argument
         * @return \Framework\MySQL\Query
         */
        public function order($order, $direction = "asc")
        {
            if (empty($order)) {
                throw new Exception\Argument("Invalid argument");
            }
            $this->_order = $order;
            $this->_direction = $direction;
            return $this;
        }

        /**
         *
         * @throws Exception\Argument
         * @return \Framework\MySQL\Query
         */
        public function where()
        {
            $arguments = func_get_args();
            if (sizeof($arguments) < 1) {
                throw new Exception\Argument("Invalid argument");
            }
            $arguments[0] = preg_replace("#\?#", "%s", $arguments[0]);
            foreach (array_slice($arguments, 1, null, true) as $i => $parameter) {
                $arguments[$i] = $this->_quote($arguments[$i]);
            }
            $this->_where[] = call_user_func_array("sprintf", $arguments);
            return $this;
        }

        /**
         *
         * @return string
         */
        protected function _buildSelect()
        {
            $fields = array();
            $where = $order = $limit = $join = "";
            $template = "SELECT %s FROM %s %s %s %s %s";
            foreach ($this->fields as $table => $_fields) {
                foreach ($_fields as $field => $alias) {
                    if (is_string($field)) {
                        $fields[] = "{$field} AS {$alias}";
                    } else {
                        $fields[] = $alias;
                    }
                }
            }
            $fields = join(", ", $fields);
            $_join = $this->join;
            if (! empty($_join)) {
                $join = join(" ", $_join);
            }
            $_where = $this->where;
            if (! empty($_where)) {
                $joined = join(" AND ", $_where);
                $where = "WHERE {$joined}";
            }
            $_order = $this->order;
            if (! empty($_order)) {
                $_direction = $this->direction;
                $order = "ORDER BY {$_order} {$_direction}";
            }
            $_limit = $this->limit;
            if (! empty($_limit)) {
                $_offset = $this->offset;
                if ($_offset) {
                    $limit = "LIMIT {$_limit}, {$_offset}";
                } else {
                    $limit = "LIMIT {$_limit}";
                }
            }
            return sprintf($template, $fields, $this->from, $join, $where, $order, $limit);
        }

        /**
         *
         * @param unknown $data            
         * @return string
         */
        protected function _buildInsert($data)
        {
            $fields = array();
            $values = array();
            $template = "INSERT INTO '%s' ('%s') VALUES (%s)";
            foreach ($data as $field => $value) {
                $fields[] = $field;
                $values[] = $this->_quote($value);
            }
            $fields = join("', '", $fields);
            $values = join(", ", $values);
            return sprintf($template, $this->from, $fields, $values);
        }

        /**
         *
         * @param unknown $data            
         * @return string
         */
        protected function _buildUpdate($data)
        {
            $parts = array();
            $where = $limit = "";
            $template = "UPDATE %s SET %s %s %s";
            foreach ($data as $field => $value) {
                $parts[] = "{$field} = " . $this->_quote($value);
            }
            $parts = join(", ", $parts);
            $_where = $this->where;
            if (! empty($_where)) {
                $joined = join(", ", $_where);
                $where = "WHERE {$joined}";
            }
            $_limit = $this->limit;
            if (! empty($_limit)) {
                $_offset = $this->offset;
                $limit = "LIMIT {$_limit} {$_offset}";
            }
            return sprintf($template, $this->from, $parts, $where, $limit);
        }

        /**
         *
         * @return string
         */
        protected function _buildDelete()
        {
            $where = $limit = "";
            $template = "DELETE FROM %s %s %s";
            $_where = $this->where;
            if (! empty($_where)) {
                $joined = join(", ", $_where);
                $where = "WHERE {$joined}";
            }
            $_limit = $this->limit;
            if (! empty($_limit)) {
                $_offset = $this->offset;
                $limit = "LIMIT {$_limit} {$_offset}";
            }
            return sprintf($template, $this->from, $where, $limit);
        }

        /**
         *
         * @param unknown $data            
         * @throws Exception\Sql
         * @return number
         */
        public function save($data)
        {
            $isInsert = sizeof($this->_where) == 0;
            if ($isInsert) {
                $sql = $this->_buildInsert($data);
            } else {
                $sql = $this->_buildUpdate($data);
            }
            $result = $this->_connector->execute($sql);
            if ($result === false) {
                throw new Exception\Sql();
            }
            if ($isInsert) {
                return $this->_connector->lastInsertId;
            }
            return 0;
        }

        /**
         *
         * @throws Exception\Sql
         */
        public function delete()
        {
            $sql = $this->_buildDelete();
            $result = $this->_connector->execute($sql);
            if ($result === false) {
                throw new Exception\Sql();
            }
            return $this->_connector->affectedRows;
        }

        /**
         *
         * @return unknown
         */
        public function first()
        {
            $limit = $this->_limit;
            $offset = $this->_offset;
            $this->limit(1);
            $all = $this->all();
            $first = ArrayMethods::first($all);
            if ($limit) {
                $this->_limit = $limit;
            }
            if ($offset) {
                $this->_offset = $offset;
            }
            return $first;
        }

        /**
         *
         * @return \Framework\MySQL\unknown
         */
        public function count()
        {
            $limit = $this->limit;
            $offset = $this->offset;
            $fields = $this->fields;
            $this->_fields = array(
                $this->from => array(
                    "COUNT(1)" => "rows"
                )
            );
            $this->limit(1);
            $row = $this->first();
            $this->_fields = $fields;
            if ($fields) {
                $this->_fields = $fields;
            }
            if ($limit) {
                $this->_limit = $limit;
            }
            if ($offset) {
                $this->_offset = $offset;
            }
            return $row["rows"];
        }

        /**
         *
         * @throws Exception\Sql
         * @return multitype:NULL
         */
        public function all($sql)
        {
            $result = $this->_service->execute($sql);
            if ($result === false) {
                $error = $this->_service->lastError;
                throw new Exception\Sql("There was an error with your SQL query: {$error}");
            }
            $rows = array();
            for ($i = 0; $i < $result->num_rows; $i ++) {
                $rows[] = $result->fetch_array(MYSQLI_ASSOC);
            }
            return $rows;
        }

        /**
         * Test
         */
        public function query($sql)
        {
            return $this->all($sql);
        }

        /**
         */
        public function initialize()
        {}
    }
}
