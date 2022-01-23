const {Router}=require('express')
const router=Router()
 
router.post('/addManga')
router.post('/addCapitulo')
router.post('/addScan')
router.post('/addPaginas')
router.post('/addGenero')
router.post('/addDemografia')
router.post('/addMangaka')

module.exports=router