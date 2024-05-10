const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { VacationTimeModel } = require('../../vacationtime/infrastructure/VacationTimeModel')

const EmployeeVacationModel = connection.define('employee_vacation', {
    id_vacation_time: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    start_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    end_date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    available_days: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
})
EmployeeVacationModel.belongsTo(VacationTimeModel , { as: 'vacation_time', foreignKey: 'id_vacation_time' })



module.exports = {
    EmployeeVacationModel
}