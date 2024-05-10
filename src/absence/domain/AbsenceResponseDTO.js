const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const Job = require("../../job/domain/Job");
const TypeAbsence = require("../../type-absence/domain/TypeAbsence");

class AbsenceResponseDTO {
    constructor(
        absence
    ) {
        this.id = absence.id
        this.id_type_absence = absence.id_type_absence
        this.id_employee = absence.id_employee
        this.id_job = absence.id_job
        this.date = absence.date
        this.date_formatted = dateFormatted(absence.date);
        this.description = absence.description
        this.createdAt = absence.createdAt;
        this.updatedAt = absence.updatedAt;
        this.type_absence = new TypeAbsence(absence.type_absence.id, absence.type_absence.name);
        this.employee = new EmployeeResponseDTO(absence.employee);
        this.job = new Job(absence.job.id, absence.job.id_area, absence.job.name);
    }
}

module.exports = AbsenceResponseDTO