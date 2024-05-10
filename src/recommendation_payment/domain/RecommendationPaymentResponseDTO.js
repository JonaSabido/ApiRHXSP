const { dateFormatted } = require("../../../helpers/DateService")
const EmployeeResponseDTO = require("../../employee/domain/EmployeeResponseDTO")
const Recommendation = require("../../recommendation/domain/Recommendation")

class RecommendationPaymentResponseDTO {
    constructor(
        recommendationPayment
    ) {
        this.id = recommendationPayment.id
        this.id_recommendation = recommendationPayment.id_recommendation
        this.id_paying_employee = recommendationPayment.id_paying_employee
        this.payment_date = recommendationPayment.payment_date
        this.payment_date_formatted = dateFormatted(recommendationPayment.payment_date)
        this.status = recommendationPayment.status
        this.createdAt = recommendationPayment.createdAt
        this.updatedAt = recommendationPayment.updatedAt
        this.employee = new EmployeeResponseDTO(recommendationPayment.employee)
        this.recommendation = new Recommendation(
            recommendationPayment.recommendation.id,
            recommendationPayment.recommendation.id_employee,
            recommendationPayment.recommendation.id_recommended_employee,
            recommendationPayment.recommendation.amount
        )
    }
}

module.exports = RecommendationPaymentResponseDTO