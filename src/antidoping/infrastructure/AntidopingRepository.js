const { AntidopingQueryFilter } = require('../../../helpers/QueryFilters');
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const IAntidopingRepository = require('../domain/IAntidopingRepository');
const { AntidopingModel } = require('./AntidopingModel')

const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class AntidopingRepository extends IAntidopingRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await AntidopingModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: AntidopingQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await AntidopingModel.findByPk(id, { include: relations, })
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
            return await AntidopingModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await AntidopingModel.update(data, {
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
            return await AntidopingModel.destroy(
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
        const path = 'uploads/antidopings/'

        if (files.photo) {
            let file = files.photo
            file.mv(path + id + '/photo.jpg')
        }
        if (files.evidence) {
            let file = files.evidence
            file.mv(path + id + '/evidence.pdf')
        }
    }
}

module.exports = AntidopingRepository;