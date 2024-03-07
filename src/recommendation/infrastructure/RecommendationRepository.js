const IRecommendationRepository = require('../domain/RecommendationRepository');
const { RecommendationModel } = require('./RecommendationModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
    {
        model: EmployeeModel,
        attributes: ['id','name','sure_name','last_name'],
        as: 'recommended_employee'
    }
]

class RecommendationRepository extends IRecommendationRepository {
    constructor() {
        super()
    }

    async getAll() {
        try {
            return await RecommendationModel.findAll({ include: relations });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await RecommendationModel.findByPk(id, { include: relations })
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
            return await RecommendationModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await RecommendationModel.update(data, {
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
            return await RecommendationModel.destroy(
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

module.exports = RecommendationRepository;