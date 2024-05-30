const INotificationRepository = require('../domain/INotificationRepository');
const { NotificationModel } = require('./NotificationModel')


class NotificationRepository extends INotificationRepository {
    constructor() {
        super()
    }

    async create(data) {
        try {
            return await NotificationModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }


}

module.exports = NotificationRepository;