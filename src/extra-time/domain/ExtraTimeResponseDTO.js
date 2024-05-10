const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const ExtraTimeFileNameResponseDTO = require("./ExtraTimeFileNameResponseDTO");

class ExtraTimeResponseDTO {
    constructor(
        extraTime
    ) {
        this.id = extraTime.id
        this.id_employee = extraTime.id_employee
        this.date = extraTime.date
        this.date_formatted = dateFormatted(extraTime.date);
        this.files = new ExtraTimeFileNameResponseDTO(extraTime.id)
        this.createdAt = extraTime.createdAt;
        // this.createdAt_formatted = dateFormatted(extraTime.createdAt.toISOString().slice(0, 10));
        this.updatedAt = extraTime.updatedAt;
        this.employee = new EmployeeResponseDTO(extraTime.employee);
    }
}

module.exports = ExtraTimeResponseDTO