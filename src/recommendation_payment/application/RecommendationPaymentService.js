const RecommendationPayment = require("../domain/RecommendationPayment");

class RecommendationPaymentService {
    constructor(
        iRecommendationPaymentRepository
    ) {
        this.iRecommendationPaymentRepository = iRecommendationPaymentRepository
    }

    async getAllRecommendationPayments(filters) {
        return await this.iRecommendationPaymentRepository.getAll(filters);
    }

    async getRecommendationPaymentById(id) {
        const entity = await this.iRecommendationPaymentRepository.getById(id);
        return new RecommendationPayment(
            entity.id,
            entity.id_recommendation,
            entity.id_paying_employee,
            entity.payment_date,
            entity.status,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
            entity.recommendation,
        );
    }

    async createRecommendationPayment(data) {
        const newEntity = await this.iRecommendationPaymentRepository.create(data)
        return new RecommendationPayment(
            newEntity.id,
            newEntity.id_recommendation,
            newEntity.id_paying_employee,
            newEntity.payment_date,
            newEntity.status,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateRecommendationPayment(id, data) {
        await this.iRecommendationPaymentRepository.getById(id);
        await this.iRecommendationPaymentRepository.update(id, data);
        return await this.iRecommendationPaymentRepository.getById(id);
    }

    async deleteRecommendationPayment(id) {
        await this.iRecommendationPaymentRepository.getById(id);
        return await this.iRecommendationPaymentRepository.delete(id)
    }

}

module.exports = RecommendationPaymentService