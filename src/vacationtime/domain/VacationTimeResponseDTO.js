class VacationTimeResponseDTO {
    constructor(
        vacationTime
    ) {
        this.id = vacationTime.id
        this.id_employee = vacationTime.id_employee
        this.start_date = vacationTime.start_date
        this.end_date = vacationTime.end_date
        this.days = vacationTime.days
        this.available_days = vacationTime.available_days
        this.period = `${vacationTime.start_date.slice(0, 4)}-${vacationTime.end_date.slice(0, 4)}`
        this.take_days = Number(vacationTime.days - vacationTime.available_days)
        this.createdAt = vacationTime.createdAt;
        this.updatedAt = vacationTime.updatedAt;
    }
}

module.exports = VacationTimeResponseDTO