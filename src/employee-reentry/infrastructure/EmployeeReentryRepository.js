const IEmployeeReentryRepository = require('../domain/IEmployeeReentryRepository');
const { EmployeeReentryModel } = require('./EmployeeReentryModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { EmployeeReentryQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class EmployeeReentryRepository extends IEmployeeReentryRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await EmployeeReentryModel.findAll({
                include: relations,
                where: EmployeeReentryQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmployeeReentryModel.findByPk(id, { include: relations })
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
            return await EmployeeReentryModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await EmployeeReentryModel.update(data, {
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
            return await EmployeeReentryModel.destroy(
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

module.exports = EmployeeReentryRepository;