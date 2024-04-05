const TypeAbsence = require("../domain/TypeAbsence");

class TypeAbsenceService {
    constructor(
        iTypeAbsenceRepository
    ) {
        this.iTypeAbsenceRepository = iTypeAbsenceRepository
    }

    async getAllTypeAbsences(filters) {
        return await this.iTypeAbsenceRepository.getAll(filters);
    }

    async getTypeAbsenceById(id) {
        const entity = await this.iTypeAbsenceRepository.getById(id);
        return new TypeAbsence(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createTypeAbsence(data) {
        const newEntity = await this.iTypeAbsenceRepository.create(data)
        return new TypeAbsence(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateTypeAbsence(id, data) {
        await this.iTypeAbsenceRepository.getById(id);
        await this.iTypeAbsenceRepository.update(id, data);
        return await this.iTypeAbsenceRepository.getById(id);
    }

    async deleteTypeAbsence(id) {
        await this.iTypeAbsenceRepository.getById(id);
        return await this.iTypeAbsenceRepository.delete(id)
    }

}

module.exports = TypeAbsenceService