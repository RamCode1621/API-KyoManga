const {Router}=require('express')
const router=Router()

const mysqlConnection=require('../mysql.config')
 
router.get('/',(req,res)=>{
    const myQuery=`SELECT Capitulo.nombre as Titulo , color as Color ,numeroCapitulo as Numero_capitulo, numeroPaginas as Numero_paginas, Manga.nombre as Manga , Scan.apodo as Scan FROM Capitulo inner join Manga on Capitulo.Manga_id = Manga.id inner join Scan on Capitulo.Scan_id = Scan.id WHERE Manga.nombre = "dr,stone";` 
    mysqlConnection.query(myQuery,(error,rows,filds)=>{
        if(!error){
            res.json(rows)
        }else{
            res.json(error)
        }
    })
})

module.exports=router