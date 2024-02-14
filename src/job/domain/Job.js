class Job {
    constructor(
        id,
        id_area,
        name,
        createdAt,
        updatedAt,
        area,
    ){
        this.id = id
        this.id_area = id_area
        this.name = name,
        this.createdAt = createdAt,
        this.updatedAt = updatedAt,
        this.area = area
    }
}

module.exports = Job