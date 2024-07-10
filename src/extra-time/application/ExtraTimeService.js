const ExtraTime = require("../domain/ExtraTime");

class ExtraTimeService {
    constructor(
        iExtraTimeRepository
    ) {
        this.iExtraTimeRepository = iExtraTimeRepository
    }

    async getAllExtraTimes(filters) {
        return await this.iExtraTimeRepository.getAll(filters);
    }

    async getExtraTimeById(id) {
        const entity = await this.iExtraTimeRepository.getById(id);
        return new ExtraTime(entity.id, entity.id_employee, entity.date, entity.createdAt, entity.updatedAt, entity.employee);
    }

    async createExtraTime(data) {
        const newEntity = await this.iExtraTimeRepository.create(data)
        return new ExtraTime(newEntity.id, newEntity.id_employee, newEntity.date, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateExtraTime(id, data) {
        await this.iExtraTimeRepository.getById(id);
        await this.iExtraTimeRepository.update(id, data);
        return await this.iExtraTimeRepository.getById(id);
    }

    async deleteExtraTime(id) {
        await this.iExtraTimeRepository.getById(id);
        const response = await this.iExtraTimeRepository.delete(id);
        if (response) {
            await this.iExtraTimeRepository.destroyFilesById(id)
        }
        return response
    }

    async saveFiles(id, files) {
        await this.iExtraTimeRepository.getById(id);
        const newFiles = await this.iExtraTimeRepository.saveFiles(id, files)
        return 'Success'
    }

}

module.exports = ExtraTimeService