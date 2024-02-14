const ITypeAbsenceRepository = require('../domain/ITypeAbsenceRepository');
const { TypeAbsenceModel } = require('./TypeAbsenceModel')

class TypeAbsenceRepository extends ITypeAbsenceRepository {
    constructor() {
        super()
    }

    async getAll() {
        try {
            return await TypeAbsenceModel.findAll();
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await TypeAbsenceModel.findByPk(id)
            if (!entity) {
                throw new Error('Entity not found')
            }
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }
}

module.exports = TypeAbsenceRepository;