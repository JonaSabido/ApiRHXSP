const IAbsenceRepository = require('../domain/IAbsenceRepository');
const { AbsenceModel } = require('./AbsenceModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { JobModel } = require('../../job/infrastructure/JobModel');
const { TypeAbsenceModel } = require('../../type-absence/infrastructure/TypeAbsenceModel');
const { AbsenceQueryFilter } = require('../../../helpers/QueryFilters');
const { connection } = require('../../../config.db');


const relationTypeAbsence = {
    model: TypeAbsenceModel,
    attributes: ['id', 'name'],
    as: 'type_absence'
}

const relationJob = {
    model: JobModel,
    attributes: ['id', 'id_area', 'name',],
    as: 'job'
}

const relationEmployee = {
    model: EmployeeModel,
    attributes: ['id', 'name', 'sure_name', 'last_name'],
    as: 'employee'
}

class AbsenceRepository extends IAbsenceRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await AbsenceModel.findAll({
                include: [relationEmployee, relationTypeAbsence, relationJob],
                order: [['id', 'DESC']],
                where: AbsenceQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await AbsenceModel.findByPk(id, { include: [relationEmployee, relationTypeAbsence, relationJob] })
            if (!entity) {
                throw new Error('Entity not found')
            }
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getByGroup(filters) {
        try {
            return await AbsenceModel.findAll({
                attributes: [
                    [connection.fn('COUNT', connection.col('absence.id')), 'total'],
                    [connection.literal('GROUP_CONCAT(absence.date)'), 'dates']
                ],
                group: 'absence.id_employee',
                include: [relationEmployee],
                where: AbsenceQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async create(data) {
        try {
            const employee = await EmployeeModel.findByPk(data.id_employee);
            data.id_job = employee.id_job;
            return await AbsenceModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await AbsenceModel.update(data, {
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
            return await AbsenceModel.destroy(
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

module.exports = AbsenceRepository;