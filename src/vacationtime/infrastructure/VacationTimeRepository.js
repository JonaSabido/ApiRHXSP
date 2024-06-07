const IVacationTimeRepository = require('../domain/IVacationTimeRepository');
const { VacationTimeModel } = require('./VacationTimeModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { VacationTimeQueryFilter } = require('../../../helpers/QueryFilters');
const { getToday } = require('../../../helpers/DateService');


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
            const today = getToday()
            const limitYear = Number(new Date(today).getFullYear() + 1);

            const startYear = Number(dataEmployee.entry_date.slice(0, 4)) + 1
            const entryMonthAndDay = dataEmployee.entry_date.slice(4, 10)

            let availableDays = 12;
            let inserts = []

            for (let i = startYear; i <= limitYear; i++) {
                const newVacationTime = {
                    id_employee: dataEmployee.id,
                    start_date: `${i}${entryMonthAndDay}`,
                    end_date: `${(i + 1).toString()}${entryMonthAndDay}`,
                    days: availableDays,
                    available_days: availableDays
                }
                inserts.push(newVacationTime)
                availableDays += 2;
            }

            return await VacationTimeModel.bulkCreate(inserts);
        }
        catch (err) {
            throw new Error(err.message)
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