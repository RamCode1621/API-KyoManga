
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
