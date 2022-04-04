const morgan = require('morgan')
const express=require('express')
const multer=require('multer')
const path=require('path')
const mysql=require('mysql')

// Initializations
const app=express()

// Settings


//Middlewares
app.use(express.json())
app.use(morgan('dev'))
app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods','GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
})
// app.use(multer({dest:path.join(__dirname,'../public/images')}).single('file'))
app.use(multer({dest:path.join(__dirname,'../public/images')}).array('files'))

//Routes
// Getting data
app.use(require('./routes/gettingData.routes'))
// Posting data
app.use(require('./routes/addingData.routes'))

//Statis files
app.use(express.static(path.join(__dirname,'../public')))

module.exports=app