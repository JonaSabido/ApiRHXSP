const { SendSuccess, SendError } = require('../../../helpers/ApiResponse');
const AbsenceService = require('../application/AbsenceService');
const AbsenceRepository = require('./AbsenceRepository');

const absenceRepository = new AbsenceRepository();
const absenceService = new AbsenceService(absenceRepository);

const getAll = async (request, response) => {
    const data = await absenceService.getAllAbsences()
    if (data.length) {
        return SendSuccess(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await absenceService.getAbsenceById(id)
        return SendSuccess(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await absenceService.createAbsence(data)
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
        const updatedEntity = await absenceService.updateAbsence(id, data)
        return SendSuccess(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await absenceService.deleteAbsence(id)
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