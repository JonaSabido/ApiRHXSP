const { DiseaseQueryFilter } = require('../../../helpers/QueryFilters');
const IDiseaseRepository = require('../domain/IDiseaseRepository');
const { DiseaseModel } = require('./DiseaseModel')

class DiseaseRepository extends IDiseaseRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await DiseaseModel.findAll({
                where: DiseaseQueryFilter(filters),
                order: [['id', 'DESC']],
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await DiseaseModel.findByPk(id)
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
            return await DiseaseModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await DiseaseModel.update(data, {
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
            return await DiseaseModel.destroy(
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

module.exports = DiseaseRepository;