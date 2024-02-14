const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { AreaModel } = require('../../area/infrastructure/AreaModel')

const JobModel = connection.define('job', {
    id_area: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    }
})

JobModel.belongsTo(AreaModel, { as: 'area', foreignKey: 'id_area' })


module.exports = {
    JobModel
}