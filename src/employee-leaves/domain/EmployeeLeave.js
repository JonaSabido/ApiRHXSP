class EmployeeLeave {
    constructor(
        id,
        id_employee,
        id_type_leave,
        leave_date,
        description,
        createdAt,
        updatedAt,
        employee,
        type_leave
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.id_type_leave = id_type_leave;
        this.leave_date = leave_date;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
        this.type_leave = type_leave;
    }
}


module.exports = EmployeeLeave