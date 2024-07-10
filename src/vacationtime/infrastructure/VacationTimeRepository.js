const IVacationTimeRepository = require('../domain/IVacationTimeRepository');
const { VacationTimeModel } = require('./VacationTimeModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { VacationTimeQueryFilter } = require('../../../helpers/QueryFilters');
const { getToday, getTodayFormat } = require('../../../helpers/DateService');


const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class VacationTimeRepository extends IVacationTimeRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await VacationTimeModel.findAll({
                include: relations,
                where: VacationTimeQueryFilter(filters),
                order: [['id', 'DESC'],]
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await VacationTimeModel.findByPk(id, { include: relations })
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
            return await VacationTimeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await VacationTimeModel.update(data, {
                where: {
                    id: id
                }
            })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }



    async createInitialVacationTimes(dataEmployee) {
        try {
            const limitYear = Number(getTodayFormat().slice(0, 4));

            // const startYear = Number(dataEmployee.entry_date.slice(0, 4)) + 1
            const startYear = Number(dataEmployee.entry_date.slice(0, 4))
            const entryMonthAndDay = dataEmployee.entry_date.slice(4, 10)

            let inserts = []
            let lawApplied = false

            for (let i = startYear; i <= limitYear; i++) {

                lawApplied = i >= 2022 && startYear != i

                const availableDays = this.getAvailableDaysByOldYears(inserts.length + 1, lawApplied)

                const newVacationTime = {
                    id_employee: dataEmployee.id,
                    start_date: `${i}${entryMonthAndDay}`,
                    end_date: `${(i + 1).toString()}${entryMonthAndDay}`,
                    days: availableDays,
                    available_days: availableDays
                }
                inserts.push(newVacationTime)
            }

            return await VacationTimeModel.bulkCreate(inserts);
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    getAvailableDaysByOldYears(oldYears, lawApplied) {
        if (!lawApplied) {
            switch (true) {
                case oldYears === 1:
                    return 6;
                case oldYears === 2:
                    return 8;
                case oldYears === 3:
                    return 10;
                case oldYears === 4:
                    return 12;
                case oldYears >= 5 && oldYears <= 9:
                    return 14;
                case oldYears >= 10 && oldYears <= 14:
                    return 16;
                case oldYears >= 15 && oldYears <= 19:
                    return 18;
                case oldYears >= 20 && oldYears <= 24:
                    return 20;
                case oldYears >= 25 && oldYears <= 29:
                    return 22;
                case oldYears >= 30 && oldYears <= 34:
                    return 24;
                case oldYears >= 35 && oldYears <= 39:
                    return 26;
                case oldYears >= 40 && oldYears <= 44:
                    return 28;
                case oldYears >= 45 && oldYears <= 49:
                    return 30;
                case oldYears >= 50 && oldYears <= 54:
                    return 32;
                case oldYears >= 55 && oldYears <= 59:
                    return 34;
                case oldYears >= 60:
                    return 36;
                default:
                    return 0;
            }
        }
        else {
            switch (true) {
                case oldYears === 1:
                    return 12;
                case oldYears === 2:
                    return 14;
                case oldYears === 3:
                    return 16;
                case oldYears === 4:
                    return 18;
                case oldYears === 5:
                    return 20;
                case oldYears >= 6 && oldYears <= 10:
                    return 22;
                case oldYears >= 11 && oldYears <= 15:
                    return 24;
                case oldYears >= 16 && oldYears <= 20:
                    return 26;
                case oldYears >= 21 && oldYears <= 25:
                    return 28;
                case oldYears >= 26 && oldYears <= 30:
                    return 30;
                case oldYears >= 31 && oldYears <= 35:
                    return 32;
                case oldYears >= 36 && oldYears <= 40:
                    return 34;
                case oldYears >= 41 && oldYears <= 45:
                    return 36;
                case oldYears >= 46 && oldYears <= 50:
                    return 38;
                case oldYears >= 51 && oldYears <= 55:
                    return 40;
                case oldYears >= 56 && oldYears <= 60:
                    return 42;
                default:
                    return 0;
            }
        }
    }

    // async delete(id) {
    //     try {
    //         return await VacationTimeModel.destroy(
    //             {
    //                 where: {
    //                     id: id
    //                 }
    //             })
    //     }
    //     catch (err) {
    //         throw new Error(err.message)
    //     }
    // }
}

module.exports = VacationTimeRepository;