const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')


const TrainingModel = connection.define('training', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
})

TrainingModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })

module.exports = {
    TrainingModel
}