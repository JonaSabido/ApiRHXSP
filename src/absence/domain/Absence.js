class Absence {
    constructor(
        id,
        id_type_absence,
        id_employee,
        id_job,
        date,
        description,
        path,
        createdAt,
        updatedAt,
        type_absence,
        employee,
        job
    ) {
        this.id = id;
        this.id_type_absence = id_type_absence;
        this.id_employee = id_employee;
        this.id_job = id_job;
        this.date = date;
        this.description = description;
        this.path = path;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.type_absence = type_absence;
        this.employee = employee;
        this.job = job;
    }
}


module.exports = Absence