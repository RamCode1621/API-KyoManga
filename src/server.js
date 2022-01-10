const morgan = require('morgan')
const express=require('express')
const app=express()
//Middlewares
app.use(express.json())
app.use(morgan('dev'))
app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods','GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
})


//Routes
// Getting data
app.use(require('./routes/gettingData.routes'))


//Statis files


module.exports=app