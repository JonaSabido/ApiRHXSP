const Emergencie = require("../domain/Emergencie");

class EmergencieService {
    constructor(
        iEmergencieRepository
    ) {
        this.iEmergencieRepository = iEmergencieRepository
    }

    async getAllEmergencies(filters) {
        return await this.iEmergencieRepository.getAll(filters);
    }

    async getEmergencieById(id) {
        const entity = await this.iEmergencieRepository.getById(id);
        return new Emergencie(entity.id, entity.id_employee, entity.reference_name, entity.type, entity.phone, entity.createdAt, entity.updatedAt, entity.employee);
    }

    async createEmergencie(data) {
        const newEntity = await this.iEmergencieRepository.create(data)
        return new Emergencie(newEntity.id, newEntity.id_employee, newEntity.reference_name, newEntity.type, newEntity.phone, newEntity.createdAt, newEntity.updatedAt);

    }

    async updateEmergencie(id, data) {
        await this.iEmergencieRepository.getById(id);
        await this.iEmergencieRepository.update(id, data);
        return await this.iEmergencieRepository.getById(id);
    }

    async deleteEmergencie(id) {
        await this.iEmergencieRepository.getById(id);
        return await this.iEmergencieRepository.delete(id)
    }

}

module.exports = EmergencieService