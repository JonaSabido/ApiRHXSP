const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const RecruitmentMethodModel = connection.define('recruitment_method', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    RecruitmentMethodModel
}