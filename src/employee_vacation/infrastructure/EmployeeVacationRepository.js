const IEmployeeVacationRepository = require('../domain/IEmployeeVacationRepository');
const { EmployeeVacationModel } = require('./EmployeeVacationModel')
const { VacationTimeModel } = require('../../vacationtime/infrastructure/VacationTimeModel');
const { EmployeeVacationQueryFilter, EmployeeQueryFilter, VacationTimeQueryFilter } = require('../../../helpers/QueryFilters');
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { getDatesInRange, groupDatesByMonth } = require('../../../helpers/DateService');
const { connection } = require('../../../config.db');


function generateRelations(filters) {
    return [
        {
            model: VacationTimeModel,
            attributes: ['id', 'id_employee', 'start_date', 'end_date', 'days', 'available_days'],
            as: 'vacation_time',
            where: VacationTimeQueryFilter(filters.vacation_time),
            include: [
                {
                    model: EmployeeModel,
                    attributes: ['id', 'name', 'sure_name', 'last_name'],
                    as: 'employee',
                },
            ]
        },
    ]
}

class EmployeeVacationRepository extends IEmployeeVacationRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            filters.entity = {
                start_year: filters.start_year,
                end_year: filters.end_year,
                start_start_date: filters.start_start_date,
                start_end_date: filters.start_end_date,
                end_start_date: filters.end_start_date,
                end_start_date: filters.end_start_date
            }

            filters.vacation_time = {
                id_employee: filters.id_employee
            }

            return await EmployeeVacationModel.findAll({
                attributes: [
                    'id', // Añade aquí todas las columnas que quieres devolver de EmployeeVacationModel
                    'id_vacation_time',
                    'start_date',
                    'end_date',
                    'available_days',
                    'createdAt',
                    'updatedAt',
                ],
                include: generateRelations(filters),
                where: EmployeeVacationQueryFilter(filters.entity),
                order: [['id', 'DESC'],]

            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmployeeVacationModel.findByPk(id, { include: relations })
            if (!entity) {
                throw new Error('Entity not found')
            }
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getDatesByVacationTime(idVacationTime) {
        try {
            const entities = await EmployeeVacationModel.findAll({
                where: { id_vacation_time: idVacationTime }
            });
            const dates = []
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async create(data) {
        try {
            return await EmployeeVacationModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await EmployeeVacationModel.update(data, {
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
            return await EmployeeVacationModel.destroy(
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

    async getDaysByVacationTimeId(id) {
        try {
            const dates = []
            const employeeVacations = await EmployeeVacationModel.findAll({
                where: {
                    id_vacation_time: id
                }
            });

            employeeVacations.forEach(eV => {
                const datesInRange = getDatesInRange(eV.start_date, eV.end_date)
                datesInRange.forEach(element => {
                    dates.push(element)
                })
            });

            return groupDatesByMonth(dates);
        }
        catch (err) {
            throw new Error(err.message)
        }
    }
}

module.exports = EmployeeVacationRepository;