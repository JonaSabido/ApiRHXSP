const { getTodayFormat } = require("../../../helpers/DateService");
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

    async createVacationTimeCurrentYear(id_employee) {
        const currentYear = getTodayFormat().slice(0, 4)
        if (currentYear >= 2025) {
            const vacationTimesByEmployee = await this.iVacationTimeRepository.getAll({ id_employee: id_employee })
            const last = vacationTimesByEmployee[0]
            const available_days = this.iVacationTimeRepository.getAvailableDaysByOldYears(vacationTimesByEmployee.length + 1, true)
            const nextYear = Number(currentYear) + 1
            await this.iVacationTimeRepository.create({
                id_employee: id_employee,
                start_date: `${currentYear}-${last.start_date.slice(5, 7)}-${last.start_date.slice(8, 10)}`,
                end_date: `${nextYear}-${last.end_date.slice(5, 7)}-${last.end_date.slice(8, 10)}`,
                days: available_days,
                available_days: available_days,
            })
        }
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