const querys=[]

querys.Genero=`SELECT * FROM GeneroManga ;`
querys.Demografia=`SELECT * FROM Demografia ;`
querys.Mangaka=`SELECT * FROM Mangaka ;`

querys.Manga=`SELECT * from vista_Mangas ;
` 
querys.MangaInfo=(manga_name)=>{
    return `SELECT nombre as Nombre, numeroCapitulos as Numero_capitulos, Estado.tipo as Estado, Demografia.tipo as Demografia , Mangaka.autor as Mangaka FROM Manga inner join Estado on Manga.Estado_id = Estado.id inner join Demografia on Manga.Demografia_id = Demografia.id inner join Mangaka on Manga.Mangaka_id = Mangaka.id WHERE Nombre = "${manga_name}";` 
}

querys.CapitulosManga=(manga_name)=>{
    return`SELECT Capitulo.id as id, Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan
    FROM Capitulo inner join Manga 
    on Capitulo.Manga_id = Manga.id 
    inner join Scan
    on Capitulo.Scan_id = Scan.id
    WHERE Manga.nombre = "${manga_name}";`
}

querys.InfoCapituloManga=(name_manga,number)=>{
    return `SELECT Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan
    FROM Capitulo inner join Manga 
    on Capitulo.Manga_id = Manga.id 
    inner join Scan
    on Capitulo.Scan_id = Scan.id
    WHERE Manga.nombre = "${name_manga}" and numeroCapitulo =  ${number} ;`
}

querys.PaginasCapituloCascade=(nameManga,numberCap)=>{
    return `SELECT Pagina.numeroPagina as Numero_pagina, Pagina.Url as Link , Capitulo.nombre as Titulo_Capitulo,Capitulo.numeroCapitulo as Numero_Capitulo,Manga.nombre as Titulo_Manga
    FROM Pagina inner join Capitulo
    on Pagina.Capitulo_id = Capitulo.id 
    inner join Manga
    on Pagina.Manga_id = Manga.id
    where Manga.nombre="${nameManga}" and Capitulo.numeroCapitulo=${numberCap};`
}

module.exports= querys