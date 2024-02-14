const { SendSucces, SendError } = require('../../../helpers/ApiResponse');
const EmergencieService = require('../application/EmergencieService');
const EmergencieRepository = require('./EmergencieRepository');

const emergencieRepository = new EmergencieRepository();
const emergencieService = new EmergencieService(emergencieRepository);

const getAll = async (request, response) => {
    const data = await emergencieService.getAllEmergencies()
    if (data.length) {
        return SendSucces(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await emergencieService.getEmergencieById(id)
        return SendSucces(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await emergencieService.createEmergencie(data)
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
        const updatedEntity = await emergencieService.updateEmergencie(id, data)
        return SendSucces(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await emergencieService.deleteEmergencie(id)
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