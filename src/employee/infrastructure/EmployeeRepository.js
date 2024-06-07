const IEmployeeRepository = require('../domain/IEmployeeRepository');
const { EmployeeModel } = require('./EmployeeModel')
const { DepartmentModel } = require('../../department/infrastructure/DepartmentModel');
const { JobModel } = require('../../job/infrastructure/JobModel');
const { RecruitmentMethodModel } = require('../../recruitment-method/infrastructure/RecruitmentMethodModel');
const { EmployeeQueryFilter } = require('../../../helpers/QueryFilters');

const relations = [
    {
        model: DepartmentModel,
        attributes: ['id', 'name'],
        as: 'department'
    },
    {
        model: JobModel,
        attributes: ['id', 'id_area', 'name'],
        as: 'job'
    },
    {
        model: RecruitmentMethodModel,
        attributes: ['id', 'name'],
        as: 'recruitment_method'
    },
]

class EmployeeRepository extends IEmployeeRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await EmployeeModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: EmployeeQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await EmployeeModel.findByPk(id, { include: relations })
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
            return await EmployeeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await EmployeeModel.update(data, {
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
            return await EmployeeModel.destroy(
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

    async changeStatus(id, status) {
        try {
            return await EmployeeModel.update(
                { status: status }, {
                where: {
                    id: id
                }
            })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async saveFiles(id, files) {
        const path = 'uploads/employees/'

        if (files.birth_certificate) {
            let file = files.birth_certificate
            file.mv(path + id + '/birth_certificate.pdf')
        }
        if (files.identification) {
            let file = files.identification
            file.mv(path + id + '/identification.pdf')
        }
        if (files.curp) {
            let file = files.curp
            file.mv(path + id + '/curp.pdf')
        }
        if (files.nss) {
            let file = files.nss
            file.mv(path + id + '/nss.pdf')
        }
        if (files.address_certification) {
            let file = files.address_certification
            file.mv(path + id + '/address_certification.pdf')
        }
        if (files.studies_certification) {
            let file = files.studies_certification
            file.mv(path + id + '/studies_certification.pdf')
        }
        if (files.tax_certificate) {
            let file = files.tax_certificate
            file.mv(path + id + '/tax_certificate.pdf')
        }
        if (files.smn) {
            let file = files.smn
            file.mv(path + id + '/smn.pdf')
        }
        if (files.no_criminal_certificate) {
            let file = files.no_criminal_certificate
            file.mv(path + id + '/no_criminal_certificate.pdf')
        }
        if (files.health_certificate) {
            let file = files.health_certificate
            file.mv(path + id + '/health_certificate.pdf')
        }
        if (files.sv) {
            let file = files.sv
            file.mv(path + id + '/sv.pdf')
        }
        if (files.employee_image) {
            let file = files.employee_image
            file.mv(path + id + '/employee_image.jpg')
        }
        if (files.qr_image) {
            let file = files.qr_image
            file.mv(path + id + '/qr_image.jpg')
        }
    }
}

module.exports = EmployeeRepository;