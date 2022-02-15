const ControllerAdding=[]

const {addGenero,addDemografia,addMangaka,addScan,addManga,addCapitulo,addPagina}=require('../querys/adding')
const mysqlConnection=require('../mysql.config')
 
function doQuery(res,query) {
     mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        } 
    }) 
    // mysqlConnection.end()
}

ControllerAdding.addGenero=(req,res)=>{
    const {generoNombre}=req.body
    const query=addGenero(generoNombre)
    doQuery(res,query)
} 

ControllerAdding.addDemografia=(req,res)=>{
    const {demografiaNombre}=req.body
    const query=addDemografia(demografiaNombre)
    doQuery(res,query)
}

ControllerAdding.addMangaka=(req,res)=>{
    const {mangakaNombre,uriAvatar}=req.body
    const query=addMangaka(mangakaNombre,uriAvatar)
    doQuery(res,query)
}

ControllerAdding.addScan=(req,res)=>{
    const {apodo,email,password}=req.body
    const query=addScan(apodo,email,password)
    doQuery(res,query)
}

ControllerAdding.addManga=(req,res)=>{
    const {nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada}=req.body
    const query=addManga(nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada)
    doQuery(res,query)
}

ControllerAdding.addCapitulo=(req,res)=>{
    const {nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId}=req.body
    const query=addCapitulo(nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId)
    doQuery(res,query)
}

ControllerAdding.addPagina =(req,res)=>{
    const dataArray=req.body
    let querys=""
    dataArray.forEach((element)=>{
        const {numeroPagina,url,capituloId,mangaId,scanId}=element
        const stringQuery=addPagina(numeroPagina,url,capituloId,mangaId,scanId)
        querys+=stringQuery
    });
    // console.log(querys)
    doQuery(res,querys)
}

module.exports=ControllerAdding 