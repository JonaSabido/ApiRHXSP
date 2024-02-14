const { SendSucces, SendError } = require('../../../helpers/ApiResponse');
const AreaService = require('../application/AreaService');
const AreaRepository = require('./AreaRepository');

const areaRepository = new AreaRepository();
const areaService = new AreaService(areaRepository);

const getAll = async (request, response) => {
    const data = await areaService.getAllAreas()
    if (data.length) {
        return SendSucces(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await areaService.getAreaById(id)
        return SendSucces(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await areaService.createArea(data)
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
        const updatedEntity = await areaService.updateArea(id, data)
        return SendSucces(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await areaService.deleteArea(id)
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