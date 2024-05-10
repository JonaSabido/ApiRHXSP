const { Op } = require("sequelize");

const AreaQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const JobQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_area) {
        queryFilters.id_area = filters.id_area
    }

    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const DepartmentQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const DiseaseQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const TypeAbsenceQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const EmployeeReentryQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.year) {
        queryFilters.reentry_date = {
            [Op.gte]: new Date(`${filters.year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.reentry_date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }
    return queryFilters;
}

const EmployeeLeaveQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.year) {
        queryFilters.leave_date = {
            [Op.gte]: new Date(`${filters.year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.leave_date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }
    return queryFilters;
}

const EmployeeDiseaseQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.id_disease) {
        queryFilters.id_disease = filters.id_disease
    }
    return queryFilters;
}

const EmergencyQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.reference_name) {
        queryFilters.reference_name = { [Op.like]: `%${filters.reference_name ?? ''}%` }
    }

    if (filters.type) {
        queryFilters.type = filters.type
    }
    return queryFilters;
}

const ContractQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.status) {
        queryFilters.status = filters.status
    }

    if (filters.start_year) {
        queryFilters.start_date = {
            [Op.gte]: new Date(`${filters.start_year}-01-01`).toISOString().slice(0, 10),
            [Op.lte]: new Date(`${filters.start_year}-12-31`).toISOString().slice(0, 10),
        }
    }

    if (filters.end_year) {
        queryFilters.end_date = {
            [Op.gte]: new Date(`${filters.end_year}-01-01`).toISOString().slice(0, 10),
            [Op.lte]: new Date(`${filters.end_year}-12-31`).toISOString().slice(0, 10),
        }
    }

    if (filters.start_start_date || filters.start_end_date) {
        queryFilters.start_date = {
            [Op.gte]: new Date(filters.start_start_date ?? '0001-01-01').toISOString().slice(0, 10),
            [Op.lte]: new Date(filters.start_end_date ?? '9999-12-31').toISOString().slice(0, 10)
        }
    }

    if (filters.end_start_date || filters.end_end_date) {
        queryFilters.end_date = {
            [Op.gte]: new Date(filters.end_start_date ?? '0001-01-01').toISOString().slice(0, 10),
            [Op.lte]: new Date(filters.end_end_date ?? '9999-12-31').toISOString().slice(0, 10),
        }
    }


    return queryFilters;
}

const AntidopingQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    return queryFilters;
}

const TrainingQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    return queryFilters;
}

const ExtraTimeQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.year) {
        queryFilters.date = {
            [Op.gte]: new Date(`${filters.year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }

    return queryFilters;
}

const RecruitmentMethodQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }
    return queryFilters;
}

const AbsenceQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.id_type_absence) {
        queryFilters.id_type_absence = filters.id_type_absence
    }

    if (filters.id_job) {
        queryFilters.id_job = filters.id_job
    }

    if (filters.year) {
        queryFilters.date = {
            [Op.gte]: new Date(`${filters.year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }
    return queryFilters;
}

const UniformQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.type) {
        queryFilters.type = filters.type
    }

    if (filters.year) {
        queryFilters.delivered_date = {
            [Op.gte]: new Date(`${filters.year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.delivered_date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }

    return queryFilters;
}

const VacationTimeQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    return queryFilters;
}

const EmployeeVacationQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.id_vacation_time) {
        queryFilters.id_vacation_time = filters.id_vacation_time
    }

    return queryFilters;
}

module.exports = {
    AreaQueryFilter,
    JobQueryFilter,
    DepartmentQueryFilter,
    DiseaseQueryFilter,
    TypeAbsenceQueryFilter,
    EmployeeReentryQueryFilter,
    EmployeeLeaveQueryFilter,
    EmployeeDiseaseQueryFilter,
    EmergencyQueryFilter,
    ContractQueryFilter,
    AntidopingQueryFilter,
    TrainingQueryFilter,
    ExtraTimeQueryFilter,
    RecruitmentMethodQueryFilter,
    AbsenceQueryFilter,
    UniformQueryFilter,
    VacationTimeQueryFilter,
    EmployeeVacationQueryFilter
}