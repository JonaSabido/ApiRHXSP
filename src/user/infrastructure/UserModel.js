const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')

const UserModel = connection.define('user', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
    }
})

module.exports = {
    UserModel
}