SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `test1` ;
CREATE SCHEMA IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `test1` ;

-- -----------------------------------------------------
-- Table `test1`.`units`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`units` ;

CREATE TABLE IF NOT EXISTS `test1`.`units` (
  `id_units` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `symbol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_units`))
ENGINE = InnoDB
COMMENT = 'Jednostka miary dotycząca produktów i surowców';


-- -----------------------------------------------------
-- Table `test1`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`products` ;

CREATE TABLE IF NOT EXISTS `test1`.`products` (
  `id_products` INT NOT NULL AUTO_INCREMENT,
  `products_name` VARCHAR(45) NOT NULL,
  `units_id_units` INT NOT NULL,
  PRIMARY KEY (`id_products`),
  CONSTRAINT `fk_products_units1`
    FOREIGN KEY (`units_id_units`)
    REFERENCES `test1`.`units` (`id_units`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 0;

CREATE INDEX `fk_products_units1_idx` ON `test1`.`products` (`units_id_units` ASC);

CREATE UNIQUE INDEX `products_name_UNIQUE` ON `test1`.`products` (`products_name` ASC);


-- -----------------------------------------------------
-- Table `test1`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`category` ;

CREATE TABLE IF NOT EXISTS `test1`.`category` (
  `id_category` INT NOT NULL,
  `category_name` VARCHAR(45) NULL,
  `category_param1` VARCHAR(45) NULL,
  `category_param2` VARCHAR(45) NULL,
  `category_param3` VARCHAR(45) NULL,
  `category_param4` VARCHAR(45) NULL,
  `category_param5` VARCHAR(45) NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`category_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`category_product` ;

CREATE TABLE IF NOT EXISTS `test1`.`category_product` (
  `category_id_category` INT NOT NULL,
  `product_id_product` INT NOT NULL,
  PRIMARY KEY (`category_id_category`, `product_id_product`),
  CONSTRAINT `fk_category_product_category`
    FOREIGN KEY (`category_id_category`)
    REFERENCES `test1`.`category` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_product_product1`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_category_product_product1_idx` ON `test1`.`category_product` (`product_id_product` ASC);

CREATE INDEX `fk_category_product_category_idx` ON `test1`.`category_product` (`category_id_category` ASC);


-- -----------------------------------------------------
-- Table `test1`.`contractors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`contractors` ;

CREATE TABLE IF NOT EXISTS `test1`.`contractors` (
  `id_contractors` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `shortcut` VARCHAR(45) NULL,
  PRIMARY KEY (`id_contractors`))
ENGINE = InnoDB
COMMENT = 'Osbiorcy';


-- -----------------------------------------------------
-- Table `test1`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`orders` ;

CREATE TABLE IF NOT EXISTS `test1`.`orders` (
  `id_orders` INT NOT NULL,
  `orders_number` VARCHAR(45) NULL,
  `contractors_id_contractors` INT NOT NULL,
  `orders_date` DATETIME NULL,
  PRIMARY KEY (`id_orders`),
  CONSTRAINT `fk_orders_contractors1`
    FOREIGN KEY (`contractors_id_contractors`)
    REFERENCES `test1`.`contractors` (`id_contractors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Zamównienia';

CREATE INDEX `fk_orders_contractors1_idx` ON `test1`.`orders` (`contractors_id_contractors` ASC);


-- -----------------------------------------------------
-- Table `test1`.`type_of_packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_packages` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_packages` (
  `id_type_of_packages` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_of_packages`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`type_of_warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_warehouse` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_warehouse` (
  `id_type_of_warehouse` INT NOT NULL,
  `type_of_warehouse_name` VARCHAR(45) NULL,
  `type_of_warehouse_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_of_warehouse`))
ENGINE = InnoDB
COMMENT = 'Typ magazynu';


-- -----------------------------------------------------
-- Table `test1`.`warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`warehouse` ;

CREATE TABLE IF NOT EXISTS `test1`.`warehouse` (
  `id_warehouse` INT NOT NULL,
  `type_of_warehouse_id_type_of_warehouse` INT NOT NULL,
  PRIMARY KEY (`id_warehouse`),
  CONSTRAINT `fk_warehouse_type_of_warehouse1`
    FOREIGN KEY (`type_of_warehouse_id_type_of_warehouse`)
    REFERENCES `test1`.`type_of_warehouse` (`id_type_of_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Magazyn';

CREATE INDEX `fk_warehouse_type_of_warehouse1_idx` ON `test1`.`warehouse` (`type_of_warehouse_id_type_of_warehouse` ASC);


-- -----------------------------------------------------
-- Table `test1`.`packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`packages` ;

CREATE TABLE IF NOT EXISTS `test1`.`packages` (
  `id_packages` INT NOT NULL,
  `type_of_packages_id_type_of_packages` INT NOT NULL,
  `warehouse_id_warehouse` INT NOT NULL,
  `packages_number` INT NULL,
  PRIMARY KEY (`id_packages`),
  CONSTRAINT `fk_package_type_of_package1`
    FOREIGN KEY (`type_of_packages_id_type_of_packages`)
    REFERENCES `test1`.`type_of_packages` (`id_type_of_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse`)
    REFERENCES `test1`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Paleta, katron, paczka na dostawę';

CREATE INDEX `fk_package_type_of_package1_idx` ON `test1`.`packages` (`type_of_packages_id_type_of_packages` ASC);

CREATE INDEX `fk_package_warehouse1_idx` ON `test1`.`packages` (`warehouse_id_warehouse` ASC);


-- -----------------------------------------------------
-- Table `test1`.`type_of_control_measurements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_control_measurements` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_control_measurements` (
  `id_type_of_control_measurements` INT NOT NULL,
  PRIMARY KEY (`id_type_of_control_measurements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`control_measurements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`control_measurements` ;

CREATE TABLE IF NOT EXISTS `test1`.`control_measurements` (
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
    REFERENCES `test1`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control measurements_box1`
    FOREIGN KEY (`packages_id_packages`)
    REFERENCES `test1`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_measurements_type_of_control_measurements1`
    FOREIGN KEY (`type_of_control_measurements_id_type_of_control_measurements`)
    REFERENCES `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_control measurements_orders1_idx` ON `test1`.`control_measurements` (`orders_id_orders` ASC);

CREATE INDEX `fk_control measurements_product1_idx` ON `test1`.`control_measurements` (`products_id_products` ASC);

CREATE INDEX `fk_control measurements_box1_idx` ON `test1`.`control_measurements` (`packages_id_packages` ASC);

CREATE INDEX `fk_control_measurements_type_of_control_measurements1_idx` ON `test1`.`control_measurements` (`type_of_control_measurements_id_type_of_control_measurements` ASC);


-- -----------------------------------------------------
-- Table `test1`.`type_of_dimension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_dimension` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_dimension` (
  `id_type_of_dimension` INT NOT NULL,
  `symbol` VARCHAR(45) NULL,
  `glyph` VARCHAR(45) NULL,
  PRIMARY KEY (`id_type_of_dimension`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`dimension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`dimension` ;

CREATE TABLE IF NOT EXISTS `test1`.`dimension` (
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
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dimension_type_of_dimension1`
    FOREIGN KEY (`type_of_dimension_id_type_of_dimension`)
    REFERENCES `test1`.`type_of_dimension` (`id_type_of_dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_dimension_product1_idx` ON `test1`.`dimension` (`products_id_products` ASC);

CREATE INDEX `fk_dimension_type_of_dimension1_idx` ON `test1`.`dimension` (`type_of_dimension_id_type_of_dimension` ASC);


-- -----------------------------------------------------
-- Table `test1`.`mensuration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`mensuration` ;

CREATE TABLE IF NOT EXISTS `test1`.`mensuration` (
  `id_mensuration` INT NOT NULL,
  `measurement_id_measurement` INT NOT NULL,
  `control_measurements_id_control_measurements` INT NOT NULL,
  `dimension_id_dimension` INT NOT NULL,
  `sample_numer` INT NULL,
  `value` INT NULL,
  PRIMARY KEY (`id_mensuration`),
  CONSTRAINT `fk_mensuration_control_measurements1`
    FOREIGN KEY (`control_measurements_id_control_measurements`)
    REFERENCES `test1`.`control_measurements` (`id_control_measurements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensuration_dimension1`
    FOREIGN KEY (`dimension_id_dimension`)
    REFERENCES `test1`.`dimension` (`id_dimension`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_mensuration_control_measurements1_idx` ON `test1`.`mensuration` (`control_measurements_id_control_measurements` ASC);

CREATE INDEX `fk_mensuration_dimension1_idx` ON `test1`.`mensuration` (`dimension_id_dimension` ASC);


-- -----------------------------------------------------
-- Table `test1`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`users` ;

CREATE TABLE IF NOT EXISTS `test1`.`users` (
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

CREATE INDEX `password` ON `test1`.`users` (`password` ASC);

CREATE UNIQUE INDEX `key_UNIQUE` ON `test1`.`users` (`key_public` ASC);

CREATE UNIQUE INDEX `key_private_UNIQUE` ON `test1`.`users` (`key_private` ASC);

CREATE UNIQUE INDEX `login_UNIQUE` ON `test1`.`users` (`login` ASC);


-- -----------------------------------------------------
-- Table `test1`.`employers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`employers` ;

CREATE TABLE IF NOT EXISTS `test1`.`employers` (
  `id_employers` INT NOT NULL,
  `users_id_users` INT NOT NULL,
  PRIMARY KEY (`id_employers`),
  CONSTRAINT `fk_employers_users1`
    FOREIGN KEY (`users_id_users`)
    REFERENCES `test1`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employers_users1_idx` ON `test1`.`employers` (`users_id_users` ASC);


-- -----------------------------------------------------
-- Table `test1`.`orders_progress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`orders_progress` ;

CREATE TABLE IF NOT EXISTS `test1`.`orders_progress` (
  `id_orders_progress` INT NOT NULL,
  `orders_id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders_progress`),
  CONSTRAINT `fk_orders_progress_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test1`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_orders_progress_orders1_idx` ON `test1`.`orders_progress` (`orders_id_orders` ASC);


-- -----------------------------------------------------
-- Table `test1`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`permissions` ;

CREATE TABLE IF NOT EXISTS `test1`.`permissions` (
  `id_permissions` INT NOT NULL,
  `permissions_name` VARCHAR(45) NOT NULL,
  `permissions_value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_permissions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`jobs` ;

CREATE TABLE IF NOT EXISTS `test1`.`jobs` (
  `id_jobs` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_jobs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`employers_jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`employers_jobs` ;

CREATE TABLE IF NOT EXISTS `test1`.`employers_jobs` (
  `employers_id_employers` INT NOT NULL,
  `jobs_id_jobs` INT NOT NULL,
  PRIMARY KEY (`employers_id_employers`, `jobs_id_jobs`),
  CONSTRAINT `fk_employers_jobs_employers1`
    FOREIGN KEY (`employers_id_employers`)
    REFERENCES `test1`.`employers` (`id_employers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employers_jobs_jobs1`
    FOREIGN KEY (`jobs_id_jobs`)
    REFERENCES `test1`.`jobs` (`id_jobs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employers_jobs_jobs1_idx` ON `test1`.`employers_jobs` (`jobs_id_jobs` ASC);

CREATE INDEX `fk_employers_jobs_employers1_idx` ON `test1`.`employers_jobs` (`employers_id_employers` ASC);


-- -----------------------------------------------------
-- Table `test1`.`managers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`managers` ;

CREATE TABLE IF NOT EXISTS `test1`.`managers` (
  `id_managers` INT NOT NULL,
  `users_id_users` INT NOT NULL,
  PRIMARY KEY (`id_managers`),
  CONSTRAINT `fk_manager_users1`
    FOREIGN KEY (`users_id_users`)
    REFERENCES `test1`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_manager_users1_idx` ON `test1`.`managers` (`users_id_users` ASC);


-- -----------------------------------------------------
-- Table `test1`.`managers_jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`managers_jobs` ;

CREATE TABLE IF NOT EXISTS `test1`.`managers_jobs` (
  `managers_id_managers` INT NOT NULL,
  `jobs_id_jobs` INT NOT NULL,
  PRIMARY KEY (`managers_id_managers`, `jobs_id_jobs`),
  CONSTRAINT `fk_managers_jobs_managers1`
    FOREIGN KEY (`managers_id_managers`)
    REFERENCES `test1`.`managers` (`id_managers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_managers_jobs_jobs1`
    FOREIGN KEY (`jobs_id_jobs`)
    REFERENCES `test1`.`jobs` (`id_jobs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_managers_jobs_jobs1_idx` ON `test1`.`managers_jobs` (`jobs_id_jobs` ASC);

CREATE INDEX `fk_managers_jobs_managers1_idx` ON `test1`.`managers_jobs` (`managers_id_managers` ASC);


-- -----------------------------------------------------
-- Table `test1`.`squads`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`squads` ;

CREATE TABLE IF NOT EXISTS `test1`.`squads` (
  `id_squads` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_squads`))
ENGINE = InnoDB
COMMENT = 'Brygady robocze (w znaczeniu obsady stanowisk pracy, zmiennicy pracujący na tych samych stanowiskach)';


-- -----------------------------------------------------
-- Table `test1`.`sockets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`sockets` ;

CREATE TABLE IF NOT EXISTS `test1`.`sockets` (
  `id_sockets` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sockets`))
ENGINE = InnoDB
COMMENT = 'Gniazda (w znaczeniu stanowiska pracy - wielomaszynowe lub jednomaszynowe)';


-- -----------------------------------------------------
-- Table `test1`.`guiding_cards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`guiding_cards` ;

CREATE TABLE IF NOT EXISTS `test1`.`guiding_cards` (
  `id_guiding_cards` INT NOT NULL,
  `number` INT NULL,
  `year` INT NULL,
  `employers_id_employers` INT NOT NULL,
  `date_open` DATETIME NULL,
  `date_close` DATETIME NULL,
  PRIMARY KEY (`id_guiding_cards`, `employers_id_employers`),
  CONSTRAINT `fk_guiding_cards_employers1`
    FOREIGN KEY (`employers_id_employers`)
    REFERENCES `test1`.`employers` (`id_employers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_guiding_cards_employers1_idx` ON `test1`.`guiding_cards` (`employers_id_employers` ASC);


-- -----------------------------------------------------
-- Table `test1`.`guiding_cards_package`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`guiding_cards_package` ;

CREATE TABLE IF NOT EXISTS `test1`.`guiding_cards_package` (
  `guiding_cards_id_guiding_cards` INT NOT NULL,
  `package_id_package` INT NOT NULL,
  PRIMARY KEY (`guiding_cards_id_guiding_cards`, `package_id_package`),
  CONSTRAINT `fk_guiding_cards_package_guiding_cards1`
    FOREIGN KEY (`guiding_cards_id_guiding_cards`)
    REFERENCES `test1`.`guiding_cards` (`id_guiding_cards`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_guiding_cards_package_package1`
    FOREIGN KEY (`package_id_package`)
    REFERENCES `test1`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_guiding_cards_package_package1_idx` ON `test1`.`guiding_cards_package` (`package_id_package` ASC);

CREATE INDEX `fk_guiding_cards_package_guiding_cards1_idx` ON `test1`.`guiding_cards_package` (`guiding_cards_id_guiding_cards` ASC);


-- -----------------------------------------------------
-- Table `test1`.`products_contractors_supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`products_contractors_supplier` ;

CREATE TABLE IF NOT EXISTS `test1`.`products_contractors_supplier` (
  `products_id_products` INT NOT NULL,
  `contractors_id_contractors` INT NOT NULL,
  PRIMARY KEY (`products_id_products`, `contractors_id_contractors`),
  CONSTRAINT `fk_product_contractors_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_contractors_contractors1`
    FOREIGN KEY (`contractors_id_contractors`)
    REFERENCES `test1`.`contractors` (`id_contractors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_contractors_contractors1_idx` ON `test1`.`products_contractors_supplier` (`contractors_id_contractors` ASC);

CREATE INDEX `fk_product_contractors_product1_idx` ON `test1`.`products_contractors_supplier` (`products_id_products` ASC);


-- -----------------------------------------------------
-- Table `test1`.`package_contractors_recipient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`package_contractors_recipient` ;

CREATE TABLE IF NOT EXISTS `test1`.`package_contractors_recipient` (
  `package_id_package` INT NOT NULL,
  `contractors_id_contractors` INT NOT NULL,
  PRIMARY KEY (`package_id_package`, `contractors_id_contractors`),
  CONSTRAINT `fk_package_contractors_package1`
    FOREIGN KEY (`package_id_package`)
    REFERENCES `test1`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_contractors_contractors1`
    FOREIGN KEY (`contractors_id_contractors`)
    REFERENCES `test1`.`contractors` (`id_contractors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_package_contractors_contractors1_idx` ON `test1`.`package_contractors_recipient` (`contractors_id_contractors` ASC);

CREATE INDEX `fk_package_contractors_package1_idx` ON `test1`.`package_contractors_recipient` (`package_id_package` ASC);


-- -----------------------------------------------------
-- Table `test1`.`dispatch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`dispatch` ;

CREATE TABLE IF NOT EXISTS `test1`.`dispatch` (
  `id_dispatch` INT NOT NULL,
  PRIMARY KEY (`id_dispatch`))
ENGINE = InnoDB
COMMENT = 'Wysyłka';


-- -----------------------------------------------------
-- Table `test1`.`dispatch_packages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`dispatch_packages` ;

CREATE TABLE IF NOT EXISTS `test1`.`dispatch_packages` (
  `dispatch_id_dispatch` INT NOT NULL,
  `packages_id_packages` INT NOT NULL,
  PRIMARY KEY (`dispatch_id_dispatch`, `packages_id_packages`),
  CONSTRAINT `fk_dispatch_package_dispatch1`
    FOREIGN KEY (`dispatch_id_dispatch`)
    REFERENCES `test1`.`dispatch` (`id_dispatch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispatch_package_package1`
    FOREIGN KEY (`packages_id_packages`)
    REFERENCES `test1`.`packages` (`id_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_dispatch_package_package1_idx` ON `test1`.`dispatch_packages` (`packages_id_packages` ASC);

CREATE INDEX `fk_dispatch_package_dispatch1_idx` ON `test1`.`dispatch_packages` (`dispatch_id_dispatch` ASC);


-- -----------------------------------------------------
-- Table `test1`.`type_of_package_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_package_products` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_package_products` (
  `type_of_package_id_type_of_package` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  PRIMARY KEY (`type_of_package_id_type_of_package`, `products_id_products`),
  CONSTRAINT `fk_type_of_package_product_type_of_package1`
    FOREIGN KEY (`type_of_package_id_type_of_package`)
    REFERENCES `test1`.`type_of_packages` (`id_type_of_packages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_of_package_product_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_type_of_package_product_product1_idx` ON `test1`.`type_of_package_products` (`products_id_products` ASC);

CREATE INDEX `fk_type_of_package_product_type_of_package1_idx` ON `test1`.`type_of_package_products` (`type_of_package_id_type_of_package` ASC);


-- -----------------------------------------------------
-- Table `test1`.`product_warehouse_on_stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`product_warehouse_on_stock` ;

CREATE TABLE IF NOT EXISTS `test1`.`product_warehouse_on_stock` (
  `products_id_products` INT NOT NULL,
  `warehouse_id_warehouse` INT NOT NULL,
  `value` INT NULL,
  PRIMARY KEY (`products_id_products`, `warehouse_id_warehouse`),
  CONSTRAINT `fk_product_warehouse_product1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_warehouse_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse`)
    REFERENCES `test1`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_warehouse_warehouse1_idx` ON `test1`.`product_warehouse_on_stock` (`warehouse_id_warehouse` ASC);

CREATE INDEX `fk_product_warehouse_product1_idx` ON `test1`.`product_warehouse_on_stock` (`products_id_products` ASC);


-- -----------------------------------------------------
-- Table `test1`.`type_of_io_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`type_of_io_operations` ;

CREATE TABLE IF NOT EXISTS `test1`.`type_of_io_operations` (
  `idtype_of_io_operations` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idtype_of_io_operations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test1`.`io_operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`io_operations` ;

CREATE TABLE IF NOT EXISTS `test1`.`io_operations` (
  `id_io_operations` INT NOT NULL,
  `type_of_io_operations_idtype_of_io_operations` INT NOT NULL,
  `warehouse_id_warehouse_out` INT NOT NULL,
  `warehouse_id_warehouse_in` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  PRIMARY KEY (`id_io_operations`),
  CONSTRAINT `fk_io_operations_type_of_io_operations1`
    FOREIGN KEY (`type_of_io_operations_idtype_of_io_operations`)
    REFERENCES `test1`.`type_of_io_operations` (`idtype_of_io_operations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_warehouse1`
    FOREIGN KEY (`warehouse_id_warehouse_out`)
    REFERENCES `test1`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_warehouse2`
    FOREIGN KEY (`warehouse_id_warehouse_in`)
    REFERENCES `test1`.`warehouse` (`id_warehouse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_io_operations_products1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_io_operations_type_of_io_operations1_idx` ON `test1`.`io_operations` (`type_of_io_operations_idtype_of_io_operations` ASC);

CREATE INDEX `fk_io_operations_warehouse1_idx` ON `test1`.`io_operations` (`warehouse_id_warehouse_out` ASC);

CREATE INDEX `fk_io_operations_warehouse2_idx` ON `test1`.`io_operations` (`warehouse_id_warehouse_in` ASC);

CREATE INDEX `fk_io_operations_products1_idx` ON `test1`.`io_operations` (`products_id_products` ASC);


-- -----------------------------------------------------
-- Table `test1`.`managers_has_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`managers_has_permissions` ;

CREATE TABLE IF NOT EXISTS `test1`.`managers_has_permissions` (
  `managers_id_managers` INT NOT NULL,
  `permissions_id_permissions` INT NOT NULL,
  PRIMARY KEY (`managers_id_managers`, `permissions_id_permissions`),
  CONSTRAINT `fk_managers_has_permissions_managers1`
    FOREIGN KEY (`managers_id_managers`)
    REFERENCES `test1`.`managers` (`id_managers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_managers_has_permissions_permissions1`
    FOREIGN KEY (`permissions_id_permissions`)
    REFERENCES `test1`.`permissions` (`id_permissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_managers_has_permissions_permissions1_idx` ON `test1`.`managers_has_permissions` (`permissions_id_permissions` ASC);

CREATE INDEX `fk_managers_has_permissions_managers1_idx` ON `test1`.`managers_has_permissions` (`managers_id_managers` ASC);


-- -----------------------------------------------------
-- Table `test1`.`users_has_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`users_has_permissions` ;

CREATE TABLE IF NOT EXISTS `test1`.`users_has_permissions` (
  `users_id_users` INT NOT NULL,
  `permissions_id_permissions` INT NOT NULL,
  PRIMARY KEY (`users_id_users`, `permissions_id_permissions`),
  CONSTRAINT `fk_users_has_permissions_users1`
    FOREIGN KEY (`users_id_users`)
    REFERENCES `test1`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_permissions_permissions1`
    FOREIGN KEY (`permissions_id_permissions`)
    REFERENCES `test1`.`permissions` (`id_permissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_users_has_permissions_permissions1_idx` ON `test1`.`users_has_permissions` (`permissions_id_permissions` ASC);

CREATE INDEX `fk_users_has_permissions_users1_idx` ON `test1`.`users_has_permissions` (`users_id_users` ASC);


-- -----------------------------------------------------
-- Table `test1`.`orders_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`orders_has_products` ;

CREATE TABLE IF NOT EXISTS `test1`.`orders_has_products` (
  `orders_id_orders` INT NOT NULL,
  `products_id_products` INT NOT NULL,
  PRIMARY KEY (`orders_id_orders`, `products_id_products`),
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`orders_id_orders`)
    REFERENCES `test1`.`orders` (`id_orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`products_id_products`)
    REFERENCES `test1`.`products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_orders_has_products_products1_idx` ON `test1`.`orders_has_products` (`products_id_products` ASC);

CREATE INDEX `fk_orders_has_products_orders1_idx` ON `test1`.`orders_has_products` (`orders_id_orders` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `test1`.`units`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`units` (`id_units`, `name`, `symbol`) VALUES (1, 'kg', 'kg');
INSERT INTO `test1`.`units` (`id_units`, `name`, `symbol`) VALUES (2, 'm', 'm');
INSERT INTO `test1`.`units` (`id_units`, `name`, `symbol`) VALUES (3, 'pcs', 'pcs');
INSERT INTO `test1`.`units` (`id_units`, `name`, `symbol`) VALUES (4, 't', 't');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`products`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (1, '7201', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (2, '7503', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (3, '7773', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (4, '7774', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (5, '9876', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (6, '6548', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (7, '3526', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (8, '3215', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (9, '3211', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (10, '1383', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (11, '0654', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (12, '5162', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (13, '3218', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (14, '5651', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (15, '5166', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (16, '2121', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (17, '1355', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (18, '3843', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (19, '2138', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (20, '3491', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (21, '2166', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (22, '8451', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (23, '2256', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (24, '2241', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (25, '4598', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (26, '6549', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (27, '6542', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (28, '3162', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (29, '3212', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (30, '1080', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (31, '2016', 1);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`) VALUES (0, '6548454', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (1, '1', '1', '1', '1', '1', '1');
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (2, '2', '2', '2', '2', '2', '2');
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (3, '3', '3', '3', '3', '3', '3');
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (4, '4', '4', '4', '4', '4', '4');
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (5, '5', '5', '5', '5', '5', '5');
INSERT INTO `test1`.`category` (`id_category`, `category_name`, `category_param1`, `category_param2`, `category_param3`, `category_param4`, `category_param5`) VALUES (6, '6', '6', '6', '6', '6', '6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`contractors`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (1, '1', '1');
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (2, '2', '2');
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (3, '3', '3');
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (4, '4', '4');
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (5, '5', '5');
INSERT INTO `test1`.`contractors` (`id_contractors`, `name`, `shortcut`) VALUES (6, '6', '6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (1, '963458', 1, '2010-01-15 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (2, '530477', 1, '2011-01-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (3, '926053', 1, '2010-03-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (4, '565921', 1, '2008-04-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (5, '127649', 1, '2012-12-07 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (6, '166760', 1, '2011-12-04 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (7, '863013', 1, '2008-01-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (8, '127694', 1, '2008-09-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (9, '357658', 1, '2008-12-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (10, '183380', 1, '2008-05-04 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (11, '876959', 1, '2011-11-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (12, '192062', 1, '2008-08-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (13, '258837', 1, '2014-05-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (14, '242435', 1, '2014-06-12 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (15, '753100', 1, '2010-01-05 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (16, '484746', 1, '2011-12-24 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (17, '613408', 1, '2014-01-21 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (18, '693076', 1, '2009-11-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (19, '125039', 1, '2009-06-22 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (20, '137021', 1, '2010-01-15 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (21, '508512', 1, '2010-09-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (22, '900894', 1, '2014-11-20 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (23, '552155', 1, '2010-08-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (24, '596148', 1, '2008-06-05 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (25, '962587', 1, '2010-12-14 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (26, '209200', 1, '2010-11-14 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (27, '303357', 1, '2010-04-28 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (28, '299466', 1, '2014-09-03 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (29, '780084', 1, '2012-09-11 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (30, '426485', 1, '2012-12-28 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (31, '701703', 1, '2013-06-24 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (32, '878835', 1, '2011-01-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (33, '611201', 1, '2014-09-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (34, '119564', 1, '2014-02-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (35, '415146', 1, '2013-06-04 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (36, '584717', 1, '2014-01-19 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (37, '832733', 1, '2008-01-17 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (38, '149845', 1, '2013-10-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (39, '331867', 1, '2008-01-06 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (40, '737791', 1, '2009-05-20 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (41, '481502', 1, '2014-10-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (42, '419205', 1, '2013-05-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (43, '314728', 1, '2010-06-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (44, '951648', 1, '2011-01-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (45, '876661', 1, '2011-04-24 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (46, '313276', 1, '2010-02-27 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (47, '514767', 1, '2011-09-15 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (48, '853663', 1, '2010-03-12 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (49, '601585', 1, '2008-12-20 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (50, '686461', 1, '2008-11-19 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (51, '731788', 1, '2008-05-17 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (52, '812966', 1, '2009-07-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (53, '264502', 1, '2008-09-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (54, '562879', 1, '2012-12-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (55, '110935', 1, '2009-08-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (56, '189745', 1, '2014-07-05 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (57, '111224', 1, '2014-09-06 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (58, '373742', 1, '2010-03-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (59, '347362', 1, '2011-05-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (60, '536173', 1, '2011-08-25 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (61, '703085', 1, '2013-05-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (62, '698501', 1, '2010-08-02 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (63, '857501', 1, '2011-05-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (64, '800772', 1, '2012-03-06 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (65, '409670', 1, '2010-02-25 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (66, '615321', 1, '2012-06-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (67, '934516', 1, '2014-07-02 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (68, '587558', 1, '2012-11-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (69, '103239', 1, '2014-03-27 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (70, '709691', 1, '2009-12-19 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (71, '201456', 1, '2013-09-04 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (72, '576737', 1, '2011-08-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (73, '986427', 1, '2009-12-12 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (74, '832073', 1, '2008-05-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (75, '301723', 1, '2012-12-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (76, '765085', 1, '2009-08-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (77, '454017', 1, '2014-06-03 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (78, '668865', 1, '2009-11-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (79, '412195', 1, '2014-08-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (80, '728000', 1, '2014-06-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (81, '953861', 1, '2010-02-24 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (82, '970585', 1, '2010-12-07 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (83, '134975', 1, '2013-10-22 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (84, '215191', 1, '2012-04-15 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (85, '145369', 1, '2014-04-26 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (86, '403895', 1, '2008-06-05 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (87, '833291', 1, '2014-08-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (88, '196239', 1, '2008-03-13 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (89, '125114', 1, '2014-08-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (90, '835824', 1, '2013-01-18 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (91, '316620', 1, '2009-11-14 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (92, '378032', 1, '2011-10-07 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (93, '830081', 1, '2010-11-14 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (94, '592281', 1, '2009-08-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (95, '652925', 1, '2012-01-20 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (96, '909898', 1, '2010-03-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (97, '504790', 1, '2008-05-21 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (98, '226593', 1, '2010-01-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (99, '113789', 1, '2011-02-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (100, '736775', 1, '2011-12-19 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (101, '217334', 1, '2009-12-06 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (102, '561346', 1, '2009-06-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (103, '138179', 1, '2012-12-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (104, '396586', 1, '2014-10-21 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (105, '516571', 1, '2010-04-27 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (106, '218212', 1, '2009-05-10 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (107, '600783', 1, '2008-10-07 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (108, '749992', 1, '2012-05-21 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (109, '273693', 1, '2011-11-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (110, '476479', 1, '2012-10-03 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (111, '362454', 1, '2014-11-09 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (112, '746565', 1, '2010-07-01 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (113, '221838', 1, '2008-10-21 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (114, '338510', 1, '2010-08-12 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (115, '670051', 1, '2013-09-02 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (116, '533807', 1, '2013-04-02 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (117, '375463', 1, '2013-05-08 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (118, '319704', 1, '2010-07-23 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (119, '741529', 1, '2010-08-16 00:00');
INSERT INTO `test1`.`orders` (`id_orders`, `orders_number`, `contractors_id_contractors`, `orders_date`) VALUES (120, '573406', 1, '2013-04-12 00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`type_of_packages`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (1, '1');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (2, '2');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (3, '3');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (4, '4');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (5, '5');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (6, '6');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (7, '7');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (8, '8');
INSERT INTO `test1`.`type_of_packages` (`id_type_of_packages`, `name`) VALUES (9, '9');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`type_of_warehouse`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`type_of_warehouse` (`id_type_of_warehouse`, `type_of_warehouse_name`, `type_of_warehouse_desc`) VALUES (1, '1', '1');
INSERT INTO `test1`.`type_of_warehouse` (`id_type_of_warehouse`, `type_of_warehouse_name`, `type_of_warehouse_desc`) VALUES (2, '2', '2');
INSERT INTO `test1`.`type_of_warehouse` (`id_type_of_warehouse`, `type_of_warehouse_name`, `type_of_warehouse_desc`) VALUES (3, '3', '3');
INSERT INTO `test1`.`type_of_warehouse` (`id_type_of_warehouse`, `type_of_warehouse_name`, `type_of_warehouse_desc`) VALUES (4, '4', '4');
INSERT INTO `test1`.`type_of_warehouse` (`id_type_of_warehouse`, `type_of_warehouse_name`, `type_of_warehouse_desc`) VALUES (5, '5', '5');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`warehouse`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (1, 1);
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (2, 2);
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (3, 3);
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (4, 1);
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (5, 2);
INSERT INTO `test1`.`warehouse` (`id_warehouse`, `type_of_warehouse_id_type_of_warehouse`) VALUES (6, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`packages`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (1, 5, 2, 650496);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (2, 2, 3, 811327);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (3, 1, 2, 979765);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (4, 2, 3, 305420);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (5, 1, 1, 689040);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (6, 4, 1, 152361);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (7, 4, 3, 185088);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (8, 2, 1, 665537);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (9, 5, 2, 229235);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (10, 5, 1, 591325);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (11, 3, 2, 922074);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (12, 4, 2, 358284);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (13, 2, 3, 438197);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (14, 5, 2, 856605);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (15, 2, 2, 960287);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (16, 5, 2, 484775);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (17, 5, 2, 888975);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (18, 2, 3, 659123);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (19, 5, 1, 911604);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (20, 4, 3, 977256);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (21, 5, 2, 596555);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (22, 5, 3, 620333);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (23, 5, 2, 166792);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (24, 3, 1, 996496);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (25, 3, 3, 385868);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (26, 2, 3, 584773);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (27, 3, 3, 489846);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (28, 3, 1, 120429);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (29, 2, 3, 808360);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (30, 2, 3, 463892);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (31, 1, 1, 555908);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (32, 1, 1, 740338);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (33, 1, 3, 122571);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (34, 3, 2, 651378);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (35, 1, 3, 202281);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (36, 4, 3, 412301);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (37, 2, 3, 744276);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (38, 1, 1, 296457);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (39, 1, 2, 908400);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (40, 5, 3, 714361);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (41, 4, 1, 413528);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (42, 5, 2, 580096);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (43, 3, 3, 213011);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (44, 1, 2, 509866);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (45, 3, 2, 436955);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (46, 4, 1, 474574);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (47, 3, 3, 790746);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (48, 1, 1, 232798);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (49, 3, 2, 609955);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (50, 4, 1, 127655);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (51, 3, 2, 605421);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (52, 5, 1, 147985);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (53, 2, 1, 182297);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (54, 3, 3, 204849);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (55, 4, 3, 613188);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (56, 2, 1, 527647);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (57, 5, 2, 207167);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (58, 2, 1, 182249);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (59, 4, 3, 841750);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (60, 1, 3, 781057);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (61, 3, 2, 567130);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (62, 3, 1, 870368);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (63, 3, 2, 837040);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (64, 2, 2, 373186);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (65, 1, 2, 912326);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (66, 4, 1, 364069);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (67, 5, 2, 636726);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (68, 2, 1, 803564);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (69, 2, 3, 573811);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (70, 3, 1, 469935);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (71, 3, 1, 457971);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (72, 2, 1, 801745);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (73, 5, 1, 725616);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (74, 3, 1, 172786);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (75, 3, 1, 116091);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (76, 5, 3, 410373);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (77, 5, 1, 285086);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (78, 4, 2, 901138);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (79, 3, 2, 661494);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (80, 2, 3, 538616);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (81, 5, 1, 714932);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (82, 4, 2, 696405);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (83, 4, 2, 311077);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (84, 5, 1, 310839);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (85, 3, 2, 487216);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (86, 1, 2, 326713);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (87, 4, 1, 321665);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (88, 2, 3, 774694);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (89, 1, 1, 158648);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (90, 4, 2, 465349);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (91, 4, 1, 715025);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (92, 3, 2, 154030);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (93, 3, 2, 796749);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (94, 5, 2, 153388);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (95, 3, 2, 673769);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (96, 4, 3, 679636);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (97, 4, 1, 402750);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (98, 3, 3, 128378);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (99, 1, 1, 991440);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (100, 3, 3, 204595);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (101, 3, 1, 609926);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (102, 2, 3, 475981);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (103, 3, 3, 726325);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (104, 1, 2, 354357);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (105, 4, 1, 535167);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (106, 3, 3, 767238);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (107, 4, 1, 924186);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (108, 4, 3, 841653);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (109, 5, 3, 392705);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (110, 1, 2, 370960);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (111, 3, 1, 918258);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (112, 1, 3, 723523);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (113, 4, 1, 798415);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (114, 4, 2, 658364);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (115, 2, 2, 936166);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (116, 5, 3, 196009);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (117, 4, 2, 740918);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (118, 1, 1, 506359);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (119, 2, 3, 304592);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (120, 2, 3, 946056);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (121, 3, 3, 281445);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (122, 1, 1, 991497);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (123, 5, 2, 339968);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (124, 4, 3, 774580);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (125, 1, 3, 308872);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (126, 4, 2, 570679);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (127, 4, 1, 229727);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (128, 3, 2, 827878);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (129, 1, 2, 896560);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (130, 2, 3, 901148);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (131, 1, 1, 581656);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (132, 3, 3, 245208);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (133, 5, 2, 835012);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (134, 1, 1, 214437);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (135, 1, 1, 968422);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (136, 5, 3, 747010);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (137, 1, 2, 815595);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (138, 2, 2, 222374);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (139, 5, 1, 436417);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (140, 1, 2, 198353);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (141, 5, 2, 922217);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (142, 5, 1, 670090);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (143, 3, 3, 441325);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (144, 2, 2, 490520);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (145, 3, 2, 602728);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (146, 5, 1, 811054);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (147, 3, 3, 488943);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (148, 2, 3, 347213);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (149, 3, 3, 541685);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (150, 3, 1, 577527);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (151, 2, 2, 518975);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (152, 1, 2, 708696);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (153, 3, 3, 261231);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (154, 5, 2, 870808);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (155, 1, 3, 457892);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (156, 4, 1, 541088);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (157, 3, 1, 124262);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (158, 2, 2, 519746);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (159, 5, 3, 315874);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (160, 1, 2, 896568);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (161, 3, 3, 514964);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (162, 5, 2, 899011);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (163, 3, 3, 822893);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (164, 3, 3, 683444);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (165, 3, 2, 451329);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (166, 1, 2, 592706);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (167, 5, 2, 365404);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (168, 2, 2, 926891);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (169, 5, 2, 534714);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (170, 4, 1, 919372);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (171, 2, 1, 989960);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (172, 3, 2, 412253);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (173, 5, 2, 893561);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (174, 4, 2, 570415);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (175, 4, 2, 425917);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (176, 2, 1, 883067);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (177, 5, 2, 472840);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (178, 5, 2, 186843);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (179, 2, 1, 535023);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (180, 4, 1, 933297);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (181, 4, 3, 674917);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (182, 5, 1, 656183);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (183, 1, 3, 578058);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (184, 3, 3, 365467);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (185, 5, 2, 221589);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (186, 2, 2, 581102);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (187, 1, 2, 470873);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (188, 3, 3, 156841);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (189, 4, 3, 256738);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (190, 3, 1, 743679);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (191, 5, 3, 571947);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (192, 2, 2, 492695);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (193, 2, 1, 574648);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (194, 5, 3, 501336);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (195, 5, 3, 814943);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (196, 2, 1, 406901);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (197, 3, 3, 206503);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (198, 3, 1, 720764);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (199, 4, 2, 528630);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`, `packages_number`) VALUES (200, 3, 3, 698947);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`type_of_control_measurements`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (1);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (2);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (3);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (4);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (5);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (6);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (7);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (8);
INSERT INTO `test1`.`type_of_control_measurements` (`id_type_of_control_measurements`) VALUES (9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`control_measurements`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`control_measurements` (`id_control_measurements`, `orders_id_orders`, `products_id_products`, `packages_id_packages`, `type_of_control_measurements_id_type_of_control_measurements`, `sample_size`, `date_start`, `date_end`) VALUES (1, 1, 1, 1, 1, 1, '2000-01-01 12:00', '2000-01-01 12:00');
INSERT INTO `test1`.`control_measurements` (`id_control_measurements`, `orders_id_orders`, `products_id_products`, `packages_id_packages`, `type_of_control_measurements_id_type_of_control_measurements`, `sample_size`, `date_start`, `date_end`) VALUES (2, 2, 2, 2, 2, 2, '2000-01-01 12:00', '2000-01-01 12:00');
INSERT INTO `test1`.`control_measurements` (`id_control_measurements`, `orders_id_orders`, `products_id_products`, `packages_id_packages`, `type_of_control_measurements_id_type_of_control_measurements`, `sample_size`, `date_start`, `date_end`) VALUES (3, 3, 3, 3, 3, 3, '2000-01-01 12:00', '2000-01-01 12:00');
INSERT INTO `test1`.`control_measurements` (`id_control_measurements`, `orders_id_orders`, `products_id_products`, `packages_id_packages`, `type_of_control_measurements_id_type_of_control_measurements`, `sample_size`, `date_start`, `date_end`) VALUES (4, 4, 4, 4, 4, 4, '2000-01-01 12:00', '2000-01-01 12:00');
INSERT INTO `test1`.`control_measurements` (`id_control_measurements`, `orders_id_orders`, `products_id_products`, `packages_id_packages`, `type_of_control_measurements_id_type_of_control_measurements`, `sample_size`, `date_start`, `date_end`) VALUES (5, 5, 5, 5, 5, 5, '2000-01-01 12:00', '2000-01-01 12:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`type_of_dimension`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`type_of_dimension` (`id_type_of_dimension`, `symbol`, `glyph`) VALUES (1, '1', '1');
INSERT INTO `test1`.`type_of_dimension` (`id_type_of_dimension`, `symbol`, `glyph`) VALUES (2, '2', '2');
INSERT INTO `test1`.`type_of_dimension` (`id_type_of_dimension`, `symbol`, `glyph`) VALUES (3, '3', '3');
INSERT INTO `test1`.`type_of_dimension` (`id_type_of_dimension`, `symbol`, `glyph`) VALUES (4, '4', '4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`dimension`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`dimension` (`id_dimension`, `products_id_products`, `type_of_dimension_id_type_of_dimension`, `value`, `tolerance`, `interval_max`, `interval_min`) VALUES (1, 1, 1, 1, '1', 1, 1);
INSERT INTO `test1`.`dimension` (`id_dimension`, `products_id_products`, `type_of_dimension_id_type_of_dimension`, `value`, `tolerance`, `interval_max`, `interval_min`) VALUES (2, 2, 2, 2, '2', 2, 2);
INSERT INTO `test1`.`dimension` (`id_dimension`, `products_id_products`, `type_of_dimension_id_type_of_dimension`, `value`, `tolerance`, `interval_max`, `interval_min`) VALUES (3, 3, 3, 3, '3', 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test1`.`mensuration`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`mensuration` (`id_mensuration`, `measurement_id_measurement`, `control_measurements_id_control_measurements`, `dimension_id_dimension`, `sample_numer`, `value`) VALUES (1, 1, 1, 1, 1, 1);
INSERT INTO `test1`.`mensuration` (`id_mensuration`, `measurement_id_measurement`, `control_measurements_id_control_measurements`, `dimension_id_dimension`, `sample_numer`, `value`) VALUES (2, 2, 2, 2, 2, 2);
INSERT INTO `test1`.`mensuration` (`id_mensuration`, `measurement_id_measurement`, `control_measurements_id_control_measurements`, `dimension_id_dimension`, `sample_numer`, `value`) VALUES (3, 3, 3, 3, 3, 3);

COMMIT;

