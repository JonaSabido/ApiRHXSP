const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const EmployeeDiseaseService = require('../application/EmployeeDiseaseService');
const EmployeeDiseaseRepository = require('./EmployeeDiseaseRepository');

const employeeDiseaseRepository = new EmployeeDiseaseRepository();
const employeeDiseaseService = new EmployeeDiseaseService(employeeDiseaseRepository);

const getAll = async (request, response) => {
    const data = await employeeDiseaseService.getAllEmployeeDiseases()
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await employeeDiseaseService.getEmployeeDiseaseById(id)
        return SendSuccessData(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await employeeDiseaseService.createEmployeeDisease(data)
        return SendSuccessData(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await employeeDiseaseService.deleteEmployeeDisease(id)
        return SendSuccessData(response, 200, deletedEntity, 'Deleted')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}


module.exports = {
    getAll,
    getById,
    create,
    deleteById
};