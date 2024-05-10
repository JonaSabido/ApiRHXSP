const { getDifferenceDaysBetweenDates } = require("../../../helpers/DateService");
const EmployeeVacation = require("../domain/EmployeeVacation");

class EmployeeVacationService {
    constructor(
        iEmployeeVacationRepository,
        iVacationTimeRepository,
    ) {
        this.iEmployeeVacationRepository = iEmployeeVacationRepository
        this.iVacationTimeRepository = iVacationTimeRepository
    }

    async getAllEmployeeVacations(filters) {
        return await this.iEmployeeVacationRepository.getAll(filters);
    }

    async getEmployeeVacationById(id) {
        const entity = await this.iEmployeeVacationRepository.getById(id);
        return new EmployeeVacation(
            entity.id,
            entity.id_vacation_time,
            entity.start_date,
            entity.end_date,
            entity.available_days,
            entity.createdAt,
            entity.updatedAt,
            entity.vacationtime,
        );
    }

    async createEmployeeVacation(data) {
        const vacationTime = await this.iVacationTimeRepository.getById(data.id_vacation_time)
        const newAvailableDays = vacationTime.available_days - getDifferenceDaysBetweenDates(data.start_date, data.end_date)
        data.available_days = newAvailableDays
        const newEntity = await this.iEmployeeVacationRepository.create(data)
        await this.iVacationTimeRepository.update(vacationTime.id, { available_days: newAvailableDays })
        return new EmployeeVacation(
            newEntity.id,
            newEntity.id_vacation_time,
            newEntity.start_date,
            newEntity.end_date,
            newEntity.available_days,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateEmployeeVacation(id, data) {
        await this.iEmployeeVacationRepository.getById(id);
        await this.iEmployeeVacationRepository.update(id, data);
        return await this.iEmployeeVacationRepository.getById(id);
    }

    async deleteEmployeeVacation(id) {
        const entityToDelete = await this.iEmployeeVacationRepository.getById(id);
        const vacationTime = await this.iVacationTimeRepository.getById(entityToDelete.id_vacation_time)
        const newAvailableDays = vacationTime.available_days + getDifferenceDaysBetweenDates(entityToDelete.start_date.split('T')[0], entityToDelete.end_date.split('T')[0])
        await this.iVacationTimeRepository.update(vacationTime.id, { available_days: newAvailableDays })
        return await this.iEmployeeVacationRepository.delete(id)
    }

}

module.exports = EmployeeVacationService