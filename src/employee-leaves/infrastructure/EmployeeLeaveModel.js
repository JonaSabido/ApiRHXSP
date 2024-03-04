const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const EmployeeLeaveModel = connection.define('employee_leave', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    leave_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false,
    },
})
EmployeeLeaveModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' })



module.exports = {
    EmployeeLeaveModel
}