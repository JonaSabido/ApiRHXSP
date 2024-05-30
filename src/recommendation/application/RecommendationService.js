const Recommendation = require("../domain/Recommendation");

class RecommendationService {
    constructor(
        iRecommendationRepository,
        iRecommendationPaymentRepository,
    ) {
        this.iRecommendationRepository = iRecommendationRepository
        this.iRecommendationPaymentRepository = iRecommendationPaymentRepository
    }

    async getAllRecommendations(filters) {
        return await this.iRecommendationRepository.getAll(filters);
    }

    async getRecommendationById(id) {
        const entity = await this.iRecommendationRepository.getById(id);
        return new Recommendation(
            entity.id,
            entity.id_employee,
            entity.id_recommended_employee,
            entity.amount,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
            entity.recommended_employee,
        );
    }

    async createRecommendation(data) {
        const newEntity = await this.iRecommendationRepository.create(data)

        const first_date = new Date()
        first_date.setDate(first_date.getDate() + 7)
        const firstPayment = {
            id_recommendation: newEntity.id,
            id_paying_employee: newEntity.id_employee,
            payment_date: first_date,
            status: 1
        }

        const second_date = new Date()
        second_date.setMonth(second_date.getMonth() + 3);
        const secondPayment = {
            id_recommendation: newEntity.id,
            id_paying_employee: newEntity.id_employee,
            payment_date: second_date,
            status: 1
        }

        await this.iRecommendationPaymentRepository.create(firstPayment)
        await this.iRecommendationPaymentRepository.create(secondPayment)

        return new Recommendation(
            newEntity.id,
            newEntity.id_employee,
            newEntity.id_recommended_employee,
            newEntity.amount,
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