/*==============================================================*/
/*Insercion de datos para cada tabla*/
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
INSERT INTO Mangaka (Autor, Avatar_url) VALUES
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
INSERT INTO Manga (nombre, numeroCapitulos, Estado_id, Demografia_id, Mangaka_id, Descripcion) VALUES
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

/*==============================================================*/
/*Consulas con (SELECT * FROM) */
/*Consulas general de la tabla GeneroManga*/
SELECT * FROM GeneroManga ;
/*Consulas general de la tabla Pagina*/
SELECT * FROM Pagina ;
/*Consulas general de la tabla Capitulo*/
SELECT * FROM Capitulo ;
/*Consulas general de la tabla Manga*/
SELECT * FROM Manga ;
/*Consulas general de la tabla Genero*/
SELECT * FROM Genero ;
/*Consulas general de la tabla Mangaka*/
SELECT * FROM Mangaka ;
/*Consulas general de la tabla Estado*/
SELECT * FROM Estado ;
/*Consulas general de la tabla Demografia*/
SELECT * FROM Demografia ;
/*Consulas general de la tabla Scan*/
SELECT * FROM Scan ;

/*==============================================================*/
/*Consulas especificas con (SELECT FROM) */
/* Consulta de algunos atributos en especifico de la tabla GeneroManga*/
SELECT Manga_id , Genero_id
FROM GeneroManga;
/* Consulta de algunos atributos en especifico de la tabla Pagina*/
SELECT numeroPagina, Url, Capitulo_id
FROM Pagina;
/* Consulta de algunos atributos en especifico de la tabla Scan*/
SELECT apodo, correo, clave
FROM Scan;  
/* Consulta de algunos atributos en especifico de la tabla Capitulo*/
SELECT nombre, color, numeroPaginas,numeroCapitulo, Manga_id, Scan_id
FROM Capitulo;  
/* Consulta de algunos atributos en especifico de la tabla Manga*/
SELECT nombre, numeroCapitulos, Estado_id, Demografia_id, Mangaka_id , Descripcion
FROM Manga;
/* Consulta de algunos atributos en especifico de la tabla Genero*/
SELECT tipo
FROM Genero;
/* Consulta de algunos atributos en especifico de la tabla Mangaka*/
SELECT Autor, Avatar_url
FROM Mangaka;
/* Consulta de algunos atributos en especifico de la tabla Estado*/
SELECT tipo
FROM Estado;
/* Consulta de algunos atributos en especifico de la tabla Demografia*/
SELECT tipo
FROM Demografia;
/* Consulta de algunos atributos en especifico de la tabla Scan*/
SELECT apodo, correo, clave
FROM Scan;

/*==============================================================*/
/*consulta absoluta de la tabla de Manga*/
SELECT nombre, numeroCapitulos, Estado.tipo, Demografia.tipo, Mangaka.tipo , Descripcion
FROM Manga inner join Estado 
on Manga.Estado_id = Estado.id 
inner join Demografia
on Manga.Demografia_id = Demografia.id
inner join Mangaka
on Manga.Mangaka_id = Mangaka.id ;

/*consulta absoluta de la tabla de Capitulo*/
SELECT Capitulo.nombre, color,numeroCapitulo, numeroPaginas, Manga.nombre, Scan.apodo
FROM Capitulo inner join Manga 
on Capitulo.Manga_id = Manga.id 
inner join Scan
on Capitulo.Scan_id = Scan.id;

/*consulta de la tabla genero_manga*/
SELECT DISTINCT Manga.nombre , Genero.tipo
FROM GeneroManga inner join Manga 
on GeneroManga.Manga_id = Manga.id 
inner join Genero
on GeneroManga.Genero_id = Genero.id;

/*consulta de la tabla pagina*/
SELECT numeroPagina, Url, Capitulo.nombre
FROM Pagina inner join Capitulo
on Pagina.Capitulo_id = Capitulo.id ;

/*==============================================================*/
/*Vistas de las consultas*/
/*Consulta de Mangas*/
CREATE VIEW vista_Mangas
as
SELECT nombre as Nombre, numeroCapitulos as Numero_capitulos, Estado.tipo as Estado, Demografia.tipo as Demografia , Mangaka.tipo as Mangaka , Descripcion
FROM Manga inner join Estado 
on Manga.Estado_id = Estado.id 
inner join Demografia
on Manga.Demografia_id = Demografia.id
inner join Mangaka
on Manga.Mangaka_id = Mangaka.id ;

