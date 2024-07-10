const Training = require("../domain/Training");

class TrainingService {
    constructor(
        iTrainingRepository
    ) {
        this.iTrainingRepository = iTrainingRepository
    }

    async getAllTrainings(filters) {
        return await this.iTrainingRepository.getAll(filters);
    }

    async getTrainingById(id) {
        const entity = await this.iTrainingRepository.getById(id);
        return new Training(entity.id, entity.id_employee, entity.createdAt, entity.updatedAt, entity.employee);
    }

    async createTraining(data) {
        const newEntity = await this.iTrainingRepository.create(data)
        return new Training(newEntity.id, newEntity.id_employee, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateTraining(id, data) {
        await this.iTrainingRepository.getById(id);
        await this.iTrainingRepository.update(id, data);
        return await this.iTrainingRepository.getById(id);
    }

    async deleteTraining(id) {
        await this.iTrainingRepository.getById(id);
        const response = await this.iTrainingRepository.delete(id);
        if (response) {
            await this.iTrainingRepository.destroyFilesById(id)
        }
        return response
    }

    async saveFiles(id, files) {
        await this.iTrainingRepository.getById(id);
        const newFiles = await this.iTrainingRepository.saveFiles(id, files)
        return 'Success'
    }

}

module.exports = TrainingService