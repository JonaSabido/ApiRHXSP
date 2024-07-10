const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const VacationTimeRepository = require('../../vacationtime/infrastructure/VacationTimeRepository');
const EmployeeVacationService = require('../application/EmployeeVacationService');
const EmployeeVacationResponseDTO = require('../domain/EmployeeVacationResponseDTO');
const EmployeeVacationRepository = require('./EmployeeVacationRepository');

const employeeVacationRepository = new EmployeeVacationRepository();
const vacationTimeRepository = new VacationTimeRepository();

const employeeVacationService = new EmployeeVacationService(employeeVacationRepository, vacationTimeRepository);

const getAll = async (request, response) => {
    const data = await employeeVacationService.getAllEmployeeVacations(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            console.log(element)
            const newDTO = new EmployeeVacationResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getDaysByVacationTimeId = async (request, response) => {
    try {
        const id = request.params.id
        const data = await employeeVacationService.getDaysByVacationTimeId(id)
        return SendSuccessData(response, 200, data, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await employeeVacationService.getEmployeeVacationById(id)
        return SendSuccessData(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await employeeVacationService.createEmployeeVacation(data)
        return SendSuccessData(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

const updateById = async (request, response) => {
    const data = request.body
    const id = request.params.id
    try {
        const updatedEntity = await employeeVacationService.updateEmployeeVacation(id, data)
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await employeeVacationService.deleteEmployeeVacation(id)
        return SendSuccessData(response, 200, deletedEntity, 'Deleted')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}


module.exports = {
    getAll,
    getDaysByVacationTimeId,
    getById,
    create,
    updateById,
    deleteById,
};