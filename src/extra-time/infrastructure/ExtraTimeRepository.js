const { ExtraTimeQueryFilter } = require('../../../helpers/QueryFilters');
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const IExtraTimeRepository = require('../domain/IExtraTimeRepository');
const { ExtraTimeModel } = require('./ExtraTimeModel')

const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class ExtraTimeRepository extends IExtraTimeRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await ExtraTimeModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: ExtraTimeQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await ExtraTimeModel.findByPk(id, { include: relations, })
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
            return await ExtraTimeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await ExtraTimeModel.update(data, {
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
            return await ExtraTimeModel.destroy(
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
        const path = 'uploads/extra-times/'
        if (files.evidence) {
            let file = files.evidence
            file.mv(path + id + '/evidence.pdf')
        }
    }
}

module.exports = ExtraTimeRepository;