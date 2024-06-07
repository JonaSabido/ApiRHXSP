const IContractRepository = require('../domain/IContractRepository');
const { ContractModel } = require('./ContractModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { ContractQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class ContractRepository extends IContractRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await ContractModel.findAll({
                include: relations,
                where: ContractQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await ContractModel.findByPk(id, { include: relations })
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
            if (data.type == 2) {
                data.end_date = '0000-00-00'
            }
            return await ContractModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await ContractModel.update(data, {
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
            return await ContractModel.destroy(
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

    async saveFiles(id, files) {
        const path = 'uploads/contracts/'
        if (files.evidence) {
            let file = files.evidence
            file.mv(path + id + '/evidence.pdf')
        }
    }
}

module.exports = ContractRepository;