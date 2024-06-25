class Antidoping {
    constructor(
        id,
        id_employee,
        result,
        comments,
        createdAt,
        updatedAt,
        employee,
    ) {
        this.id = id
        this.id_employee = id_employee
        this.result = result
        this.comments = comments
        this.createdAt = createdAt
        this.updatedAt = updatedAt
        this.employee = employee
    }
}

module.exports = Antidoping