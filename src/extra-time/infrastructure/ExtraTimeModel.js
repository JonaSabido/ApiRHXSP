const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')


const ExtraTimeModel = connection.define('extra_time', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    date: {
        type: DataTypes.DATE,
        allowNull: false
    },
})

ExtraTimeModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })

module.exports = {
    ExtraTimeModel
}