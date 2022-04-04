const mysql=require('mysql')

let mysqlConnection

let configConnection={
    host:process.env.SQL_HOST,
    port:process.env.SQL_PORT,
    user:process.env.SQL_USER,
    password:process.env.SQL_PASSWORD,
    database:process.env.SQL_DEFAULT_SCHEMA,
    multipleStatements:true,
    connectionLimit : 100,
    waitForConnections : false,
    queueLimit :0,
    // debug    :  true,
    wait_timeout : 28800,
    connect_timeout :10
}
 
function handleDisconnect() {
    mysqlConnection=mysql.createConnection(configConnection)

    mysqlConnection.connect(function (error) {
        if(error){
            console.log("Ups error conection to database:\n"+error)
            setTimeout(handleDisconnect,2000);
        }else{
            console.log('Database is connect!!!')
        }
    })

    mysqlConnection.on('error',function(error) {
        console.log('DB error',error)
        if(error.code==='PROTOCOL_CONNECTION_LOST'){
            handleDisconnect()
        }else{ 
            throw error
        }
    })
}

handleDisconnect()

module.exports=mysqlConnection