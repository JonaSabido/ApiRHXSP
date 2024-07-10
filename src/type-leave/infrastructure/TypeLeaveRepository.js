const { TypeLeaveQueryFilter } = require('../../../helpers/QueryFilters');
const ITypeLeaveRepository = require('../domain/ITypeLeaveRepository');
const { TypeLeaveModel } = require('./TypeLeaveModel')

class TypeLeaveRepository extends ITypeLeaveRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await TypeLeaveModel.findAll({
                where: TypeLeaveQueryFilter(filters),
                order: [['id', 'DESC']],
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await TypeLeaveModel.findByPk(id)
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
            return await TypeLeaveModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await TypeLeaveModel.update(data, {
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
            return await TypeLeaveModel.destroy(
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

module.exports = TypeLeaveRepository;