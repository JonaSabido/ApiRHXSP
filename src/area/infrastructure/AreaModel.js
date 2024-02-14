const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const AreaModel = connection.define('area', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    AreaModel
}