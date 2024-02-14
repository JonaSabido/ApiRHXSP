const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const TypeAbsenceModel = connection.define('type_absence', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    TypeAbsenceModel
}