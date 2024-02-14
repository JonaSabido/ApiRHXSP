const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const DepartmentModel = connection.define('department', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    DepartmentModel
}