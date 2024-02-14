const IEmployeeRepository = require('../domain/IEmployeeRepository');
const { EmployeeModel } = require('./EmployeeModel')
const { DepartmentModel } = require('../../department/infrastructure/DepartmentModel');
const { JobModel } = require('../../job/infrastructure/JobModel');

const relations = [
    {
        model: DepartmentModel,
        attributes: ['id', 'name'],
        as: 'department'
    },
    {
        model: JobModel,
        attributes: ['id', 'id_area', 'name'],
        as: 'job'
    },
]

class EmployeeRepository extends IEmployeeRepository {
    constructor() {
        super()
    }

    async getAll() {
        try {
            return await EmployeeModel.findAll({ include: relations });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmployeeModel.findByPk(id, { include: relations })
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
            return await EmployeeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await EmployeeModel.update(data, {
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
            return await EmployeeModel.destroy(
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

module.exports = EmployeeRepository;