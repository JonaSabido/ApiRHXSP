const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const EmployeeReentryModel = connection.define('employee_reentry', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    reentry_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false,
    },
})
EmployeeReentryModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' })



module.exports = {
    EmployeeReentryModel
}