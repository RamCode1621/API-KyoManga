require('dotenv').config('./')
// require('./src/mysql.config') 
const app=require('./src/server')
const mysql=require('mysql')
const port=process.env.PORT



app.listen(port,(req,res)=>{
    console.log(`Server on port: ${port}`)
})  