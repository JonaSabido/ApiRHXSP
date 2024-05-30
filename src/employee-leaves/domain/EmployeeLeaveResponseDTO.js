const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const TypeLeave = require("../../type-leave/domain/TypeLeave");


class EmployeeLeaveResponseDTO {
    constructor(
        employeeLeave
    ) {
        this.id = employeeLeave.id
        this.id_employee = employeeLeave.id_employee
        this.id_type_leave = employeeLeave.id_type_leave
        this.leave_date = employeeLeave.leave_date
        this.leave_date_formatted = dateFormatted(employeeLeave.leave_date);
        this.description = employeeLeave.description
        this.createdAt = employeeLeave.createdAt;
        this.updatedAt = employeeLeave.updatedAt;
        this.employee = new EmployeeResponseDTO(employeeLeave.employee);
        this.type_leave = new TypeLeave(employeeLeave.type_leave.id, employeeLeave.type_leave.name);
    }
}

module.exports = EmployeeLeaveResponseDTO