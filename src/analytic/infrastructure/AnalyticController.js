const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const AnalyticService = require('../application/AnalyticService');
const AnalyticRepository = require('./AnalyticRepository');

const analyticRepository = new AnalyticRepository();
const analyticService = new AnalyticService(analyticRepository);

const getLeavesByMonth = async (request, response) => {
    const data = await analyticService.getLeavesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getEntriesByMonth = async (request, response) => {
    const data = await analyticService.getEntriesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getRecruitmentsByMonth = async (request, response) => {
    const data = await analyticService.getRecruitmentsByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getValidationsByMonth = async (request, response) => {
    const data = await analyticService.getValidationsByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getActiveTimesByMonth = async (request, response) => {
    const data = await analyticService.getActiveTimesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

module.exports = {
    getLeavesByMonth,
    getEntriesByMonth,
    getRecruitmentsByMonth,
    getValidationsByMonth,
    getActiveTimesByMonth
};