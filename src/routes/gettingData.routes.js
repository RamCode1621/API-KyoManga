const {Router}=require('express')
const router=Router()

const {getMangaka,getDemografia,getGenero,getMangas,getMangaInfo, getCapitulosManga, getInfoCapitulo, getCapituloCascade}=require('../controllers/getting.controllers')
  
router.get('/genero',getGenero)
router.get('/demografia',getDemografia)
router.get('/mangaka',getMangaka)
 
router.get('/mangas',getMangas)
router.get('/manga/:name',getMangaInfo)
router.get('/manga/:name/capitulos',getCapitulosManga)
router.get('/manga/:name/capitulo/:numberCap',getInfoCapitulo)
router.get('/manga/:name/capitulo/:numberCap/cascade',getCapituloCascade)

module.exports=router