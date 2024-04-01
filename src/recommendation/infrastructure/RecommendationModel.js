const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')

const RecommendationModel = connection.define('recommendation', {
    id_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_recommended_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    amount: {
        type: DataTypes.DECIMAL(10,2),
        allowNull: false
    },
})
RecommendationModel.belongsTo(EmployeeModel , { as: 'employee', foreignKey: 'id_employee' });

RecommendationModel.belongsTo(EmployeeModel, {  as: 'recommended_employee', foreignKey: 'id_recommended_employee' });

module.exports = {
    RecommendationModel
}