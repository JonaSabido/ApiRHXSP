const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const VacationTimeModel = connection.define('vacation_time', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    start_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    end_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    days: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    available_days: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
})
VacationTimeModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' })



module.exports = {
    VacationTimeModel
}