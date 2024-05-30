const Notification = require("../domain/Notification");

class NotificationService {
    constructor(
        iNotificationRepository
    ) {
        this.iNotificationRepository = iNotificationRepository
    }

    async createNotification(data) {
        const newEntity = await this.iNotificationRepository.create(data)
        return new Notification(newEntity.id, newEntity.id_notification_type, newEntity.title, newEntity.description, newEntity.date, newEntity.createdAt, newEntity.updatedAt);
    }

}

module.exports = NotificationService