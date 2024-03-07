class Recommendation {
    constructor(
        id,
        id_employee,
        id_recommended_employee,
        amount,
        first_payment_date,
        second_payment_date,
        createdAt,
        updatedAt,
        employee,
        recommended_employee
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.id_recommended_employee = id_recommended_employee;
        this.amount = amount;
        this.first_payment_date = first_payment_date;
        this.second_payment_date = second_payment_date;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.recommended_employee = employee;
    }
}


module.exports = Recommendation