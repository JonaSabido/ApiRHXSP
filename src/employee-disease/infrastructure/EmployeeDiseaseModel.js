const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')
const { DiseaseModel } = require('../../disease/infrastructure/DiseaseModel')


const EmployeeDiseaseModel = connection.define('employee_disease', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_disease: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
})

EmployeeDiseaseModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })
EmployeeDiseaseModel.belongsTo(DiseaseModel, { as: 'disease', foreignKey: 'id_disease' })



module.exports = {
    EmployeeDiseaseModel
}