const EmployeeReentry = require("../domain/EmployeeReentry");

class EmployeeReentryService {
    constructor(
        iEmployeeReentryRepository,
        iEmployeeRepository
    ) {
        this.iEmployeeReentryRepository = iEmployeeReentryRepository
        this.iEmployeeRepository = iEmployeeRepository
    }

    async getAllEmployeeReentries(filters) {
        return await this.iEmployeeReentryRepository.getAll(filters);
    }

    async getEmployeeReentryById(id) {
        const entity = await this.iEmployeeReentryRepository.getById(id);
        return new EmployeeReentry(
            entity.id,
            entity.id_employee,
            entity.reentry_date,
            entity.description,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
        );
    }

    async createEmployeeReentry(data) {
        const newEntity = await this.iEmployeeReentryRepository.create(data)
        await this.iEmployeeRepository.changeStatus(newEntity.id_employee, 1)
        return new EmployeeReentry(
            newEntity.id,
            newEntity.id_employee,
            newEntity.reentry_date,
            newEntity.description,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateEmployeeReentry(id, data) {
        await this.iEmployeeReentryRepository.getById(id);
        await this.iEmployeeReentryRepository.update(id, data);
        return await this.iEmployeeReentryRepository.getById(id);
    }

    async deleteEmployeeReentry(id) {
        await this.iEmployeeReentryRepository.getById(id);
        return await this.iEmployeeReentryRepository.delete(id)
    }

}

module.exports = EmployeeReentryService