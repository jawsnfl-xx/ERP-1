<?php

/**
 * Plan rozwoju model/user.php
 * 

        -- -----------------------------------------------------
        -- Table `test`.`users`
        -- -----------------------------------------------------
        DROP TABLE IF EXISTS `test`.`users` ;
        
        CREATE TABLE IF NOT EXISTS `test`.`users` (
          `id_users` INT NOT NULL AUTO_INCREMENT,
          `first_name` VARCHAR(45) NULL,
          `last_name` VARCHAR(45) NULL,
          `password` VARCHAR(45) NULL,
          `key_public` VARCHAR(45) NULL,
          `key_private` VARCHAR(45) NULL,
          `key_salt` VARCHAR(45) NULL,
          `live` INT NULL,
          `deleted` INT NULL,
          `created` DATETIME NULL,
          `modified` DATETIME NULL,
          PRIMARY KEY (`id_users`),
          INDEX `password` (`password` ASC),
          UNIQUE INDEX `key_UNIQUE` (`key_public` ASC),
          UNIQUE INDEX `key_private_UNIQUE` (`key_private` ASC))
        ENGINE = InnoDB;
 * 
 * 
 */
class User extends Framework\Model
{

    /**
     * @column
     * @readwrite
     * @primary
     * @type autonumber
     */
    protected $_id_users;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 45
     */
    protected $_first_name;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 45
     */
    protected $_last_name;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 100
     * @index
     */
    protected $_password;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 100
     * @index
     */
    protected $_key_public;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 100
     * @index
     */
    protected $_key_private;

    /**
     * @column
     * @readwrite
     * @type text
     * @length 100
     * @index
     */
    protected $_key_salt;

    /**
     * @column
     * @readwrite
     * @type integer
     * @index
     */
    protected $_live;

    /**
     * @column
     * @readwrite
     * @type integer
     * @index
     */
    protected $_deleted;

    /**
     * @column
     * @readwrite
     * @type integer
     * @index
     */
    protected $_live;

    /**
     * @column
     * @readwrite
     * @type boolean
     * @index
     */
    protected $_deleted;

    /**
     * @column
     * @readwrite
     * @type datetime
     */
    protected $_created;

    /**
     * @column
     * @readwrite
     * @type datetime
     */
    protected $_modified;
}
