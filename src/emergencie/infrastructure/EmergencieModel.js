const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const EmergencieModel = connection.define('emergencies', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    reference_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    type: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    phone: {
        type: DataTypes.STRING,
        allowNull: false,
    },
})

EmergencieModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_employee' })


module.exports = {
    EmergencieModel
}