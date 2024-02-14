class EmployeeDisease {
    constructor(
        id,
        id_employee,
        id_disease,
        createdAt,
        updatedAt,
        employee,
        disease
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.id_disease = id_disease
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.disease = disease;
    }
}

module.exports = EmployeeDisease