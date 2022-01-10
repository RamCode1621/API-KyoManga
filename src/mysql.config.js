const mysql=require('mysql')

const mysqlConnection=mysql.createConnection({
    host:process.env.SQL_HOST,
    port:process.env.SQL_PORT,
    user:process.env.SQL_USER,
    password:process.env.SQL_PASSWORD,
    database:process.env.SQL_DEFAULT_SCHEMA
})

mysqlConnection.connect(function (error) {
    if(error){
        console.log(error)
        return
    }else{
        console.log('Database is connected!!!')
    }
})

module.exports=mysqlConnection