class Recommendation {
    constructor(
        id,
        id_employee,
        id_recommended_employee,
        amount,
        createdAt,
        updatedAt,
        employee,
        recommended_employee
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.id_recommended_employee = id_recommended_employee;
        this.amount = amount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.recommended_employee = recommended_employee;
    }
}

module.exports = Recommendation