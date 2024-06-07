const { dateFormatted } = require("../../../helpers/DateService");

class NotificationResponseDTO {
    constructor(
        notification
    ) {
        this.id = notification.id
        this.id_notification_type = notification.id_notification_type
        this.title = notification.title
        this.description = notification.description
        this.date = notification.date
        this.date_formatted = dateFormatted(notification.date)
        this.createdAt = notification.createdAt;
        this.updatedAt = notification.updatedAt;
    }
}

module.exports = NotificationResponseDTO