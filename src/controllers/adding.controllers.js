const ControllerAdding=[]

const {addGenero,addDemografia,addMangaka,addScan,addManga}=require('../querys/adding')
const mysqlConnection=require('../mysql.config')

ControllerAdding.addGenero=(req,res)=>{
    const {generoNombre}=req.body
    const query=addGenero(generoNombre)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
} 

ControllerAdding.addDemografia=(req,res)=>{
    const {demografiaNombre}=req.body
    const query=addDemografia(demografiaNombre)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

ControllerAdding.addMangaka=(req,res)=>{
    const {mangakaNombre}=req.body
    const query=addMangaka(mangakaNombre)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

ControllerAdding.addScan=(req,res)=>{
    const {apodo,email,password}=req.body
    const query=addScan(apodo,email,password)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

ControllerAdding.addManga=(req,res)=>{
    const {nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada}=req.body
    const query=addManga(nombreManga,numCapitulos,estadoID,demografiaID,mangakaID,descripcion,portada)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

module.exports=ControllerAdding 