class Notification {
    constructor(
        id,
        id_notification_type,
        title,
        description,
        date,
        createdAt,
        updatedAt,
        notification_type,
    ) {
        this.id = id;
        this.id_notification_type = id_notification_type;
        this.title = title;
        this.description = description;
        this.date = date;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.notification_type = notification_type;
    }
}

module.exports = Notification