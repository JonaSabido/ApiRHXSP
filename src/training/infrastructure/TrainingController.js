const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const TrainingService = require('../application/TrainingService');
const TrainingResponseDTO = require('../domain/TrainingResponseDTO');
const TrainingRepository = require('./TrainingRepository');

const trainingRepository = new TrainingRepository();
const trainingService = new TrainingService(trainingRepository);

const getAll = async (request, response) => {
    const data = await trainingService.getAllTrainings(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new TrainingResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await trainingService.getTrainingById(id)
        const DTO = new TrainingResponseDTO(entity)
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
        const newEntity = await trainingService.createTraining(data)
        if (files) {
            await trainingService.saveFiles(newEntity.id, files)
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
        const updatedEntity = await trainingService.updateTraining(id, data)
        if (files) {
            await trainingService.saveFiles(id, files)
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
        const deletedEntity = await trainingService.deleteTraining(id)
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