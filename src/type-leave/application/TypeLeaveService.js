const TypeLeave = require("../domain/TypeLeave");

class TypeLeaveService {
    constructor(
        iTypeLeaveRepository
    ) {
        this.iTypeLeaveRepository = iTypeLeaveRepository
    }

    async getAllTypeLeaves(filters) {
        return await this.iTypeLeaveRepository.getAll(filters);
    }

    async getTypeLeaveById(id) {
        const entity = await this.iTypeLeaveRepository.getById(id);
        return new TypeLeave(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createTypeLeave(data) {
        const newEntity = await this.iTypeLeaveRepository.create(data)
        return new TypeLeave(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateTypeLeave(id, data) {
        await this.iTypeLeaveRepository.getById(id);
        await this.iTypeLeaveRepository.update(id, data);
        return await this.iTypeLeaveRepository.getById(id);
    }

    async deleteTypeLeave(id) {
        await this.iTypeLeaveRepository.getById(id);
        return await this.iTypeLeaveRepository.delete(id)
    }

}

module.exports = TypeLeaveService