/*Consulta de Capitulos*/
CREATE VIEW vista_Capitulos
as 
SELECT Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan
FROM Capitulo inner join Manga 
on Capitulo.Manga_id = Manga.id 
inner join Scan
on Capitulo.Scan_id = Scan.id;

/*Consulta de genero_manga*/
CREATE VIEW vista_Generos_Mangas
as 
SELECT DISTINCT Manga.nombre as Manga , Genero.tipo as Genero
FROM GeneroManga inner join Manga 
on GeneroManga.Manga_id = Manga.id 
inner join Genero
on GeneroManga.Genero_id = Genero.id;

/*Consulta de Pagina*/
CREATE VIEW vista_Paginas
as 
SELECT numeroPagina as Numero_pagina, Url as Link , Capitulo.nombre as Titulo_Capitulo
FROM Pagina inner join Capitulo
on Pagina.Capitulo_id = Capitulo.id ;

/*==============================================================*/
/*Consultas especificas*/
/*Nombre*/
SELECT nombre as Nombre, numeroCapitulos as Numero_capitulos, Estado.tipo as Estado, Demografia.tipo as Demografia , Mangaka.autor as Mangaka
FROM Manga inner join Estado 
on Manga.Estado_id = Estado.id 
inner join Demografia
on Manga.Demografia_id = Demografia.id
inner join Mangaka
on Manga.Mangaka_id = Mangaka.id 
WHERE Nombre = "one piece";

/*Capitulos*/
SELECT Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan
FROM Capitulo inner join Manga 
on Capitulo.Manga_id = Manga.id 
inner join Scan
on Capitulo.Scan_id = Scan.id
WHERE Manga.nombre = "dr,stone";

/*Consultando el capitulo especifico de un manga */
SELECT Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan
FROM Capitulo inner join Manga 
on Capitulo.Manga_id = Manga.id 
inner join Scan
on Capitulo.Scan_id = Scan.id
WHERE Manga.nombre = "dr,stone" and numeroCapitulo =  1 ;

--Creando procedimientos almacenados

delimiter //
create procedure addGenero(_nombre varchar(45))
begin 
	INSERT INTO Genero (tipo) VALUES (_nombre);
end;//

delimiter //
create procedure addDemografia(_nombre varchar(45))
begin 
	INSERT INTO Demografia (tipo) VALUES (_nombre);
end;//

delimiter //
create procedure addMangaka(_nombreAutor varchar(45),_uriAvatar varchar(150))
begin 
	INSERT INTO Mangaka (_nombreAutor, Avatar_url) VALUES (_nomberAutor,_uriAvatar);
end;//

delimiter //
create procedure addScan(_nombre varchar(45),_email varchar(45),_password varchar(45))
begin 
	INSERT INTO Scan (apodo, correo, clave) VALUES (_nombre, _email, _password);
end;//

delimiter //
create procedure addManga(
	_nombre varchar(45),
	_numeroCapitulos INT(11),
	_estadoId INT(11),
	_demografiaId INT(11),
	_mangakaId INT(11),
	_descripcion TEXT,
	_portadaUri LONGTEXT)
begin 
	INSERT INTO Manga (nombre, numeroCapitulos, Estado_id, Demografia_id, Mangaka_id, Descripcion, portada) 
	VALUES (_nombre,_numeroCapitulos,_estadoId,_demografiaId,_mangakaId,_descripcion,_portadaUri);
end;//

delimiter //
create procedure addCapitulo(
	_nombre varchar(45),
	_color varchar(45),
	_numeroPaginas INT(3),
	_numeroCapitulo INT(5),
	_mangaId INT(11),
	_scanId INT(11))
begin 
	INSERT INTO Capitulo (nombre, color, numeroPaginas,numeroCapitulo, Manga_id, Scan_id) 
    VALUES (_nombre,_color,_numeroPaginas, _numeroCapitulo,_mangakaId,_scanId);
end;//

delimiter //
create procedure addPagina(
	numeroPagina INT(3),
    url VARCHAR (45),
    capituloId INT(11),
    mangaId INT(11),
    scanId INT(11))
begin 
	INSERT INTO Capitulo (nombre, color, numeroPaginas,numeroCapitulo, Manga_id, Scan_id) 
    VALUES (_nombre,_color,_numeroPaginas, _numeroCapitulo,_mangakaId,_scanId);
end;//