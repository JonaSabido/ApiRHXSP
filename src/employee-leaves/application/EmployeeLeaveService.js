const EmployeeLeave = require("../domain/EmployeeLeave");

class EmployeeLeaveService {
    constructor(
        iEmployeeLeaveRepository
    ) {
        this.iEmployeeLeaveRepository = iEmployeeLeaveRepository
    }

    async getAllEmployeeLeaves(filters) {
        return await this.iEmployeeLeaveRepository.getAll(filters);
    }

    async getEmployeeLeaveById(id) {
        const entity = await this.iEmployeeLeaveRepository.getById(id);
        return new EmployeeLeave(
            entity.id,
            entity.id_employee,
            entity.leave_date,
            entity.description,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
        );
    }

    async createEmployeeLeave(data) {
        const newEntity = await this.iEmployeeLeaveRepository.create(data)
        return new EmployeeLeave(
            newEntity.id,
            newEntity.id_employee,
            newEntity.leave_date,
            newEntity.description,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateEmployeeLeave(id, data) {
        await this.iEmployeeLeaveRepository.getById(id);
        await this.iEmployeeLeaveRepository.update(id, data);
        return await this.iEmployeeLeaveRepository.getById(id);
    }

    async deleteEmployeeLeave(id) {
        await this.iEmployeeLeaveRepository.getById(id);
        return await this.iEmployeeLeaveRepository.delete(id)
    }

}

module.exports = EmployeeLeaveService