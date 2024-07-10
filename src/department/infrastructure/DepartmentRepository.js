const { DepartmentQueryFilter } = require('../../../helpers/QueryFilters');
const IDepartmentRepository = require('../domain/IDepartmentRepository');
const { DepartmentModel } = require('./DepartmentModel')

class DepartmentRepository extends IDepartmentRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await DepartmentModel.findAll({
                order: [['id', 'DESC']],
                where: DepartmentQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await DepartmentModel.findByPk(id)
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
            return await DepartmentModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await DepartmentModel.update(data, {
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
            return await DepartmentModel.destroy(
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

module.exports = DepartmentRepository;