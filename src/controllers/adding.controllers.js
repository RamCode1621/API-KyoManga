const cloudinary = require('cloudinary');
const fs =require('fs-extra')
const ControllerAdding=[]
const {addGenero,addDemografia,addMangaka,addScan,addManga,addCapitulo,addPagina}=require('../querys/adding')
const mysqlConnection=require('../mysql.config');



cloudinary.config({
    cloud_name: process.env.CLOUDINARY_NAME,
    api_key: process.env.CLOUDINARY_KEY,
    api_secret:process.env.CLOUDINARY_SECRET
})
 
function doQuery(res,query) {
     mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            console.log(rows)
            res.json({
                message:"Se agrego correctamente"
            })
        }else{
            res.json({
                message:"No se agrego error"
            })
        }
    }) 
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

ControllerAdding.addManga=async(req,res)=>{
    const {nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion}=req.body
    const portada=req.files[0].path
    const resCloudunary=await cloudinary.v2.uploader.upload(portada)
    const query=addManga(nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,resCloudunary.url)
    await fs.unlink(portada)
    doQuery(res,query)
}

ControllerAdding.addCapitulo=(req,res)=>{
    const {nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId}=req.body
    const query=addCapitulo(nombreCapitulo,color, numeroPaginas, numeroCapitulo ,mangaId ,scanId)
    doQuery(res,query)
}

ControllerAdding.addPagina =(req,res)=>{
    const {mangaId,scanId,capituloId}=req.body
    const files=req.files
    files.forEach((item)=>{
        sendImage(item,mangaId,scanId,capituloId)
    })

    async function sendImage (element,mangaId,scanId,capituloId) {
        const resCloudunary=await cloudinary.v2.uploader.upload(element.path)
        querys=addPagina(parseInt(element.originalname),resCloudunary.url,capituloId,mangaId,scanId)
        await fs.unlink(element.path)
        
        mysqlConnection.query(querys,(error,rows,filds)=>{
            if(!error){
                console.log(rows)
            }else{
                console.log(error)
            }
        }) 
    }

}

module.exports=ControllerAdding