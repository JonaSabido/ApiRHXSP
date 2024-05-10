const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");

class UniformResponseDTO {
    constructor(
        uniform
    ) {
        this.id = uniform.id
        this.id_employee = uniform.id_employee
        this.type = uniform.type
        this.delivered_date = uniform.delivered_date
        this.delivered_date_formatted = dateFormatted(uniform.delivered_date)
        this.comments = uniform.comments
        this.createdAt = uniform.createdAt;
        this.updatedAt = uniform.updatedAt;
        this.employee = new EmployeeResponseDTO(uniform.employee);
    }
}

module.exports = UniformResponseDTO