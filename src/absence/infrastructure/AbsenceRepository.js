const IAbsenceRepository = require('../domain/IAbsenceRepository');
const { AbsenceModel } = require('./AbsenceModel')
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { JobModel } = require('../../job/infrastructure/JobModel');
const { TypeAbsenceModel } = require('../../type-absence/infrastructure/TypeAbsenceModel');


const relations = [
    {
        model: TypeAbsenceModel,
        attributes: ['id', 'name'],
        as: 'type_absence'
    },
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
    {
        model: JobModel,
        attributes: ['id', 'id_area', 'name',],
        as: 'job'
    }
]

class AbsenceRepository extends IAbsenceRepository {
    constructor() {
        super()
    }

    async getAll() {
        try {
            return await AbsenceModel.findAll({ include: relations });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await AbsenceModel.findByPk(id, { include: relations })
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