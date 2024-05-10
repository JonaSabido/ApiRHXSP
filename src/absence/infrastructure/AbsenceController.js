const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const AbsenceService = require('../application/AbsenceService');
const AbsenceRepository = require('./AbsenceRepository');
const EmployeeRepository = require('../../employee/infrastructure/EmployeeRepository');
const AbsenceResponseDTO = require('../domain/AbsenceResponseDTO');

const absenceRepository = new AbsenceRepository();
const employeeRepository = new EmployeeRepository();

const absenceService = new AbsenceService(absenceRepository, employeeRepository);

const getAll = async (request, response) => {
    const data = await absenceService.getAllAbsences(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new AbsenceResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await absenceService.getAbsenceById(id)
        return SendSuccessData(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const getByGroup = async (request, response) => {
    const data = await absenceService.getByGroup(request.query)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await absenceService.createAbsence(data)
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
        const updatedEntity = await absenceService.updateAbsence(id, data)
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await absenceService.deleteAbsence(id)
        return SendSuccessData(response, 200, deletedEntity, 'Deleted')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}


module.exports = {
    getAll,
    getById,
    getByGroup,
    create,
    updateById,
    deleteById
};