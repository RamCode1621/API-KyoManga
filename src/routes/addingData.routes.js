const {Router}=require('express')
const router=Router()

const {addGenero,addDemografia,addMangaka,addScan,addManga} = require('../controllers/adding.controllers')

router.post('/addGenero',addGenero)
router.post('/addDemografia',addDemografia)
router.post('/addMangaka',addMangaka)
router.post('/addScan',addScan)

router.post('/addManga',addManga)
router.post('/addCapitulo')
router.post('/addPaginas')
 
module.exports=router