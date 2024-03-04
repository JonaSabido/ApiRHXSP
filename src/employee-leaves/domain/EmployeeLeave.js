class EmployeeLeave {
    constructor(
        id,
        id_employee,
        leave_date,
        description,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.leave_date = leave_date;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
    }
}


module.exports = EmployeeLeave