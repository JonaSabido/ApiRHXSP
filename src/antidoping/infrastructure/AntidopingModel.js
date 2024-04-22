const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')


const AntidopingModel = connection.define('antidoping', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
})

AntidopingModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })

module.exports = {
    AntidopingModel
}