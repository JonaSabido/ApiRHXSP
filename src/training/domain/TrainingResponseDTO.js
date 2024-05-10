const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const TrainingFileNameResponseDTO = require("./TrainingFileNameResponseDTO");

class TrainingResponseDTO {
    constructor(
        training
    ) {
        this.id = training.id
        this.id_employee = training.id_employee
        this.files = new TrainingFileNameResponseDTO(training.id)
        this.createdAt = training.createdAt;
        this.createdAt_formatted = dateFormatted(training.createdAt.toISOString().slice(0,10));
        this.updatedAt = training.updatedAt;
        this.employee = new EmployeeResponseDTO(training.employee);

    }
}

module.exports = TrainingResponseDTO