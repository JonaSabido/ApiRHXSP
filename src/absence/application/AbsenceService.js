const Absence = require("../domain/Absence");

class AbsenceService {
    constructor(
        iAbsenceRepository
    ) {
        this.iAbsenceRepository = iAbsenceRepository
    }

    async getAllAbsences() {
        return await this.iAbsenceRepository.getAll();
    }

    async getAbsenceById(id) {
        const entity = await this.iAbsenceRepository.getById(id);
        return new Absence(
            entity.id,
            entity.id_type_absence,
            entity.id_employee,
            entity.id_job,
            entity.date,
            entity.descriptiom,
            entity.path,
            entity.createdAt,
            entity.updatedAt,
            entity.type_absence,
            entity.employee,
            entity.job
        );
    }

    async createAbsence(data) {
        const newEntity = await this.iAbsenceRepository.create(data)
        return new Absence(
            newEntity.id,
            newEntity.id_type_absence,
            newEntity.id_employee,
            newEntity.id_job,
            newEntity.date,
            newEntity.descriptiom,
            newEntity.path,
            newEntity.createdAt,
            newEntity.updatedAt,
        );
    }

    async updateAbsence(id, data) {
        await this.iAbsenceRepository.getById(id);
        await this.iAbsenceRepository.update(id, data);
        return await this.iAbsenceRepository.getById(id);
    }

    async deleteAbsence(id) {
        await this.iAbsenceRepository.getById(id);
        return await this.iAbsenceRepository.delete(id)
    }

}

module.exports = AbsenceService