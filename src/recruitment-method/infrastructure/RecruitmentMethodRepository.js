const { RecruitmentMethodQueryFilter } = require('../../../helpers/QueryFilters');
const IRecruitmentMethodRepository = require('../domain/IRecruitmentMethodRepository');
const { RecruitmentMethodModel } = require('./RecruitmentMethodModel')

class RecruitmentMethodRepository extends IRecruitmentMethodRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await RecruitmentMethodModel.findAll({
                where: RecruitmentMethodQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await RecruitmentMethodModel.findByPk(id)
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
            return await RecruitmentMethodModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await RecruitmentMethodModel.update(data, {
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
            return await RecruitmentMethodModel.destroy(
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

module.exports = RecruitmentMethodRepository;