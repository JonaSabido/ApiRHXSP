const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')
const { JobModel } = require('../../job/infrastructure/JobModel')
const { TypeAbsenceModel } = require('../../type-absence/infrastructure/TypeAbsenceModel')

const AbsenceModel = connection.define('absence', {
    id_type_absence: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_job: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false,
    },
})
AbsenceModel.belongsTo(TypeAbsenceModel , { as: 'type_absence', foreignKey: 'id_type_absence' })
AbsenceModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' })
AbsenceModel.belongsTo(JobModel , { as: 'job', foreignKey: 'id_job' })



module.exports = {
    AbsenceModel
}