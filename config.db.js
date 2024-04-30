const Sequelize = require('sequelize')
const { DB_NAME, DB_USER, DB_PASSWORD, DB_HOST } = require('./config')

const connection = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
    host: DB_HOST,
    dialect: 'mysql'
})

connection.authenticate()
    .then(() => {
        console.log('🐌 Conexión establecida a la base de datos')
    })
    .catch(error => {
        console.log(error)
        console.log('❌ No se pudo establecer conexión con la base de datos')
    })

module.exports = { connection };