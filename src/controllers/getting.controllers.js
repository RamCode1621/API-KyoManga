const ControllerGetting=[]

const mysqlConnection=require('../mysql.config')

const {Demografia,Mangaka,Genero,Manga,MangaInfo,CapitulosManga,InfoCapituloManga, PaginasCapituloCascade}=require('../querys/getting')

ControllerGetting.getGenero=(req,res)=>{
    mysqlConnection.query(Genero,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            res.json(error)
        }
    })
}

ControllerGetting.getDemografia=(req,res)=>{
    mysqlConnection.query(Demografia,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            res.json(error)
        }
    })
}

ControllerGetting.getMangaka=(req,res)=>{
    mysqlConnection.query(Mangaka,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            res.json(error)
        }
    })
}

ControllerGetting.getMangas=(req,res)=>{
    mysqlConnection.query(Manga,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            res.json(error)
        }
    })
}

ControllerGetting.getMangaInfo=(req,res)=>{
    const {name}=req.params
    const query=MangaInfo(name)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

ControllerGetting.getCapitulosManga=(req,res)=>{
    const {name}=req.params
    const queryMangaInfo=CapitulosManga(name)
    mysqlConnection.query(queryMangaInfo,(error,rows,filds)=>{
        if(!error){ 
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}

ControllerGetting.getInfoCapitulo=(req,res)=>{
    const {name,numberCap}=req.params
    const query=InfoCapituloManga(name,numberCap)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}


ControllerGetting.getCapituloCascade=(req,res)=>{
    const {name,numberCap,scan}=req.params
    const query=PaginasCapituloCascade(name,numberCap,scan)
    mysqlConnection.query(query,(error,rows,filds)=>{
        if(!error){ 
            res.json(rows)
        }else{
            console.log('Error: query rejected!!!')
            res.json(error)
        }
    })
}
module.exports=ControllerGetting