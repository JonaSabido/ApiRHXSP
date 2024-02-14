const { DataTypes } = require('sequelize')
const { connection } = require('../../../config.db')
const { JobModel } = require('../../job/infrastructure/JobModel')
const { DepartmentModel } = require('../../department/infrastructure/DepartmentModel')



const EmployeeModel = connection.define('employee', {
    id_department: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_job: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    code: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    sure_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    last_name: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    entry_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    gender: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    nss: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    rfc: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    curp: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ssp: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
    natal_date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    phone: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    shirt_size: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    pants_size: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    shoe_size: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    has_children: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
    address: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    cp: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    qr_image: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    status: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
})

EmployeeModel.belongsTo(JobModel, { as: 'job', foreignKey: 'id_job' })
EmployeeModel.belongsTo(DepartmentModel, { as: 'department', foreignKey: 'id_department' })


module.exports = {
    EmployeeModel
}