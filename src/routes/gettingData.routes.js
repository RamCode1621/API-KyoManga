const {Router}=require('express')
const router=Router()

const {getMangas,getMangaInfo, getCapitulosManga, getInfoCapitulo, getCapituloCascade}=require('../controllers/getting.controllers')
 
router.get('/mangas',getMangas)
router.get('/manga/:name',getMangaInfo)
router.get('/manga/:name/capitulos',getCapitulosManga)
router.get('/manga/:name/capitulo/:numberCap',getInfoCapitulo)
router.get('/manga/:name/capitulo/:numberCap/scan-traductor/:scan/cascade',getCapituloCascade)

module.exports=router