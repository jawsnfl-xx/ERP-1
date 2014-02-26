SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `test` ;
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`units`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`units` ;

CREATE TABLE IF NOT EXISTS `test`.`units` (
  `id_units` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `symbol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_units`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`products` ;

CREATE TABLE IF NOT EXISTS `test`.`products` (
  `id_products` INT NOT NULL,
  `products_name` VARCHAR(45) NOT NULL,
  `units_id_units` INT NOT NULL,
  `units_id_units1` INT NOT NULL,
  PRIMARY KEY (`id_products`),
  CONSTRAINT `fk_products_units1`
    FOREIGN KEY (`units_id_units`)
    REFERENCES `test`.`units` (`id_units`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_units2`
    FOREIGN KEY (`units_id_units1`)
    REFERENCES `test`.`units` (`id_units`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `products_name_UNIQUE` ON `test`.`products` (`products_name` ASC);

CREATE INDEX `fk_products_units1_idx` ON `test`.`products` (`units_id_units` ASC);

CREATE INDEX `fk_products_units2_idx` ON `test`.`products` (`units_id_units1` ASC);


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
  CONSTRAINT `fk_category_product_category`
    FOREIGN KEY (`category_id_category`)
    REFERENCES `test`.`category` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_product_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_category_product_product1_idx` ON `test`.`category_product` (`product_id_product` ASC);

CREATE INDEX `fk_category_product_category_idx` ON `test`.`category_product` (`category_id_category` ASC);


-- -----------------------------------------------------
-- Table `test`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`orders` ;

CREATE TABLE IF NOT EXISTS `test`.`orders` (
  `id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`type_of_packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_packages` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_packages` (
  `id_type_of_packages` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_of_packages`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`type_of_warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_warehouse` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_warehouse` (
  `id_type_of_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_type_of_warehouse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`warehouse` ;

CREATE TABLE IF NOT EXISTS `test`.`warehouse` (
  `id_warehouse` INT NOT NULL,
  `type_of_warehouse_id_type_of_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  CONSTRAINT `fk_warehouse_type_of_warehouse1`
    FOREIGN KEY (`type_of_warehouse_id_type_of_warehouse`)
    REFERENCES `test`.`type_of_warehouse` (`id_type_of_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_warehouse_type_of_warehouse1_idx` ON `test`.`warehouse` (`type_of_warehouse_id_type_of_warehouse` ASC);


-- -----------------------------------------------------
-- Table `test`.`packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`packages` ;

CREATE TABLE IF NOT EXISTS `test`.`packages` (
  `id_packages` INT NOT NULL,
  `type_of_packages_id_type_of_packages` INT NOT NULL,
  `warehouse_id_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_packages`),
  CONSTRAINT `fk_package_type_of_package1`
    FOREIGN KEY (`type_of_packages_id_type_of_packages`)
    REFERENCES `test`.`type_of_packages` (`id_type_of_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse`)
    REFERENCES `test`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_package_type_of_package1_idx` ON `test`.`packages` (`type_of_packages_id_type_of_packages` ASC);

CREATE INDEX `fk_package_warehouse1_idx` ON `test`.`packages` (`warehouse_id_warehouse` ASC);


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
  `products_id_products` INT NOT NULL,
  `packages_id_packages` INT NOT NULL,
  `type_of_control_measurements_id_type_of_control_measurements` INT NOT NULL,
  `sample_size` INT NULL,
  `date_start` DATETIME NULL,
  `date_end` DATETIME NULL,
  PRIMARY KEY (`id_control_measurements`),
  CONSTRAINT `fk_control measurements_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_box1`
    FOREIGN KEY (`packages_id_packages`)
    REFERENCES `test`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_measurements_type_of_control_measurements1`
    FOREIGN KEY (`type_of_control_measurements_id_type_of_control_measurements`)
    REFERENCES `test`.`type_of_control_measurements` (`id_type_of_control_measurements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_control measurements_orders1_idx` ON `test`.`control_measurements` (`orders_id_orders` ASC);

CREATE INDEX `fk_control measurements_product1_idx` ON `test`.`control_measurements` (`products_id_products` ASC);

CREATE INDEX `fk_control measurements_box1_idx` ON `test`.`control_measurements` (`packages_id_packages` ASC);

CREATE INDEX `fk_control_measurements_type_of_control_measurements1_idx` ON `test`.`control_measurements` (`type_of_control_measurements_id_type_of_control_measurements` ASC);


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
  `products_id_products` INT NOT NULL,
  `type_of_dimension_id_type_of_dimension` INT NOT NULL,
  `value` DECIMAL NULL,
  `tolerance` VARCHAR(45) NULL,
  `interval_max` DECIMAL NULL,
  `interval_min` DECIMAL NULL,
  PRIMARY KEY (`id_dimension`),
  CONSTRAINT `fk_dimension_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dimension_type_of_dimension1`
    FOREIGN KEY (`type_of_dimension_id_type_of_dimension`)
    REFERENCES `test`.`type_of_dimension` (`id_type_of_dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_dimension_product1_idx` ON `test`.`dimension` (`products_id_products` ASC);

CREATE INDEX `fk_dimension_type_of_dimension1_idx` ON `test`.`dimension` (`type_of_dimension_id_type_of_dimension` ASC);


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
  `value` INT NULL,
  PRIMARY KEY (`id_mensuration`),
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

CREATE INDEX `fk_mensuration_control_measurements1_idx` ON `test`.`mensuration` (`control_measurements_id_control_measurements` ASC);

CREATE INDEX `fk_mensuration_dimension1_idx` ON `test`.`mensuration` (`dimension_id_dimension` ASC);


-- -----------------------------------------------------
-- Table `test`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`users` ;

CREATE TABLE IF NOT EXISTS `test`.`users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `login` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `key_public` VARCHAR(45) NULL,
  `key_private` VARCHAR(45) NULL,
  `key_salt` VARCHAR(45) NULL,
  `live` INT NULL,
  `deleted` INT NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id_users`))
ENGINE = InnoDB;

CREATE INDEX `password` ON `test`.`users` (`password` ASC);

CREATE UNIQUE INDEX `key_UNIQUE` ON `test`.`users` (`key_public` ASC);

CREATE UNIQUE INDEX `key_private_UNIQUE` ON `test`.`users` (`key_private` ASC);

CREATE UNIQUE INDEX `login_UNIQUE` ON `test`.`users` (`login` ASC);


-- -----------------------------------------------------
-- Table `test`.`employers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employers` ;

CREATE TABLE IF NOT EXISTS `test`.`employers` (
  `id_employers` INT NOT NULL,
  `users_id_users` INT NOT NULL,
  PRIMARY KEY (`id_employers`),
  CONSTRAINT `fk_employers_users1`
    FOREIGN KEY (`users_id_users`)
    REFERENCES `test`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employers_users1_idx` ON `test`.`employers` (`users_id_users` ASC);


-- -----------------------------------------------------
-- Table `test`.`orders_progress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`orders_progress` ;

CREATE TABLE IF NOT EXISTS `test`.`orders_progress` (
  `id_orders_progress` INT NOT NULL,
  `orders_id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders_progress`),
  CONSTRAINT `fk_orders_progress_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_orders_progress_orders1_idx` ON `test`.`orders_progress` (`orders_id_orders` ASC);


-- -----------------------------------------------------
-- Table `test`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`permissions` ;

CREATE TABLE IF NOT EXISTS `test`.`permissions` (
  `id_permissions` INT NOT NULL,
  PRIMARY KEY (`id_permissions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`jobs` ;

CREATE TABLE IF NOT EXISTS `test`.`jobs` (
  `id_jobs` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_jobs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`employers_jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`employers_jobs` ;

CREATE TABLE IF NOT EXISTS `test`.`employers_jobs` (
  `employers_id_employers` INT NOT NULL,
  `jobs_id_jobs` INT NOT NULL,
  PRIMARY KEY (`employers_id_employers`, `jobs_id_jobs`),
  CONSTRAINT `fk_employers_jobs_employers1`
    FOREIGN KEY (`employers_id_employers`)
    REFERENCES `test`.`employers` (`id_employers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employers_jobs_jobs1`
    FOREIGN KEY (`jobs_id_jobs`)
    REFERENCES `test`.`jobs` (`id_jobs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employers_jobs_jobs1_idx` ON `test`.`employers_jobs` (`jobs_id_jobs` ASC);

CREATE INDEX `fk_employers_jobs_employers1_idx` ON `test`.`employers_jobs` (`employers_id_employers` ASC);


-- -----------------------------------------------------
-- Table `test`.`managers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`managers` ;

CREATE TABLE IF NOT EXISTS `test`.`managers` (
  `id_managers` INT NOT NULL,
  `users_id_users` INT NOT NULL,
  PRIMARY KEY (`id_managers`),
  CONSTRAINT `fk_manager_users1`
    FOREIGN KEY (`users_id_users`)
    REFERENCES `test`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_manager_users1_idx` ON `test`.`managers` (`users_id_users` ASC);


-- -----------------------------------------------------
-- Table `test`.`managers_jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`managers_jobs` ;

CREATE TABLE IF NOT EXISTS `test`.`managers_jobs` (
  `managers_id_managers` INT NOT NULL,
  `jobs_id_jobs` INT NOT NULL,
  PRIMARY KEY (`managers_id_managers`, `jobs_id_jobs`),
  CONSTRAINT `fk_managers_jobs_managers1`
    FOREIGN KEY (`managers_id_managers`)
    REFERENCES `test`.`managers` (`id_managers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_managers_jobs_jobs1`
    FOREIGN KEY (`jobs_id_jobs`)
    REFERENCES `test`.`jobs` (`id_jobs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_managers_jobs_jobs1_idx` ON `test`.`managers_jobs` (`jobs_id_jobs` ASC);

CREATE INDEX `fk_managers_jobs_managers1_idx` ON `test`.`managers_jobs` (`managers_id_managers` ASC);


-- -----------------------------------------------------
-- Table `test`.`squads`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`squads` ;

CREATE TABLE IF NOT EXISTS `test`.`squads` (
  `id_squads` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_squads`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`sockets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`sockets` ;

CREATE TABLE IF NOT EXISTS `test`.`sockets` (
  `id_sockets` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sockets`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`guiding_cards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`guiding_cards` ;

CREATE TABLE IF NOT EXISTS `test`.`guiding_cards` (
  `id_guiding_cards` INT NOT NULL,
  `number` INT NULL,
  `year` INT NULL,
  `employers_id_employers` INT NOT NULL,
  `date_open` DATETIME NULL,
  `date_close` DATETIME NULL,
  PRIMARY KEY (`id_guiding_cards`, `employers_id_employers`),
  CONSTRAINT `fk_guiding_cards_employers1`
    FOREIGN KEY (`employers_id_employers`)
    REFERENCES `test`.`employers` (`id_employers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_guiding_cards_employers1_idx` ON `test`.`guiding_cards` (`employers_id_employers` ASC);


-- -----------------------------------------------------
-- Table `test`.`guiding_cards_package`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`guiding_cards_package` ;

CREATE TABLE IF NOT EXISTS `test`.`guiding_cards_package` (
  `guiding_cards_id_guiding_cards` INT NOT NULL,
  `package_id_package` INT NOT NULL,
  PRIMARY KEY (`guiding_cards_id_guiding_cards`, `package_id_package`),
  CONSTRAINT `fk_guiding_cards_package_guiding_cards1`
    FOREIGN KEY (`guiding_cards_id_guiding_cards`)
    REFERENCES `test`.`guiding_cards` (`id_guiding_cards`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_guiding_cards_package_package1`
    FOREIGN KEY (`package_id_package`)
    REFERENCES `test`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_guiding_cards_package_package1_idx` ON `test`.`guiding_cards_package` (`package_id_package` ASC);

CREATE INDEX `fk_guiding_cards_package_guiding_cards1_idx` ON `test`.`guiding_cards_package` (`guiding_cards_id_guiding_cards` ASC);


-- -----------------------------------------------------
-- Table `test`.`contractors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`contractors` ;

CREATE TABLE IF NOT EXISTS `test`.`contractors` (
  `id_contractors` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `shortcut` VARCHAR(45) NULL,
  PRIMARY KEY (`id_contractors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`products_contractors_supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`products_contractors_supplier` ;

CREATE TABLE IF NOT EXISTS `test`.`products_contractors_supplier` (
  `products_id_products` INT NOT NULL,
  `contractors_id_contractors` INT NOT NULL,
  PRIMARY KEY (`products_id_products`, `contractors_id_contractors`),
  CONSTRAINT `fk_product_contractors_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_contractors_contractors1`
    FOREIGN KEY (`contractors_id_contractors`)
    REFERENCES `test`.`contractors` (`id_contractors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_contractors_contractors1_idx` ON `test`.`products_contractors_supplier` (`contractors_id_contractors` ASC);

CREATE INDEX `fk_product_contractors_product1_idx` ON `test`.`products_contractors_supplier` (`products_id_products` ASC);


-- -----------------------------------------------------
-- Table `test`.`package_contractors_recipient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`package_contractors_recipient` ;

CREATE TABLE IF NOT EXISTS `test`.`package_contractors_recipient` (
  `package_id_package` INT NOT NULL,
  `contractors_id_contractors` INT NOT NULL,
  PRIMARY KEY (`package_id_package`, `contractors_id_contractors`),
  CONSTRAINT `fk_package_contractors_package1`
    FOREIGN KEY (`package_id_package`)
    REFERENCES `test`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_contractors_contractors1`
    FOREIGN KEY (`contractors_id_contractors`)
    REFERENCES `test`.`contractors` (`id_contractors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_package_contractors_contractors1_idx` ON `test`.`package_contractors_recipient` (`contractors_id_contractors` ASC);

CREATE INDEX `fk_package_contractors_package1_idx` ON `test`.`package_contractors_recipient` (`package_id_package` ASC);


-- -----------------------------------------------------
-- Table `test`.`dispatch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`dispatch` ;

CREATE TABLE IF NOT EXISTS `test`.`dispatch` (
  `id_dispatch` INT NOT NULL,
  PRIMARY KEY (`id_dispatch`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`dispatch_packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`dispatch_packages` ;

CREATE TABLE IF NOT EXISTS `test`.`dispatch_packages` (
  `dispatch_id_dispatch` INT NOT NULL,
  `packages_id_packages` INT NOT NULL,
  PRIMARY KEY (`dispatch_id_dispatch`, `packages_id_packages`),
  CONSTRAINT `fk_dispatch_package_dispatch1`
    FOREIGN KEY (`dispatch_id_dispatch`)
    REFERENCES `test`.`dispatch` (`id_dispatch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispatch_package_package1`
    FOREIGN KEY (`packages_id_packages`)
    REFERENCES `test`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_dispatch_package_package1_idx` ON `test`.`dispatch_packages` (`packages_id_packages` ASC);

CREATE INDEX `fk_dispatch_package_dispatch1_idx` ON `test`.`dispatch_packages` (`dispatch_id_dispatch` ASC);


-- -----------------------------------------------------
-- Table `test`.`type_of_package_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_package_products` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_package_products` (
  `type_of_package_id_type_of_package` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  PRIMARY KEY (`type_of_package_id_type_of_package`, `products_id_products`),
  CONSTRAINT `fk_type_of_package_product_type_of_package1`
    FOREIGN KEY (`type_of_package_id_type_of_package`)
    REFERENCES `test`.`type_of_packages` (`id_type_of_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_of_package_product_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_type_of_package_product_product1_idx` ON `test`.`type_of_package_products` (`products_id_products` ASC);

CREATE INDEX `fk_type_of_package_product_type_of_package1_idx` ON `test`.`type_of_package_products` (`type_of_package_id_type_of_package` ASC);


-- -----------------------------------------------------
-- Table `test`.`product_warehouse_on_stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`product_warehouse_on_stock` ;

CREATE TABLE IF NOT EXISTS `test`.`product_warehouse_on_stock` (
  `products_id_products` INT NOT NULL,
  `warehouse_id_warehouse` INT NOT NULL,
  `value` INT NULL,
  PRIMARY KEY (`products_id_products`, `warehouse_id_warehouse`),
  CONSTRAINT `fk_product_warehouse_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_warehouse_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse`)
    REFERENCES `test`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_warehouse_warehouse1_idx` ON `test`.`product_warehouse_on_stock` (`warehouse_id_warehouse` ASC);

CREATE INDEX `fk_product_warehouse_product1_idx` ON `test`.`product_warehouse_on_stock` (`products_id_products` ASC);


-- -----------------------------------------------------
-- Table `test`.`type_of_io_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`type_of_io_operations` ;

CREATE TABLE IF NOT EXISTS `test`.`type_of_io_operations` (
  `idtype_of_io_operations` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idtype_of_io_operations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`io_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`io_operations` ;

CREATE TABLE IF NOT EXISTS `test`.`io_operations` (
  `id_io_operations` INT NOT NULL,
  `type_of_io_operations_idtype_of_io_operations` INT NOT NULL,
  `warehouse_id_warehouse_out` INT NOT NULL,
  `warehouse_id_warehouse_in` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  PRIMARY KEY (`id_io_operations`),
  CONSTRAINT `fk_io_operations_type_of_io_operations1`
    FOREIGN KEY (`type_of_io_operations_idtype_of_io_operations`)
    REFERENCES `test`.`type_of_io_operations` (`idtype_of_io_operations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse_out`)
    REFERENCES `test`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_warehouse2`
    FOREIGN KEY (`warehouse_id_warehouse_in`)
    REFERENCES `test`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_products1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_io_operations_type_of_io_operations1_idx` ON `test`.`io_operations` (`type_of_io_operations_idtype_of_io_operations` ASC);

CREATE INDEX `fk_io_operations_warehouse1_idx` ON `test`.`io_operations` (`warehouse_id_warehouse_out` ASC);

CREATE INDEX `fk_io_operations_warehouse2_idx` ON `test`.`io_operations` (`warehouse_id_warehouse_in` ASC);

CREATE INDEX `fk_io_operations_products1_idx` ON `test`.`io_operations` (`products_id_products` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `test`.`units`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`units` (`id_units`, `name`, `symbol`) VALUES (1, 'kg', 'kg');
INSERT INTO `test`.`units` (`id_units`, `name`, `symbol`) VALUES (2, 'm', 'm');
INSERT INTO `test`.`units` (`id_units`, `name`, `symbol`) VALUES (3, 'pcs', 'pcs');
INSERT INTO `test`.`units` (`id_units`, `name`, `symbol`) VALUES (4, 't', 't');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`products`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (1, '7201', 1, 2);
INSERT INTO `test`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (2, '7503', 1, 2);
INSERT INTO `test`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (3, '7773', 1, 2);
INSERT INTO `test`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (4, '7774', 1, 2);

COMMIT;

