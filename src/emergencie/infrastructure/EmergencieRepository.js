const IEmergencieRepository = require('../domain/IEmergencieRepository');
const { EmergencieModel } = require('./EmergencieModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { EmergencyQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    }
]

class EmergencieRepository extends IEmergencieRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await EmergencieModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: EmergencyQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmergencieModel.findByPk(id, { include: relations })
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
            return await EmergencieModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await EmergencieModel.update(data, {
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
            return await EmergencieModel.destroy(
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

module.exports = EmergencieRepository;