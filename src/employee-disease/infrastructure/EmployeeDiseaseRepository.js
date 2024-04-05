const IEmployeeDiseaseRepository = require('../domain/IEmployeeDiseaseRepository');
const { EmployeeDiseaseModel } = require('./EmployeeDiseaseModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { DiseaseModel } = require('../../disease/infrastructure/DiseaseModel');
const { EmployeeDiseaseQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
    {
        model: DiseaseModel,
        attributes: ['id', 'name',],
        as: 'disease'
    },
]

class EmployeeDiseaseRepository extends IEmployeeDiseaseRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await EmployeeDiseaseModel.findAll({
                include: relations,
                where: EmployeeDiseaseQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmployeeDiseaseModel.findByPk(id, { include: relations })
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
            return await EmployeeDiseaseModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async delete(id) {
        try {
            return await EmployeeDiseaseModel.destroy(
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

module.exports = EmployeeDiseaseRepository;