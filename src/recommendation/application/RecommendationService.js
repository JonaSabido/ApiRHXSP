const Recommendation = require("../domain/RecommendationTime");

class RecommendationService {
    constructor(
        iRecommendationRepository
    ) {
        this.iRecommendationRepository = iRecommendationRepository
    }

    async getAllRecommendations() {
        return await this.iRecommendationRepository.getAll();
    }

    async getRecommendationById(id) {
        const entity = await this.iRecommendationRepository.getById(id);
        return new Recommendation(
            entity.id,
            entity.id_employee,
            entity.id_recommended_employee,
            entity.amount,
            entity.first_payment_date,
            entity.second_payment_date,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
            entity.recommended_employee,
        );
    }

    async createRecommendation(data) {
        const newEntity = await this.iRecommendationRepository.create(data)
        return new Recommendation(
            newEntity.id,
            newEntity.id_employee,
            newEntity.id_recommended_employee,
            entity.amount,
            entity.first_payment_date,
            entity.second_payment_date,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateRecommendation(id, data) {
        await this.iRecommendationRepository.getById(id);
        await this.iRecommendationRepository.update(id, data);
        return await this.iRecommendationRepository.getById(id);
    }

    async deleteRecommendation(id) {
        await this.iRecommendationRepository.getById(id);
        return await this.iRecommendationRepository.delete(id)
    }

}

module.exports = RecommendationService