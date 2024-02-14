const TypeAbsence = require("../domain/TypeAbsence");

class TypeAbsenceService {
    constructor(
        iTypeAbsenceRepository
    ) {
        this.iTypeAbsenceRepository = iTypeAbsenceRepository
    }

    async getAllTypeAbsences() {
        return await this.iTypeAbsenceRepository.getAll();
    }

    async getTypeAbsenceById(id) {
        const entity = await this.iTypeAbsenceRepository.getById(id);
        return new TypeAbsence(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

}

module.exports = TypeAbsenceService