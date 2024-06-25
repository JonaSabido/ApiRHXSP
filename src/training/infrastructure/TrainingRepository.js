const { TrainingQueryFilter } = require('../../../helpers/QueryFilters');
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const ITrainingRepository = require('../domain/ITrainingRepository');
const { TrainingModel } = require('./TrainingModel')

const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class TrainingRepository extends ITrainingRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await TrainingModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: TrainingQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await TrainingModel.findByPk(id, { include: relations, })
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
            return await TrainingModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await TrainingModel.update(data, {
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
            return await TrainingModel.destroy(
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
        const path = 'uploads/trainings/'
        if (files.evidence) {
            let file = files.evidence
            file.mv(path + id + '/evidence.pdf')
        }
    }
}

module.exports = TrainingRepository;