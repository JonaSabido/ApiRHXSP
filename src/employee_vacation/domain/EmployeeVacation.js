class VacationTime {
    constructor(
        id,
        id_vacation_time,
        start_date,
        end_date,
        available_days,
        createdAt,
        updatedAt,
        vacationtime,
    ) {
        this.id = id;
        this.id_vacation_time = id_vacation_time;
        this.start_date = start_date;
        this.end_date = end_date;
        this.available_days = available_days;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.vacationtime = vacationtime;
    }
}


module.exports = VacationTime