const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");

class EmployeeLeaveResponseDTO {
    constructor(
        employeeLeave
    ) {
        this.id = employeeLeave.id
        this.id_employee = employeeLeave.id_employee
        this.leave_date = employeeLeave.leave_date
        this.leave_date_formatted = dateFormatted(employeeLeave.leave_date);
        this.description = employeeLeave.description
        this.createdAt = employeeLeave.createdAt;
        this.updatedAt = employeeLeave.updatedAt;
        this.employee = new EmployeeResponseDTO(employeeLeave.employee);

    }
}

module.exports = EmployeeLeaveResponseDTO