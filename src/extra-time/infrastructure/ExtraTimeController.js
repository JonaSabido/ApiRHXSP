const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const ExtraTimeService = require('../application/ExtraTimeService');
const ExtraTimeResponseDTO = require('../domain/ExtraTimeResponseDTO');
const ExtraTimeRepository = require('./ExtraTimeRepository');

const extraTimeRepository = new ExtraTimeRepository();
const extraTimeService = new ExtraTimeService(extraTimeRepository);

const getAll = async (request, response) => {
    const data = await extraTimeService.getAllExtraTimes(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new ExtraTimeResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await extraTimeService.getExtraTimeById(id)
        const DTO = new ExtraTimeResponseDTO(entity)
        return SendSuccessData(response, 200, DTO, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    const files = request.files

    try {
        const newEntity = await extraTimeService.createExtraTime(data)
        if (files) {
            await extraTimeService.saveFiles(newEntity.id, files)
        }
        return SendSuccessData(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

const updateById = async (request, response) => {
    const data = request.body
    const files = request.files
    const id = request.params.id
    try {
        const updatedEntity = await extraTimeService.updateExtraTime(id, data)
        if (files) {
            await extraTimeService.saveFiles(id, files)
        }
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await extraTimeService.deleteExtraTime(id)
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
    updateById,
    deleteById
};