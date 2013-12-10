SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`product` ;

CREATE TABLE IF NOT EXISTS `test`.`product` (
  `id_product` INT NOT NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`category` ;

CREATE TABLE IF NOT EXISTS `test`.`category` (
  `id_category` INT NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`category_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`category_product` ;

CREATE TABLE IF NOT EXISTS `test`.`category_product` (
  `category_id_category` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  PRIMARY KEY (`category_id_category`, `product_id_product`),
  INDEX `fk_category_product_product1_idx` (`product_id_product` ASC),
  INDEX `fk_category_product_category_idx` (`category_id_category` ASC),
  CONSTRAINT `fk_category_product_category`
    FOREIGN KEY (`category_id_category`)
    REFERENCES `test`.`category` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_product_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `test`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`orders` ;

CREATE TABLE IF NOT EXISTS `test`.`orders` (
  `id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`type_of_package`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_package` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_package` (
  `id_type_of_package` INT NOT NULL,
  PRIMARY KEY (`id_type_of_package`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`package`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`package` ;

CREATE TABLE IF NOT EXISTS `test`.`package` (
  `id_package` INT NOT NULL,
  `type_of_package_id_type_of_package` INT NOT NULL,
  PRIMARY KEY (`id_package`),
  INDEX `fk_package_type_of_package1_idx` (`type_of_package_id_type_of_package` ASC),
  CONSTRAINT `fk_package_type_of_package1`
    FOREIGN KEY (`type_of_package_id_type_of_package`)
    REFERENCES `test`.`type_of_package` (`id_type_of_package`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`type_of_control_measurements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_control_measurements` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_control_measurements` (
  `id_type_of_control_measurements` INT NOT NULL,
  PRIMARY KEY (`id_type_of_control_measurements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`control_measurements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`control_measurements` ;

CREATE TABLE IF NOT EXISTS `test`.`control_measurements` (
  `id_control_measurements` INT NOT NULL,
  `orders_id_orders` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  `package_id_package` INT NOT NULL,
  `type_of_control_measurements_id_type_of_control_measurements` INT NOT NULL,
  `sample_ size` INT NULL,
  `date_start` DATETIME NULL,
  `date_end` DATETIME NULL,
  PRIMARY KEY (`id_control_measurements`),
  INDEX `fk_control measurements_orders1_idx` (`orders_id_orders` ASC),
  INDEX `fk_control measurements_product1_idx` (`product_id_product` ASC),
  INDEX `fk_control measurements_box1_idx` (`package_id_package` ASC),
  INDEX `fk_control_measurements_type_of_control_measurements1_idx` (`type_of_control_measurements_id_type_of_control_measurements` ASC),
  CONSTRAINT `fk_control measurements_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `test`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_box1`
    FOREIGN KEY (`package_id_package`)
    REFERENCES `test`.`package` (`id_package`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_measurements_type_of_control_measurements1`
    FOREIGN KEY (`type_of_control_measurements_id_type_of_control_measurements`)
    REFERENCES `test`.`type_of_control_measurements` (`id_type_of_control_measurements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`type_of_dimension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_dimension` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_dimension` (
  `id_type_of_dimension` INT NOT NULL,
  `symbol` VARCHAR(45) NULL,
  `glyph` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_of_dimension`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`dimension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`dimension` ;

CREATE TABLE IF NOT EXISTS `test`.`dimension` (
  `id_dimension` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  `type_of_dimension_id_type_of_dimension` INT NOT NULL,
  `value` DECIMAL NULL,
  `tolerance` VARCHAR(45) NULL,
  `interval_max` DECIMAL NULL,
  `interval_min` DECIMAL NULL,
  PRIMARY KEY (`id_dimension`),
  INDEX `fk_dimension_product1_idx` (`product_id_product` ASC),
  INDEX `fk_dimension_type_of_dimension1_idx` (`type_of_dimension_id_type_of_dimension` ASC),
  CONSTRAINT `fk_dimension_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `test`.`product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dimension_type_of_dimension1`
    FOREIGN KEY (`type_of_dimension_id_type_of_dimension`)
    REFERENCES `test`.`type_of_dimension` (`id_type_of_dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`mensuration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`mensuration` ;

CREATE TABLE IF NOT EXISTS `test`.`mensuration` (
  `id_mensuration` INT NOT NULL,
  `measurement_id_measurement` INT NOT NULL,
  `control_measurements_id_control_measurements` INT NOT NULL,
  `dimension_id_dimension` INT NOT NULL,
  `sample_numer` INT NULL,
  `value` DECIMAL NULL,
  PRIMARY KEY (`id_mensuration`),
  INDEX `fk_mensuration_control_measurements1_idx` (`control_measurements_id_control_measurements` ASC),
  INDEX `fk_mensuration_dimension1_idx` (`dimension_id_dimension` ASC),
  CONSTRAINT `fk_mensuration_control_measurements1`
    FOREIGN KEY (`control_measurements_id_control_measurements`)
    REFERENCES `test`.`control_measurements` (`id_control_measurements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensuration_dimension1`
    FOREIGN KEY (`dimension_id_dimension`)
    REFERENCES `test`.`dimension` (`id_dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`employers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employers` ;

CREATE TABLE IF NOT EXISTS `test`.`employers` (
  `id_employers` INT NOT NULL,
  PRIMARY KEY (`id_employers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`orders_progress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`orders_progress` ;

CREATE TABLE IF NOT EXISTS `test`.`orders_progress` (
  `id_orders_progress` INT NOT NULL,
  `orders_id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders_progress`),
  INDEX `fk_orders_progress_orders1_idx` (`orders_id_orders` ASC),
  CONSTRAINT `fk_orders_progress_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
