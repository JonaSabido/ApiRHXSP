const Disease = require("../domain/Disease");

class DiseaseService {
    constructor(
        iDiseaseRepository
    ) {
        this.iDiseaseRepository = iDiseaseRepository
    }

    async getAllDiseases() {
        return await this.iDiseaseRepository.getAll();
    }

    async getDiseaseById(id) {
        const entity = await this.iDiseaseRepository.getById(id);
        return new Disease(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createDisease(data) {
        const newEntity = await this.iDiseaseRepository.create(data)
        return new Disease(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateDisease(id, data) {
        await this.iDiseaseRepository.getById(id);
        await this.iDiseaseRepository.update(id, data);
        return await this.iDiseaseRepository.getById(id);
    }

    async deleteDisease(id) {
        await this.iDiseaseRepository.getById(id);
        return await this.iDiseaseRepository.delete(id)
    }

}

module.exports = DiseaseService