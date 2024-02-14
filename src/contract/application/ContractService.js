const Contract = require("../domain/Contract");

class ContractContractService {
    constructor(
        iContractRepository
    ) {
        this.iContractRepository = iContractRepository
    }

    async getAllContracts() {
        return await this.iContractRepository.getAll();
    }

    async getContractById(id) {
        const entity = await this.iContractRepository.getById(id);
        return new Contract(
            entity.id,
            entity.id_employee,
            entity.start_date,
            entity.end_date,
            entity.status,
            entity.createdAt,
            entity.updatedAt,
            entity.employee
        );
    }

    async createContract(data) {
        const newEntity = await this.iContractRepository.create(data)
        return new Contract(
            newEntity.id,
            newEntity.id_employee,
            newEntity.start_date,
            newEntity.end_date,
            newEntity.status,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateContract(id, data) {
        await this.iContractRepository.getById(id);
        await this.iContractRepository.update(id, data);
        return await this.iContractRepository.getById(id);
    }

    async deleteContract(id) {
        await this.iContractRepository.getById(id);
        return await this.iContractRepository.delete(id)
    }

}

module.exports = ContractContractService