/*Demografia*/
CREATE TABLE IF NOT EXISTS `Demografia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*Genero*/
CREATE TABLE IF NOT EXISTS `Genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*Mangaka*/
CREATE TABLE IF NOT EXISTS `Mangaka` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*Estado*/
CREATE TABLE IF NOT EXISTS `Estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*Scan*/
CREATE TABLE IF NOT EXISTS `Scan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `apodo` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

/*Manga*/
CREATE TABLE IF NOT EXISTS `Manga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `numeroCapitulos` INT NULL,
  `Estado_id` INT NOT NULL,
  `Demografia_id` INT NOT NULL,
  `Mangaka_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Manga_Estado_idx` (`Estado_id` ASC) VISIBLE,
  INDEX `fk_Manga_Demografia1_idx` (`Demografia_id` ASC) VISIBLE,
  INDEX `fk_Manga_Mangaka1_idx` (`Mangaka_id` ASC) VISIBLE,
  CONSTRAINT `fk_Manga_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manga_Demografia1`
    FOREIGN KEY (`Demografia_id`)
    REFERENCES `Demografia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manga_Mangaka1`
    FOREIGN KEY (`Mangaka_id`)
    REFERENCES `Mangaka` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*Capitulo*/
CREATE TABLE IF NOT EXISTS `Capitulo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `numeroPaginas` VARCHAR(45) NULL,
  `Manga_id` INT NOT NULL,
  `Scan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Capitulo_Manga1_idx` (`Manga_id` ASC) VISIBLE,
  INDEX `fk_Capitulo_Scan1_idx` (`Scan_id` ASC) VISIBLE,
  CONSTRAINT `fk_Capitulo_Manga1`
    FOREIGN KEY (`Manga_id`)
    REFERENCES `Manga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capitulo_Scan1`
    FOREIGN KEY (`Scan_id`)
    REFERENCES `Scan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*Pagina*/
CREATE TABLE IF NOT EXISTS `Pagina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numeroPagina` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `Capitulo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pagina_Capitulo1_idx` (`Capitulo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pagina_Capitulo1`
    FOREIGN KEY (`Capitulo_id`)
    REFERENCES `Capitulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*GeneroManga*/
CREATE TABLE IF NOT EXISTS `GeneroManga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Manga_id` INT NOT NULL,
  `Genero_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_GeneroManga_Manga1_idx` (`Manga_id` ASC) VISIBLE,
  INDEX `fk_GeneroManga_Genero1_idx` (`Genero_id` ASC) VISIBLE,
  CONSTRAINT `fk_GeneroManga_Manga1`
    FOREIGN KEY (`Manga_id`)
    REFERENCES `Manga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GeneroManga_Genero1`
    FOREIGN KEY (`Genero_id`)
    REFERENCES `Genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


show tables;
/*==============================================================*/
INSERT INTO Scan (apodo, correo, clave) VALUES
('Scan-san', 'simoemail@hotmail.com', 'f5f76t76it'),
('Soboro', 'thindemail@yahoo.com', 't76it786t'),
('Kenta-scan', 'redhatemail@gamil.com', 't76t87y8');
/*==============================================================*/
INSERT INTO Demografia (tipo) VALUES
('Seinen'),
('Shonen'),
('Shoujo'),
('Josei'),
('Kodomo');
/*==============================================================*/
INSERT INTO Estado (tipo) VALUES
('En emicion'), 
('En pausa'),
('Finalizado'),
('Cancelado');
/*==============================================================*/
INSERT INTO Mangaka (tipo) VALUES
('Riichiro Inagaki'), 
('Kentaro Miura'),
('Aka Akasaka'),
('Eiichirō Oda');
/*==============================================================*/
INSERT INTO Genero (tipo) VALUES
('Aventura'), 
('Comedia'),
('Romance'),
('Terror'), 
('Deportes'),
('Accion'),
('Sobrenatural'), 
('Ciencia ficccion');
/*==============================================================*/
INSERT INTO Manga (nombre, numeroCapitulos, Estado_id, Demografia_id, Mangaka_id) VALUES
('Berserk', 340 , 2, 2, 2),
('Kaguya-Sama', 160 ,1 , 2, 3),
('Oshi no Ko', 3 ,4, 4, 3),
('One Piece', 291 ,4, 5, 4);

/*==============================================================*/
INSERT INTO Capitulo (nombre, color, numeroPaginas,numeroCapitulo, Manga_id, Scan_id) VALUES
('Petrificacion','No', 23, 1 ,26 ,1),
('En un mundo de piedra','No', 17, 2, 26, 3),
('La cueba milagrosa', 'No', 21, 3, 26, 3),
('Los recuerdos de Kaska', 'Si', 30, 380, 31, 2),
('En medio del conflicto', 'No', 25, 60, 32, 3),
('Despedida', 'No', 17, 3 , 33, 1),
('La caide de Kaido', 'Si',24 , 1015, 34, 1);

select * from Capitulo;
/*==============================================================*/
INSERT INTO Pagina (numeroPagina, Url, Capitulo_id) VALUES
(1, 'e45e5y4eu547', 8),
(2, 'e45e5y4eu548', 8),
(3, 'e45e5y4eu549', 8),
(4, 'e45e5y4eu550', 8),
(5, 'e45e5y4eu551', 8),
(6, 'e45e5y4eu552', 8),
(7, 'e45e5y4eu553', 8),
(1, 'df645d65dfu76jr76r', 9),
(2, 'df645d65dfu76jr76r', 9),
(3, 'df645d65dfu76jr76r', 9),
(4, 'df645d65dfu76jr76r', 9),
(5, 'df645d65dfu76jr76r', 9),
(6, 'df645d65dfu76jr76r', 9),
(7, 'df645d65dfu76jr76r', 9),
(8, 'df645d65dfu76jr76r', 9),
(9, 'df645d65dfu76jr76r', 9),
(1, '76r76rt876rt76tr', 10),
(2, '77r76rt876rt76tr', 10),
(3, '78r76rt876rt76tr', 10),
(4, '79r76rt876rt76tr', 10),
(5, '80r76rt876rt76tr', 10),
(6, '81r76rt876rt76tr', 10),
(7, '82r76rt876rt76tr', 10),
(8, '83r76rt876rt76tr', 10),
(9, '84r76rt876rt76tr', 10);
/*==============================================================*/
INSERT INTO GeneroManga (Manga_id, Genero_id) VALUES
(26, 1),
(26, 2),
(26, 8),
(31, 1),
(31, 4),
(32, 3),
(33, 2),
(34, 1),
(34, 2);







