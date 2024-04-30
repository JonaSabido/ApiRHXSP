const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const UniformModel = connection.define('uniform', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    type: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    delivered_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    comments: {
        type: DataTypes.STRING,
        allowNull: true,
    },
})
UniformModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' })



module.exports = {
    UniformModel
}