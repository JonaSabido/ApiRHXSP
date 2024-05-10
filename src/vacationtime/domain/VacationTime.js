class VacationTime {
    constructor(
        id,
        id_employee,
        start_date,
        end_date,
        days,
        available_days,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.start_date = start_date;
        this.end_date = end_date;
        this.days = days;
        this.available_days = available_days;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
    }
}


module.exports = VacationTime