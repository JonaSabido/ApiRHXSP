const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const NotificationUserService = require('../application/NotificationUserService');
const NotificationUserResponseDTO = require('../domain/NotificationUserResponseDTO');
const NotificationUserRepository = require('./NotificationUserRepository');

const notificationUserRepository = new NotificationUserRepository();
const notificationUserService = new NotificationUserService(notificationUserRepository);

const getAll = async (request, response) => {
    const data = await notificationUserService.getAllNotificationUsers(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new NotificationUserResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const changeStatusById = async (request, response) => {
    const id = request.params.id
    try {
        const updatedEntity = await notificationUserService.changeStatus(id, request.body.status)
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


module.exports = {
    getAll,
    changeStatusById
};