const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const AntidopingFileNameResponseDTO = require("./AntidopingFileNameResponseDTO");

class AntidopingResponseDTO {
    constructor(
        antidoping
    ) {
        this.id = antidoping.id
        this.id_employee = antidoping.id_employee
        this.files = new AntidopingFileNameResponseDTO(antidoping.id)
        this.createdAt = antidoping.createdAt;
        this.createdAt_formatted = dateFormatted(antidoping.createdAt.toISOString().slice(0,10));
        this.updatedAt = antidoping.updatedAt;
        this.employee = new EmployeeResponseDTO(antidoping.employee);
    }
}

module.exports = AntidopingResponseDTO