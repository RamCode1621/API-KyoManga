const ControllerGetting=[]

const mysqlConnection=require('../mysql.config')

const {Demografia,Mangaka,Genero,Manga,MangaInfo,CapitulosManga,InfoCapituloManga, PaginasCapituloCascade}=require('../querys/getting')

function doQuery(res,query) {
    mysqlConnection.query(query,(error,rows,filds)=>{
       if(!error){
           res.json(rows)
            // console.log(rows) 
       }else{
           console.log('Error: query rejected!!!')
           res.json(error)
       } 
   }) 
}

ControllerGetting.getGenero=(req,res)=>{
    doQuery(res,Genero)
}

ControllerGetting.getDemografia=(req,res)=>{
    doQuery(res,Demografia)
}

ControllerGetting.getMangaka=(req,res)=>{
    doQuery(res,Mangaka)
}

ControllerGetting.getMangas=(req,res)=>{
    doQuery(res,Manga)
}

ControllerGetting.getMangaInfo=(req,res)=>{
    const {name}=req.params
    const query=MangaInfo(name)
    doQuery(res,query)
}

ControllerGetting.getCapitulosManga=(req,res)=>{
    const {name}=req.params
    const query=CapitulosManga(name)
    doQuery(res,query)
}

ControllerGetting.getInfoCapitulo=(req,res)=>{
    const {name,numberCap}=req.params
    const query=InfoCapituloManga(name,numberCap)
    doQuery(res,query)
}


ControllerGetting.getCapituloCascade=(req,res)=>{
    const {name,numberCap,scan}=req.params
    const query=PaginasCapituloCascade(name,numberCap,scan)
    doQuery(res,query)
}

module.exports=ControllerGetting