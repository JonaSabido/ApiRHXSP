const { dateFormatted, getDateFormat } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const AntidopingFileNameResponseDTO = require("./AntidopingFileNameResponseDTO");

class AntidopingResponseDTO {
    constructor(
        antidoping
    ) {
        this.id = antidoping.id
        this.id_employee = antidoping.id_employee
        this.result = antidoping.result
        this.comments = antidoping.comments
        this.files = new AntidopingFileNameResponseDTO(antidoping.id)
        this.createdAt = antidoping.createdAt;
        this.createdAt_formatted = dateFormatted(getDateFormat(antidoping.createdAt));
        this.updatedAt = antidoping.updatedAt;
        this.employee = new EmployeeResponseDTO(antidoping.employee);
    }
}

module.exports = AntidopingResponseDTO