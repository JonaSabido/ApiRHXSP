const User = require("../domain/User");

class UserService {
    constructor(
        iUserRepository
    ) {
        this.iUserRepository = iUserRepository
    }

    async getAllUsers() {
        return await this.iUserRepository.getAll();
    }

    async getUserById(id) {
        const entity = await this.iUserRepository.getById(id);
        return new User(entity.id, entity.name, entity.email, entity.password, entity.createdAt, entity.updatedAt);
    }

    async createUser(data) {
        const newEntity = await this.iUserRepository.create(data)
        return new User(newEntity.id, newEntity.name, newEntity.email, newEntity.password, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateUser(id, data) {
        await this.iUserRepository.getById(id);
        await this.iUserRepository.update(id, data);
        return await this.iUserRepository.getById(id);
    }

    async deleteUser(id) {
        await this.iUserRepository.getById(id);
        return await this.iUserRepository.delete(id)
    }

}

module.exports = UserService