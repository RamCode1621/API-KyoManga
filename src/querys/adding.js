const querys=[]

querys.addGenero=(nombreGenero)=>{
    return `CALL addGenero('${nombreGenero}');`
}

querys.addDemografia=(demografiaGenero)=>{
    return `CALL addDemografia ('${demografiaGenero}');`
}

querys.addMangaka=(mangakaNombre,uriAvatar)=>{
    return `CALL addMangaka ('${mangakaNombre}','${uriAvatar}');`
}

querys.addScan=(apodo,email,password)=>{
    return `CALL addScan ('${apodo}', '${email}', '${password}');`
}

querys.addManga=(nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada)=>{
    return ` CALL addManga ('${nombreManga}',${numCapitulos} ,${estadoID},${demografiaID},${mangakaID}, '${descripcion}',' ${portada}');`
}

querys.addCapitulo=(nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId)=>{
    return `CALL addCapitulo('${nombreCapitulo}','${color}', ${numeroPaginas}, ${numeroCapitulo} ,${mangaId} ,${scanId});`
}  

querys.addPagina=(numeroPagina,url,capituloId,mangaId,scanId)=>{
    return `CALL addPagina(${numeroPagina},'${url}',${capituloId},${mangaId},${scanId});`
}


module.exports=querys