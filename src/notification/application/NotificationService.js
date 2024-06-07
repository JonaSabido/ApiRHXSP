const Notification = require("../domain/Notification");

class NotificationService {
    constructor(
        iNotificationRepository
    ) {
        this.iNotificationRepository = iNotificationRepository
    }

    async getAllNotifications(filters) {
        return await this.iNotificationRepository.getAll(filters);
    }

    async createNotification(data) {
        const newEntity = await this.iNotificationRepository.create(data)
        return new Notification(newEntity.id, newEntity.id_notification_type, newEntity.title, newEntity.description, newEntity.date, newEntity.createdAt, newEntity.updatedAt);
    }

}

module.exports = NotificationService