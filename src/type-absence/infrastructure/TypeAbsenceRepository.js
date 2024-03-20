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


    async create(data) {
        try {
            return await TypeAbsenceModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await TypeAbsenceModel.update(data, {
                where: {
                    id: id
                }
            })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async delete(id) {
        try {
            return await TypeAbsenceModel.destroy(
                {
                    where: {
                        id: id
                    }
                })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }
}

module.exports = TypeAbsenceRepository;