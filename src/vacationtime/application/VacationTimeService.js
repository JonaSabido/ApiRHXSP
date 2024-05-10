const VacationTime = require("../domain/VacationTime");

class VacationTimeService {
    constructor(
        iVacationTimeRepository
    ) {
        this.iVacationTimeRepository = iVacationTimeRepository
    }

    async getAllVacationTimes(filters) {
        return await this.iVacationTimeRepository.getAll(filters);
    }

    async getVacationTimeById(id) {
        const entity = await this.iVacationTimeRepository.getById(id);
        return new VacationTime(
            entity.id,
            entity.id_employee,
            entity.start_date,
            entity.end_date,
            entity.days,
            entity.available_days,
            entity.createdAt,
            entity.updatedAt,
            entity.employee,
        );
    }

    // async createVacationTime(data) {
    //     const newEntity = await this.iVacationTimeRepository.create(data)
    //     return new VacationTime(
    //         newEntity.id,
    //         newEntity.id_employee,
    //         entity.start_date,
    //         entity.end_date,
    //         entity.days,
    //         entity.available_days,
    //         newEntity.createdAt,
    //         newEntity.updatedAt,
    //     );
    // }

    async updateVacationTime(id, data) {
        await this.iVacationTimeRepository.getById(id);
        await this.iVacationTimeRepository.update(id, data);
        return await this.iVacationTimeRepository.getById(id);
    }

    // async deleteVacationTime(id) {
    //     await this.iVacationTimeRepository.getById(id);
    //     return await this.iVacationTimeRepository.delete(id)
    // }

}

module.exports = VacationTimeService