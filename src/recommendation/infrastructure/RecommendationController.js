const { SendSuccess, SendError } = require('../../../helpers/ApiResponse');
const RecommendationService = require('../application/RecommendationService');
const RecommendationRepository = require('./RecommendationRepository');

const recommendationRepository = new RecommendationRepository();
const recommendationService = new RecommendationService(recommendationRepository);

const getAll = async (request, response) => {
    const data = await recommendationService.getAllRecommendations()
    if (data.length) {
        return SendSuccess(response, 200, data, 'Ok')
    }
    return SendError(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await recommendationService.getRecommendationById(id)
        return SendSuccess(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendError(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await recommendationService.createRecommendation(data)
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
        const updatedEntity = await recommendationService.updateRecommendation(id, data)
        return SendSuccess(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendError(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await recommendationService.deleteRecommendation(id)
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