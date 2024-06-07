const { NotificationQueryFilter } = require('../../../helpers/QueryFilters');
const INotificationRepository = require('../domain/INotificationRepository');
const { NotificationModel } = require('./NotificationModel')

class NotificationRepository extends INotificationRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await NotificationModel.findAll({
                where: NotificationQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
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