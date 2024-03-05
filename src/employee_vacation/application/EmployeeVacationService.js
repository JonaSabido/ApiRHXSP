const EmployeeVacation = require("../domain/EmployeeVacation");

class EmployeeVacationService {
    constructor(
        iEmployeeVacationRepository
    ) {
        this.iEmployeeVacationRepository = iEmployeeVacationRepository
    }

    async getAllEmployeeVacations() {
        return await this.iEmployeeVacationRepository.getAll();
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
        const newEntity = await this.iEmployeeVacationRepository.create(data)
        return new EmployeeVacation(
            newEntity.id,
            newEntity.id_vacation_time,
            entity.start_date,
            entity.end_year,
            entity.available_days,
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
        await this.iEmployeeVacationRepository.getById(id);
        return await this.iEmployeeVacationRepository.delete(id)
    }

}

module.exports = EmployeeVacationService