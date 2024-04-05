const Area = require("../domain/Area");

class AreaService {
    constructor(
        iAreaRepository
    ) {
        this.iAreaRepository = iAreaRepository
    }

    async getAllAreas(filters) {
        return await this.iAreaRepository.getAll(filters);
    }

    async getAreaById(id) {
        const entity = await this.iAreaRepository.getById(id);
        return new Area(entity.id, entity.name, entity.createdAt, entity.updatedAt);
    }

    async createArea(data) {
        const newEntity = await this.iAreaRepository.create(data)
        return new Area(newEntity.id, newEntity.name, newEntity.createdAt, newEntity.updatedAt);
    }

    async updateArea(id, data) {
        await this.iAreaRepository.getById(id);
        await this.iAreaRepository.update(id, data);
        return await this.iAreaRepository.getById(id);
    }

    async deleteArea(id) {
        await this.iAreaRepository.getById(id);
        return await this.iAreaRepository.delete(id)
    }

}

module.exports = AreaService