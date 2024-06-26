const { UserQueryFilter } = require('../../../helpers/QueryFilters');
const IUserRepository = require('../domain/IUserRepository');
const { UserModel } = require('./UserModel')

class UserRepository extends IUserRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await UserModel.findAll({
                where: UserQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await UserModel.findByPk(id)
            if (!entity) {
                throw new Error('Entity not found')
            }
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getByFilters(filters, attributes) {
        try {
            const entity = await UserModel.findOne({
                where: filters,
                attributes: attributes
            })
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async create(data) {
        try {
            return await UserModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await UserModel.update(data, {
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
            return await UserModel.destroy(
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

module.exports = UserRepository;