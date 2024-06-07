const NotificationResponseDTO = require("../../notification/domain/NotificationResponseDTO");

class NotificationUserResponseDTO {
    constructor(
        notificationUser
    ) {
        this.id = notificationUser.id
        this.id_notification = notificationUser.id_notification
        this.id_user = notificationUser.id_user
        this.status = notificationUser.status
        this.createdAt = notificationUser.createdAt;
        this.updatedAt = notificationUser.updatedAt;
        this.notification = new NotificationResponseDTO(notificationUser.notification);
    }
}

module.exports = NotificationUserResponseDTO