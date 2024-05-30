const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { NotificationTypeModel } = require('../../notification_type/infrastructure/NotificationTypeModel');

const NotificationModel = connection.define('notification', {
    id_notification_type: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    title: {
        type: DataTypes.STRING,
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false
    },
    date: {
        type: DataTypes.DATE,
        allowNull: false
    },
})
NotificationModel.belongsTo(NotificationTypeModel, { as: 'notification_type', foreignKey: 'id_notification_type' });

module.exports = {
    NotificationModel
}