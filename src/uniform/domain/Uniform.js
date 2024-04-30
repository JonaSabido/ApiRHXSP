class Uniform {
    constructor(
        id,
        id_employee,
        type,
        delivered_date,
        comments,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id;
        this.id_employee = id_employee;
        this.type = type;
        this.delivered_date = delivered_date;
        this.comments = comments;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.employee = employee;
    }
}


module.exports = Uniform