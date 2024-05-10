const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");

class EmployeeReentryResponseDTO {
    constructor(
        employeeReentry
    ) {
        this.id = employeeReentry.id
        this.id_employee = employeeReentry.id_employee
        this.reentry_date = employeeReentry.reentry_date
        this.reentry_date_formatted = dateFormatted(employeeReentry.reentry_date);
        this.description = employeeReentry.description
        this.createdAt = employeeReentry.createdAt;
        this.updatedAt = employeeReentry.updatedAt;
        this.employee = new EmployeeResponseDTO(employeeReentry.employee);

    }
}

module.exports = EmployeeReentryResponseDTO