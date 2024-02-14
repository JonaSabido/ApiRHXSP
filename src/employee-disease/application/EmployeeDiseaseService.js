const EmployeeDisease = require("../domain/EmployeeDisease");

class EmployeeDiseaseContractService {
    constructor(
        iEmployeeDiseaseRepository
    ) {
        this.iEmployeeDiseaseRepository = iEmployeeDiseaseRepository
    }

    async getAllEmployeeDiseases() {
        return await this.iEmployeeDiseaseRepository.getAll();
    }

    async getEmployeeDiseaseById(id) {
        const entity = await this.iEmployeeDiseaseRepository.getById(id);
        return new EmployeeDisease(
            entity.id,
            entity.id_employee,
            entity.id_disease,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
            entity.disease
        );
    }

    async createEmployeeDisease(data) {
        const newEntity = await this.iEmployeeDiseaseRepository.create(data)
        return new EmployeeDisease(
            newEntity.id,
            newEntity.id_employee,
            newEntity.id_disease,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async deleteEmployeeDisease(id) {
        await this.iEmployeeDiseaseRepository.getById(id);
        return await this.iEmployeeDiseaseRepository.delete(id)
    }

}

module.exports = EmployeeDiseaseContractService