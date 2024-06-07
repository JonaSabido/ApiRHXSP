const NotificationUser = require("../domain/NotificationUser");

class NotificationUserService {
    constructor(
        iNotificationUserRepository
    ) {
        this.iNotificationUserRepository = iNotificationUserRepository
    }

    async getAllNotificationUsers(filters) {
        return await this.iNotificationUserRepository.getAll(filters);
    }

    async createNotificationUser(data) {
        const newEntity = await this.iNotificationUserRepository.create(data)
        return new NotificationUser(newEntity.id, newEntity.id_notification, newEntity.id_user, newEntity.status, newEntity.createdAt, newEntity.updatedAt);
    }

    async changeStatus(id, status) {
        await this.iNotificationUserRepository.changeStatus(id, status);
    }

}

module.exports = NotificationUserService