SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


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
  `id_products` INT NOT NULL,
  `products_name` VARCHAR(45) NOT NULL,
  `units_id_units` INT NOT NULL,
  `units_id_units1` INT NOT NULL,
  PRIMARY KEY (`id_products`),
  CONSTRAINT `fk_products_units1`
    FOREIGN KEY (`units_id_units`)
    REFERENCES `test1`.`units` (`id_units`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_units2`
    FOREIGN KEY (`units_id_units1`)
    REFERENCES `test1`.`units` (`id_units`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `products_name_UNIQUE` ON `test1`.`products` (`products_name` ASC);

CREATE INDEX `fk_products_units1_idx` ON `test1`.`products` (`units_id_units` ASC);

CREATE INDEX `fk_products_units2_idx` ON `test1`.`products` (`units_id_units1` ASC);


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
-- Table `test1`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test1`.`orders` ;

CREATE TABLE IF NOT EXISTS `test1`.`orders` (
  `id_orders` INT NOT NULL,
  PRIMARY KEY (`id_orders`))
ENGINE = InnoDB
COMMENT = 'Zamównienia';


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
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (1, '7201', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (2, '7503', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (3, '7773', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (4, '7774', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (5, '9876', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (6, '6548', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (7, '3526', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (8, '3215', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (9, '3211', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (10, '1383', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (11, '0654', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (12, '5162', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (13, '3218', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (14, '5651', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (15, '5166', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (16, '2121', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (17, '1355', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (18, '3843', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (19, '2138', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (20, '3491', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (21, '2166', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (22, '8451', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (23, '2256', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (24, '2241', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (25, '4598', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (26, '6549', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (27, '6542', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (28, '3162', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (29, '3212', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (30, '1080', 1, 2);
INSERT INTO `test1`.`products` (`id_products`, `products_name`, `units_id_units`, `units_id_units1`) VALUES (31, '2016', 1, 2);

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
-- Data for table `test1`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `test1`;
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (1);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (2);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (3);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (4);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (5);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (6);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (7);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (8);
INSERT INTO `test1`.`orders` (`id_orders`) VALUES (9);

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
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (1, 1, 1);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (2, 2, 2);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (3, 3, 3);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (4, 4, 1);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (5, 5, 2);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (6, 6, 3);
INSERT INTO `test1`.`packages` (`id_packages`, `type_of_packages_id_type_of_packages`, `warehouse_id_warehouse`) VALUES (7, 7, 1);

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

