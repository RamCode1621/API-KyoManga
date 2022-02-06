const querys=[]

querys.addGenero=(nombreGenero)=>{
    return `INSERT INTO Genero (tipo) VALUES ('${nombreGenero}');`
}

querys.addDemografia=(demografiaGenero)=>{
    return `INSERT INTO Demografia (tipo) VALUES ('${demografiaGenero}');`
}

querys.addMangaka=(mangakaGenero,uriAvatar)=>{
    return `INSERT INTO Mangaka (Autor, Avatar_url) VALUES ('${mangakaGenero}','${uriAvatar}');`
}

querys.addScan=(apodo,email,password)=>{
    return `INSERT INTO Scan (apodo, correo, clave) VALUES ('${apodo}', '${email}', '${password}');`
}

querys.addManga=(nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada)=>{
    return `INSERT INTO Manga (nombre, numeroCapitulos, Estado_id, Demografia_id, Mangaka_id, Descripcion,portada) VALUES ('${nombreManga}',${numCapitulos} ,${estadoID},${demografiaID},${mangakaID}, '${descripcion}',' ${portada}');`
}

querys.addCapitulo=(nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId)=>{
    return `INSERT INTO Capitulo (nombre, color, numeroPaginas,numeroCapitulo, Manga_id, Scan_id) VALUES ('${nombreCapitulo}','${color}', ${numeroPaginas}, ${numeroCapitulo} ,${mangaId} ,${scanId});`
}  


querys.addPagina=(numeroPagina,url,capituloId,mangaId,scanId)=>{
    return `INSERT INTO Pagina (numeroPagina, url, Capitulo_id,Manga_id,Scan_id) VALUES (${numeroPagina},'${url}',${capituloId},${mangaId},${scanId});`
}


module.exports=querys