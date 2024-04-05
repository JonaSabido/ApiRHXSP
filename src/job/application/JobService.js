const Job = require("../domain/Job");

class JobService {
    constructor(
        iJobRepository
    ) {
        this.iJobRepository = iJobRepository
    }

    async getAllJobs(filters) {
        return await this.iJobRepository.getAll(filters);
    }

    async getJobById(id) {
        const entity = await this.iJobRepository.getById(id);
        return new Job(entity.id, entity.id_area, entity.name, entity.createdAt, entity.updatedAt, entity.area);
    }

    async createJob(data) {
        const newEntity = await this.iJobRepository.create(data)
        return new Job(newEntity.id, newEntity.id_area, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateJob(id, data) {
        await this.iJobRepository.getById(id);
        await this.iJobRepository.update(id, data);
        return await this.iJobRepository.getById(id);
    }

    async deleteJob(id) {
        await this.iJobRepository.getById(id);
        return await this.iJobRepository.delete(id)
    }

}

module.exports = JobService