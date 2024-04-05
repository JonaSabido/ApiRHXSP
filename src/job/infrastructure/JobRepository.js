const IJobRepository = require('../domain/IJobRepository');
const { JobModel } = require('./JobModel')
const { AreaModel } = require('../../area/infrastructure/AreaModel');
const { JobQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: AreaModel,
        attributes: ['id', 'name'],
        as: 'area'
    }
]

class JobRepository extends IJobRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await JobModel.findAll({
                where: JobQueryFilter(filters),
                include: relations
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await JobModel.findByPk(id, { include: relations })
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
            return await JobModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await JobModel.update(data, {
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
            return await JobModel.destroy(
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

module.exports = JobRepository;