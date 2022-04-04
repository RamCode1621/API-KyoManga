const mysql=require('mysql')

const connection=mysql.createConnection({
    host:process.env.SQL_HOST,
    port:process.env.SQL_PORT,
    user:process.env.SQL_USER,
    password:process.env.SQL_PASSWORD,
    database:process.env.SQL_DEFAULT_SCHEMA,
    multipleStatements:true,
    connectionLimit : 100,
    waitForConnections : false,
    queueLimit :0,
    wait_timeout : 28800,
    connect_timeout :10
})

connection.connect(function (error) {
    if(error)throw error
    console.log('Database is connect!!!')
}) 

module.exports=connection