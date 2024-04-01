const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel')
const { RecommendationModel } = require('../../recommendation/infrastructure/RecommendationModel')

const RecommendationPaymentModel = connection.define('recommendation_payment', {
    id_recommendation: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_paying_employee: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    payment_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    status: {
        type: DataTypes.NUMBER,
        allowNull: false
    }
})
RecommendationPaymentModel.belongsTo(RecommendationModel, { as: 'recommendation', foreignKey: 'id_recommendation' })  //relac
RecommendationPaymentModel.belongsTo(EmployeeModel, { as: 'employee', foreignKey: 'id_paying_employee' })



module.exports = {
    RecommendationPaymentModel
}