-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema boe8cldhqnmp68gj9fn5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema boe8cldhqnmp68gj9fn5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `boe8cldhqnmp68gj9fn5` DEFAULT CHARACTER SET utf8 ;
USE `boe8cldhqnmp68gj9fn5` ;

-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Demografia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Demografia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Estado` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Mangaka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Mangaka` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Autor` VARCHAR(45) NOT NULL,
  `Avatar_url` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Manga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Manga` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `numeroCapitulos` INT(11) NULL DEFAULT NULL,
  `Descripcion` TEXT NULL DEFAULT NULL,
  `Estado_id` INT(11) NULL DEFAULT NULL,
  `Demografia_id` INT(11) NULL DEFAULT NULL,
  `Mangaka_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Manga_Estado_idx` (`Estado_id` ASC) VISIBLE,
  INDEX `fk_Manga_Demografia1_idx` (`Demografia_id` ASC) VISIBLE,
  INDEX `fk_Manga_Mangaka1_idx` (`Mangaka_id` ASC) VISIBLE,
  CONSTRAINT `fk_Manga_Demografia1`
    FOREIGN KEY (`Demografia_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Demografia` (`id`),
  CONSTRAINT `fk_Manga_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Estado` (`id`),
  CONSTRAINT `fk_Manga_Mangaka1`
    FOREIGN KEY (`Mangaka_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Mangaka` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Scan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Scan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `apodo` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Capitulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Capitulo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `numeroPaginas` INT(3) NULL DEFAULT NULL,
  `numeroCapitulo` INT(5) NULL DEFAULT NULL,
  `Manga_id` INT(11) NULL DEFAULT NULL,
  `Scan_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Capitulo_Manga1_idx` (`Manga_id` ASC) VISIBLE,
  INDEX `fk_Capitulo_Scan1_idx` (`Scan_id` ASC) VISIBLE,
  CONSTRAINT `fk_Capitulo_Manga1`
    FOREIGN KEY (`Manga_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Manga` (`id`),
  CONSTRAINT `fk_Capitulo_Scan1`
    FOREIGN KEY (`Scan_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Scan` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Genero` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`GeneroManga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`GeneroManga` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Manga_id` INT(11) NULL DEFAULT NULL,
  `Genero_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_GeneroManga_Manga1_idx` (`Manga_id` ASC) VISIBLE,
  INDEX `fk_GeneroManga_Genero1_idx` (`Genero_id` ASC) VISIBLE,
  CONSTRAINT `fk_GeneroManga_Genero1`
    FOREIGN KEY (`Genero_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Genero` (`id`),
  CONSTRAINT `fk_GeneroManga_Manga1`
    FOREIGN KEY (`Manga_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Manga` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `boe8cldhqnmp68gj9fn5`.`Pagina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`Pagina` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroPagina` INT(3) NULL DEFAULT NULL,
  `url` VARCHAR(45) NULL DEFAULT NULL,
  `Capitulo_id` INT(11) NULL DEFAULT NULL,
  `Manga_id` INT(11) NULL DEFAULT NULL,
  `Scan_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pagina_Capitulo1_idx` (`Capitulo_id` ASC) VISIBLE,
  INDEX `fk_Pagina_Manga1_idx` (`Manga_id` ASC) VISIBLE,
  INDEX `fk_Pagina_Scan1_idx` (`Scan_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pagina_Capitulo1`
    FOREIGN KEY (`Capitulo_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Capitulo` (`id`),
  CONSTRAINT `fk_Pagina_Manga1`
    FOREIGN KEY (`Manga_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Manga` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pagina_Scan1`
    FOREIGN KEY (`Scan_id`)
    REFERENCES `boe8cldhqnmp68gj9fn5`.`Scan` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 108
DEFAULT CHARACTER SET = utf8;

USE `boe8cldhqnmp68gj9fn5` ;

-- -----------------------------------------------------
-- Placeholder table for view `boe8cldhqnmp68gj9fn5`.`vista_Capitulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Capitulos` (`Titulo` INT, `Color` INT, `Numero_capitulo` INT, `Numero_paginas` INT, `Manga` INT, `Scan` INT);

-- -----------------------------------------------------
-- Placeholder table for view `boe8cldhqnmp68gj9fn5`.`vista_Generos_Mangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Generos_Mangas` (`Manga` INT, `Genero` INT);

-- -----------------------------------------------------
-- Placeholder table for view `boe8cldhqnmp68gj9fn5`.`vista_Mangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Mangas` (`Nombre` INT, `Mangaka` INT, `Numero_capitulos` INT, `Estado` INT, `Demografia` INT, `Descripcion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `boe8cldhqnmp68gj9fn5`.`vista_Paginas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Paginas` (`Numero_pagina` INT, `Link` INT, `Titulo_Capitulo` INT, `Titulo_Manga` INT);

-- -----------------------------------------------------
-- View `boe8cldhqnmp68gj9fn5`.`vista_Capitulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Capitulos`;
USE `boe8cldhqnmp68gj9fn5`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`up9uopxo6uqreh7d`@`%` SQL SECURITY DEFINER VIEW `boe8cldhqnmp68gj9fn5`.`vista_Capitulos` AS select `boe8cldhqnmp68gj9fn5`.`Capitulo`.`nombre` AS `Titulo`,`boe8cldhqnmp68gj9fn5`.`Capitulo`.`color` AS `Color`,`boe8cldhqnmp68gj9fn5`.`Capitulo`.`numeroCapitulo` AS `Numero_capitulo`,`boe8cldhqnmp68gj9fn5`.`Capitulo`.`numeroPaginas` AS `Numero_paginas`,`boe8cldhqnmp68gj9fn5`.`Manga`.`nombre` AS `Manga`,`boe8cldhqnmp68gj9fn5`.`Scan`.`apodo` AS `Scan` from ((`boe8cldhqnmp68gj9fn5`.`Capitulo` join `boe8cldhqnmp68gj9fn5`.`Manga` on((`boe8cldhqnmp68gj9fn5`.`Capitulo`.`Manga_id` = `boe8cldhqnmp68gj9fn5`.`Manga`.`id`))) join `boe8cldhqnmp68gj9fn5`.`Scan` on((`boe8cldhqnmp68gj9fn5`.`Capitulo`.`Scan_id` = `boe8cldhqnmp68gj9fn5`.`Scan`.`id`)));

-- -----------------------------------------------------
-- View `boe8cldhqnmp68gj9fn5`.`vista_Generos_Mangas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Generos_Mangas`;
USE `boe8cldhqnmp68gj9fn5`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`up9uopxo6uqreh7d`@`%` SQL SECURITY DEFINER VIEW `boe8cldhqnmp68gj9fn5`.`vista_Generos_Mangas` AS select distinct `boe8cldhqnmp68gj9fn5`.`Manga`.`nombre` AS `Manga`,`boe8cldhqnmp68gj9fn5`.`Genero`.`tipo` AS `Genero` from ((`boe8cldhqnmp68gj9fn5`.`GeneroManga` join `boe8cldhqnmp68gj9fn5`.`Manga` on((`boe8cldhqnmp68gj9fn5`.`GeneroManga`.`Manga_id` = `boe8cldhqnmp68gj9fn5`.`Manga`.`id`))) join `boe8cldhqnmp68gj9fn5`.`Genero` on((`boe8cldhqnmp68gj9fn5`.`GeneroManga`.`Genero_id` = `boe8cldhqnmp68gj9fn5`.`Genero`.`id`)));

-- -----------------------------------------------------
-- View `boe8cldhqnmp68gj9fn5`.`vista_Mangas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Mangas`;
USE `boe8cldhqnmp68gj9fn5`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`up9uopxo6uqreh7d`@`%` SQL SECURITY DEFINER VIEW `boe8cldhqnmp68gj9fn5`.`vista_Mangas` AS select `boe8cldhqnmp68gj9fn5`.`Manga`.`nombre` AS `Nombre`,`boe8cldhqnmp68gj9fn5`.`Mangaka`.`Autor` AS `Mangaka`,`boe8cldhqnmp68gj9fn5`.`Manga`.`numeroCapitulos` AS `Numero_capitulos`,`boe8cldhqnmp68gj9fn5`.`Estado`.`tipo` AS `Estado`,`boe8cldhqnmp68gj9fn5`.`Demografia`.`tipo` AS `Demografia`,`boe8cldhqnmp68gj9fn5`.`Manga`.`Descripcion` AS `Descripcion` from (((`boe8cldhqnmp68gj9fn5`.`Manga` join `boe8cldhqnmp68gj9fn5`.`Estado` on((`boe8cldhqnmp68gj9fn5`.`Manga`.`Estado_id` = `boe8cldhqnmp68gj9fn5`.`Estado`.`id`))) join `boe8cldhqnmp68gj9fn5`.`Demografia` on((`boe8cldhqnmp68gj9fn5`.`Manga`.`Demografia_id` = `boe8cldhqnmp68gj9fn5`.`Demografia`.`id`))) join `boe8cldhqnmp68gj9fn5`.`Mangaka` on((`boe8cldhqnmp68gj9fn5`.`Manga`.`Mangaka_id` = `boe8cldhqnmp68gj9fn5`.`Mangaka`.`id`)));

-- -----------------------------------------------------
-- View `boe8cldhqnmp68gj9fn5`.`vista_Paginas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boe8cldhqnmp68gj9fn5`.`vista_Paginas`;
USE `boe8cldhqnmp68gj9fn5`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`up9uopxo6uqreh7d`@`%` SQL SECURITY DEFINER VIEW `boe8cldhqnmp68gj9fn5`.`vista_Paginas` AS select `boe8cldhqnmp68gj9fn5`.`Pagina`.`numeroPagina` AS `Numero_pagina`,`boe8cldhqnmp68gj9fn5`.`Pagina`.`url` AS `Link`,`boe8cldhqnmp68gj9fn5`.`Capitulo`.`nombre` AS `Titulo_Capitulo`,`boe8cldhqnmp68gj9fn5`.`Manga`.`nombre` AS `Titulo_Manga` from ((`boe8cldhqnmp68gj9fn5`.`Pagina` join `boe8cldhqnmp68gj9fn5`.`Capitulo` on((`boe8cldhqnmp68gj9fn5`.`Pagina`.`Capitulo_id` = `boe8cldhqnmp68gj9fn5`.`Capitulo`.`id`))) join `boe8cldhqnmp68gj9fn5`.`Manga` on((`boe8cldhqnmp68gj9fn5`.`Pagina`.`Manga_id` = `boe8cldhqnmp68gj9fn5`.`Manga`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
