const { dateFormatted } = require("../../../helpers/DateService")
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO")
const VacationTimeResponseDTO = require("../../vacationtime/domain/VacationTimeResponseDTO")

class EmployeeVacationResponseDTO {
    constructor(
        employeeVacation
    ) {
        this.id = employeeVacation.id
        this.id_vacation_time = employeeVacation.id_employee
        this.start_date = employeeVacation.start_date
        this.start_date_formatted = dateFormatted(employeeVacation.start_date)
        this.end_date = employeeVacation.end_date
        this.end_date_formatted = dateFormatted(employeeVacation.end_date)
        this.available_days = employeeVacation.available_days
        this.createdAt = employeeVacation.createdAt
        this.updatedAt = employeeVacation.updatedAt
        this.vacation_time = new VacationTimeResponseDTO(employeeVacation.vacation_time)
        this.employee = new EmployeeResponseDTO(employeeVacation.vacation_time.employee)
    }
}

module.exports = EmployeeVacationResponseDTO