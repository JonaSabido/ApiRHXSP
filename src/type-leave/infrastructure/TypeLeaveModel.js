const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const TypeLeaveModel = connection.define('type_leave', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    TypeLeaveModel
}