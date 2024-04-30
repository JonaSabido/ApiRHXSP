const Uniform = require("../domain/Uniform");

class UniformService {
    constructor(
        iUniformRepository,
        iEmployeeRepository
    ) {
        this.iUniformRepository = iUniformRepository
        this.iEmployeeRepository = iEmployeeRepository
    }

    async getAllEmployeeReentries(filters) {
        return await this.iUniformRepository.getAll(filters);
    }

    async getUniformById(id) {
        const entity = await this.iUniformRepository.getById(id);
        return new Uniform(
            entity.id,
            entity.id_employee,
            entity.type,
            entity.delivered_date,
            entity.comments,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
        );
    }

    async createUniform(data) {
        const newEntity = await this.iUniformRepository.create(data)
        return new Uniform(
            newEntity.id,
            newEntity.id_employee,
            newEntity.type,
            newEntity.delivered_date,
            newEntity.comments,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateUniform(id, data) {
        await this.iUniformRepository.getById(id);
        await this.iUniformRepository.update(id, data);
        return await this.iUniformRepository.getById(id);
    }

    async deleteUniform(id) {
        await this.iUniformRepository.getById(id);
        return await this.iUniformRepository.delete(id)
    }

}

module.exports = UniformService