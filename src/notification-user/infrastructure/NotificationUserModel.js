const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { NotificationModel } = require('../../notification/infrastructure/NotificationModel');
const { UserModel } = require('../../user/infrastructure/UserModel');

const NotificationUserModel = connection.define('notification_user', {
    id_notification: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_user: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    status: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    }
})
NotificationUserModel.belongsTo(NotificationModel, { as: 'notification', foreignKey: 'id_notification' });
NotificationUserModel.belongsTo(UserModel, { as: 'user', foreignKey: 'id_user' });


module.exports = {
    NotificationUserModel
}