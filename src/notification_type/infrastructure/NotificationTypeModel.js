const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const NotificationTypeModel = connection.define('notification_types', {
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
})

module.exports = {
    NotificationTypeModel
}