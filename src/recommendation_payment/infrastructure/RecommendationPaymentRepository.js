const IRecommendationPaymentRepository = require('../domain/IRecommendationPaymentRepository');
const { RecommendationPaymentModel } = require('./RecommendationPaymentModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { RecommendationModel } = require('../../recommendation/infrastructure/RecommendationModel');
const { where } = require('sequelize');
const { RecommendationPaymentQueryFilter } = require('../../../helpers/QueryFilters');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
    {
        model: RecommendationModel,
        attributes: ['id', 'id_employee', 'id_recommended_employee', 'amount'],
        as: 'recommendation'
    }
]

class RecommendationPaymentRepository extends IRecommendationPaymentRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await RecommendationPaymentModel.findAll({
                include: relations,
                where: RecommendationPaymentQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await RecommendationPaymentModel.findByPk(id, { include: relations })
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
            return await RecommendationPaymentModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await RecommendationPaymentModel.update(data, {
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
            return await RecommendationPaymentModel.destroy(
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

module.exports = RecommendationPaymentRepository;