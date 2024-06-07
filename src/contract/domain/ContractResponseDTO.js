const { dateFormatted } = require("../../../helpers/DateService");
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO");
const ContractFileNameResponseDTO = require("./ContractFileNameResponseDTO");

class ContractResponseDTO {
    constructor(
        contract
    ) {
        this.id = contract.id
        this.id_employee = contract.id_employee
        this.type = contract.type
        this.start_date = contract.start_date
        this.start_date_formatted = dateFormatted(contract.start_date)
        this.end_date = contract.end_date
        this.end_date_formatted = this.end_date != '0000-00-00' ? dateFormatted(contract.end_date) : 'Sin finalización'
        this.status = contract.status
        this.files = new ContractFileNameResponseDTO(contract.id)
        this.createdAt = contract.createdAt;
        this.updatedAt = contract.updatedAt;
        this.employee = new EmployeeResponseDTO(contract.employee);
    }
}

module.exports = ContractResponseDTO