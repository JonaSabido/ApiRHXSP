const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const RecommendationRepository = require('./RecommendationRepository');
const RecommendationPaymentRepository = require('../../recommendation_payment/infrastructure/RecommendationPaymentRepository');
const RecommendationService = require('../application/RecommendationService');

const recommendationRepository = new RecommendationRepository();
const recommendationPaymentRepository = new RecommendationPaymentRepository();

const recommendationService = new RecommendationService(recommendationRepository, recommendationPaymentRepository);



const getAll = async (request, response) => {
    const data = await recommendationService.getAllRecommendations(request.query)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await recommendationService.getRecommendationById(id)
        return SendSuccessData(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    try {
        const newEntity = await recommendationService.createRecommendation(data)
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
        const updatedEntity = await recommendationService.updateRecommendation(id, data)
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await recommendationService.deleteRecommendation(id)
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