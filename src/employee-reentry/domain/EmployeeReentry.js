class EmployeeReentry {
    constructor(
        id,
        id_employee,
        reentry_date,
        description,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.reentry_date = reentry_date;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
    }
}


module.exports = EmployeeReentry