const {Router}=require('express')
const router=Router()

const {addGenero,addDemografia,addMangaka,addScan,addManga,addCapitulo,addPagina} = require('../controllers/adding.controllers')

router.post('/addGenero',addGenero)
router.post('/addDemografia',addDemografia)
router.post('/addMangaka',addMangaka)
router.post('/addScan',addScan)

router.post('/addManga',addManga)
router.post('/addCapitulo',addCapitulo)
router.post('/addPaginas',addPagina)
 
module.exports=router