const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const AntidopingService = require('../application/AntidopingService');
const AntidopingResponseDTO = require('../domain/AntidopingResponseDTO');
const AntidopingRepository = require('./AntidopingRepository');

const antidopingRepository = new AntidopingRepository();
const antidopingService = new AntidopingService(antidopingRepository);

const getAll = async (request, response) => {
    const data = await antidopingService.getAllAntidopings(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new AntidopingResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await antidopingService.getAntidopingById(id)
        const DTO = new AntidopingResponseDTO(entity)
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
        const newEntity = await antidopingService.createAntidoping(data)
        if (files) {
            await antidopingService.saveFiles(newEntity.id, files)
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
        const updatedEntity = await antidopingService.updateAntidoping(id, data)
        if (files) {
            await antidopingService.saveFiles(id, files)
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
        const deletedEntity = await antidopingService.deleteAntidoping(id)
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