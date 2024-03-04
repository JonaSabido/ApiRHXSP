const { SendSuccess, SendError } = require('../../../helpers/ApiResponse');
const EmployeeLeaveService = require('../application/EmployeeLeaveService');
const EmployeeLeaveRepository = require('./EmployeeLeaveRepository');

const employeeLeaveRepository = new EmployeeLeaveRepository();
const employeeLeaveService = new EmployeeLeaveService(employeeLeaveRepository);

const getAll = async (request, response) => {
    const data = await employeeLeaveService.getAllEmployeeLeaves()
    if (data.length) {
        return SendSuccess(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await employeeLeaveService.getEmployeeLeaveById(id)
        return SendSuccess(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await employeeLeaveService.createEmployeeLeave(data)
        return SendSuccess(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)
    }
}

const updateById = async (request, response) => {
    const data = request.body
    const id = request.params.id
    try {
        const updatedEntity = await employeeLeaveService.updateEmployeeLeave(id, data)
        return SendSuccess(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await employeeLeaveService.deleteEmployeeLeave(id)
        return SendSuccess(response, 200, deletedEntity, 'Deleted')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)
    }
}


module.exports = {
    getAll,
    getById,
    create,
    updateById,
    deleteById
};