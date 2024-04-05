const Department = require("../domain/Department");

class DepartmentService {
    constructor(
        iDepartmentRepository
    ) {
        this.iDepartmentRepository = iDepartmentRepository
    }

    async getAllDepartments(filters) {
        return await this.iDepartmentRepository.getAll(filters);
    }

    async getDepartmentById(id) {
        const entity = await this.iDepartmentRepository.getById(id);
        return new Department(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createDepartment(data) {
        const newEntity = await this.iDepartmentRepository.create(data)
        return new Department(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateDepartment(id, data) {
        await this.iDepartmentRepository.getById(id);
        await this.iDepartmentRepository.update(id, data);
        return await this.iDepartmentRepository.getById(id);
    }

    async deleteDepartment(id) {
        await this.iDepartmentRepository.getById(id);
        return await this.iDepartmentRepository.delete(id)
    }

}

module.exports = DepartmentService