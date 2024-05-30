const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')
const { TypeLeaveModel } = require('../../type-leave/infrastructure/TypeLeaveModel')

const EmployeeLeaveModel = connection.define('employee_leave', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_type_leave: {
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
EmployeeLeaveModel.belongsTo(TypeLeaveModel , { as: 'type_leave', foreignKey: 'id_type_leave' })




module.exports = {
    EmployeeLeaveModel
}