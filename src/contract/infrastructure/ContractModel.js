const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')


const ContractModel = connection.define('contract', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    type: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    start_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    end_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    status: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
})

ContractModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })

module.exports = {
    ContractModel
}