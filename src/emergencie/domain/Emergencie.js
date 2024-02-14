class Emergencie {
    constructor(
        id,
        id_employee,
        reference_name,
        type,
        phone,
        createdAt,
        updatedAt,
        employee,
    ){
        this.id = id
        this.id_employee = id_employee
        this.reference_name = reference_name,
        this.type = type,
        this.phone = phone,
        this.createdAt = createdAt,
        this.updatedAt = updatedAt,
        this.employee = employee
    }
}

module.exports = Emergencie