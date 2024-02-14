const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const DiseaseModel = connection.define('disease', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    }
})

module.exports = {
    DiseaseModel
}