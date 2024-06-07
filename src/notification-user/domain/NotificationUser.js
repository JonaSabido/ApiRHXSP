class NotificationUser {
    constructor(
        id,
        id_notification,
        id_user,
        status,
        createdAt,
        updatedAt,
        notification,
        user
    ) {
        this.id = id;
        this.id_notification = id_notification;
        this.id_user = id_user;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.notification = notification;
        this.user = user;
    }
}

module.exports = NotificationUser