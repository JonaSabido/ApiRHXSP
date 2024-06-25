const Antidoping = require("../domain/Antidoping");

class AntidopingService {
    constructor(
        iAntidopingRepository
    ) {
        this.iAntidopingRepository = iAntidopingRepository
    }

    async getAllAntidopings(filters) {
        return await this.iAntidopingRepository.getAll(filters);
    }

    async getAntidopingById(id) {
        const entity = await this.iAntidopingRepository.getById(id);
        return new Antidoping(entity.id, entity.id_employee, entity.result, entity.comments, entity.createdAt, entity.updatedAt, entity.employee);
    }

    async createAntidoping(data) {
        const newEntity = await this.iAntidopingRepository.create(data)
        return new Antidoping(newEntity.id, newEntity.id_employee, newEntity.result, newEntity.comments, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateAntidoping(id, data) {
        await this.iAntidopingRepository.getById(id);
        await this.iAntidopingRepository.update(id, data);
        return await this.iAntidopingRepository.getById(id);
    }

    async deleteAntidoping(id) {
        await this.iAntidopingRepository.getById(id);
        return await this.iAntidopingRepository.delete(id)
    }

    async saveFiles(id, files) {
        await this.iAntidopingRepository.getById(id);
        const newFiles = await this.iAntidopingRepository.saveFiles(id, files)
        return 'Success'
    }

}

module.exports = AntidopingService