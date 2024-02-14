const { SendSucces, SendError } = require('../../../helpers/ApiResponse');
const EmployeeService = require('../application/EmployeeService');
const EmployeeRepository = require('./EmployeeRepository');

const employeeRepository = new EmployeeRepository();
const employeeService = new EmployeeService(employeeRepository);

const getAll = async (request, response) => {
    const data = await employeeService.getAllEmployees()
    if (data.length) {
        return SendSucces(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await employeeService.getEmployeeById(id)
        return SendSucces(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await employeeService.createEmployee(data)
        return SendSucces(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)
    }
}

const updateById = async (request, response) => {
    const data = request.body
    const id = request.params.id
    try {
        const updatedEntity = await employeeService.updateEmployee(id, data)
        return SendSucces(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await employeeService.deleteEmployee(id)
        return SendSucces(response, 200, deletedEntity, 'Deleted')
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