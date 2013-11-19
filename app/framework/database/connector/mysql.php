<?php


namespace Framework\Database\Connector
{
use Framework\Database as Database;

use Framework\Database\Exception as Exception;
class Mysql extends Database\Connector
{
protected $_service;
/**
* @readwrite
*/
protected $_host;
/**
* @readwrite
*/
protected $_username;
/**
* @readwrite
*/
protected $_password;
/**
* @readwrite
*/
protected $_schema;
/**
* @readwrite
*/
protected $_port = "3306";
/**
* @readwrite
*/
protected $_charset = "utf8";
/**
* @readwrite
*/
protected $_engine = "InnoDB";
/**
* @readwrite
*/
protected $_isConnected = false;
// checks if connected to the database
protected function _isValidService()
{
$isEmpty = empty($this->_service);
$isInstance = $this->_service instanceof \MySQLi;



if ($this->isConnected && $isInstance && !$isEmpty)
{
return true;
}
return false;
}
// connects to the database
public function connect()
{
if (!$this->_isValidService())
{
$this->_service = new \MySQLi(
$this->_host,
$this->_username,
$this->_password,
$this->_schema,
$this->_port
);
if ($this->_service->connect_error)
{
throw new Exception\Service("Unable to connect to service");
}
$this->isConnected = true;
}
return $this;
}
// disconnects from the database
public function disconnect()
{
if ($this->_isValidService())
{
$this->isConnected = false;
$this->_service->close();
}
return $this;
}
// returns a corresponding query instance
public function query()
{
return new Database\Query\Mysql(array(
"connector" => $this
));
}