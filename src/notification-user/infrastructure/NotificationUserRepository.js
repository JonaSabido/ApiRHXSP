const { NotificationUserQueryFilter } = require('../../../helpers/QueryFilters');
const { NotificationModel } = require('../../notification/infrastructure/NotificationModel');
const INotificationUserRepository = require('../domain/INotificationUserRepository');
const { NotificationUserModel } = require('./NotificationUserModel')

const relations = [
    {
        model: NotificationModel,
        attributes: ['id', 'id_notification_type', 'title', 'description', 'date'],
        as: 'notification'
    },
]

class NotificationUserRepository extends INotificationUserRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await NotificationUserModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: NotificationUserQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async create(data) {
        try {
            return await NotificationUserModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async changeStatus(id, status) {
        try {
            return await NotificationUserModel.update({
                status: status
            }, {
                where: {
                    id: id
                }
            })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }


}

module.exports = NotificationUserRepository;