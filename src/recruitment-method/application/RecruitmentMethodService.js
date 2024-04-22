const RecruitmentMethod = require("../domain/RecruitmentMethod");

class RecruitmentMethodService {
    constructor(
        iRecruitmentMethodRepository
    ) {
        this.iRecruitmentMethodRepository = iRecruitmentMethodRepository
    }

    async getAllRecruitmentMethods(filters) {
        return await this.iRecruitmentMethodRepository.getAll(filters);
    }

    async getRecruitmentMethodById(id) {
        const entity = await this.iRecruitmentMethodRepository.getById(id);
        return new RecruitmentMethod(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createRecruitmentMethod(data) {
        const newEntity = await this.iRecruitmentMethodRepository.create(data)
        return new RecruitmentMethod(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateRecruitmentMethod(id, data) {
        await this.iRecruitmentMethodRepository.getById(id);
        await this.iRecruitmentMethodRepository.update(id, data);
        return await this.iRecruitmentMethodRepository.getById(id);
    }

    async deleteRecruitmentMethod(id) {
        await this.iRecruitmentMethodRepository.getById(id);
        return await this.iRecruitmentMethodRepository.delete(id)
    }

}

module.exports = RecruitmentMethodService