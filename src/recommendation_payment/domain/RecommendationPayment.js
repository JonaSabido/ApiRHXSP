class RecommendationPayment {
    constructor(
        id,
        id_recommendation,
        id_paying_employee,
        payment_date,
        status,
        createdAt,
        updatedAt,
        employee,
        recommendation
    ) {
        this.id = id;
        this.id_recommendation = id_recommendation;
        this.id_paying_employee = id_paying_employee;
        this.payment_date = payment_date;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.recommendation = recommendation;
    }
}


module.exports = RecommendationPayment