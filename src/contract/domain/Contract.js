class Contract {
    constructor(
        id,
        id_employee,
        type,
        start_date,
        end_date,
        status,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.type = type;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
    }
}

module.exports = Contract