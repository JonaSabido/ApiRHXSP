const Employee = require("../domain/Employee");

class EmployeeService {
    constructor(
        iEmployeeRepository
    ) {
        this.iEmployeeRepository = iEmployeeRepository
    }

    async getAllEmployees() {
        return await this.iEmployeeRepository.getAll();
    }

    async getEmployeeById(id) {
        const entity = await this.iEmployeeRepository.getById(id);
        return new Employee(
            entity.id,
            entity.id_department,
            entity.id_job,
            entity.id_recruitment_method,
            entity.code,
            entity.name,
            entity.sure_name,
            entity.last_name,
            entity.entry_date,
            entity.gender,
            entity.nss,
            entity.rfc,
            entity.curp,
            entity.ssp,
            entity.natal_date,
            entity.email,
            entity.phone,
            entity.shirt_size,
            entity.pants_size,
            entity.shoe_size,
            entity.has_children,
            entity.address,
            entity.cp,
            entity.comments,
            entity.status,
            entity.createdAt,
            entity.updatedAt,
            entity.department,
            entity.job,
            entity.recruitment_method
        );
    }

    async createEmployee(data) {
        const newEntity = await this.iEmployeeRepository.create(data)
        return new Employee(
            newEntity.id,
            newEntity.id_department,
            newEntity.id_job,
            newEntity.id_recruitment_method,
            newEntity.code,
            newEntity.name,
            newEntity.sure_name,
            newEntity.last_name,
            newEntity.entry_date,
            newEntity.gender,
            newEntity.nss,
            newEntity.rfc,
            newEntity.curp,
            newEntity.ssp,
            newEntity.natal_date,
            newEntity.email,
            newEntity.phone,
            newEntity.shirt_size,
            newEntity.pants_size,
            newEntity.shoe_size,
            newEntity.has_children,
            newEntity.address,
            newEntity.cp,
            newEntity.comments,
            newEntity.status,
            newEntity.createdAt,
            newEntity.updatedAt
        );
    }

    async updateEmployee(id, data) {
        await this.iEmployeeRepository.getById(id);
        await this.iEmployeeRepository.update(id, data);
        return await this.iEmployeeRepository.getById(id);
    }

    async deleteEmployee(id) {
        await this.iEmployeeRepository.getById(id);
        return await this.iEmployeeRepository.delete(id)
    }

    async saveFiles(id, files) {
        await this.iEmployeeRepository.getById(id);
        const newFiles = await this.iEmployeeRepository.saveFiles(id, files)
        return 'Success'
    }

}

module.exports = EmployeeService