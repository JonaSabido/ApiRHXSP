const IVacationTimeRepository = require('../domain/IVacationTimeRepository');
const { VacationTimeModel } = require('./VacationTimeModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class VacationTimeRepository extends IVacationTimeRepository {
    constructor() {
        super()
    }

    async getAll() {
        try {
            return await VacationTimeModel.findAll({ include: relations });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await VacationTimeModel.findByPk(id, { include: relations })
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
            return await VacationTimeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await VacationTimeModel.update(data, {
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
            return await VacationTimeModel.destroy(
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

module.exports = VacationTimeRepository;