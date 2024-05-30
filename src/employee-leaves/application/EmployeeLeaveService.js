const EmployeeLeave = require("../domain/EmployeeLeave");

class EmployeeLeaveService {
    constructor(
        iEmployeeLeaveRepository,
        iEmployeeRepository
    ) {
        this.iEmployeeLeaveRepository = iEmployeeLeaveRepository
        this.iEmployeeRepository = iEmployeeRepository

    }

    async getAllEmployeeLeaves(filters) {
        return await this.iEmployeeLeaveRepository.getAll(filters);
    }

    async getEmployeeLeaveById(id) {
        const entity = await this.iEmployeeLeaveRepository.getById(id);
        return new EmployeeLeave(
            entity.id,
            entity.id_employee,
            entity.id_type_leave,
            entity.leave_date,
            entity.description,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
            entity.type_leave
        );
    }

    async createEmployeeLeave(data) {
        const newEntity = await this.iEmployeeLeaveRepository.create(data)
        await this.iEmployeeRepository.changeStatus(newEntity.id_employee, 0)
        return new EmployeeLeave(
            newEntity.id,
            newEntity.id_employee,
            newEntity.id_type_leave,
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