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


const TypeLeaveQueryFilter = (filters) => {
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

    if (filters.type) {
        queryFilters.type = filters.type
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
    // if (filters.id_employee) {
    //     queryFilters.id_employee = filters.id_employee
    // }

    if (filters.id_vacation_time) {
        queryFilters.id_vacation_time = filters.id_vacation_time
    }

    if (filters.start_year) {
        queryFilters.start_date = {
            [Op.gte]: new Date(`${filters.start_year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.start_year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.end_year) {
        queryFilters.end_date = {
            [Op.gte]: new Date(`${filters.end_year}-01-01`).setUTCHours(0),
            [Op.lte]: new Date(`${filters.end_year}-12-31`).setUTCHours(0),
        }
    }

    if (filters.start_start_date || filters.start_end_date) {
        queryFilters.start_date = {
            [Op.gte]: new Date(filters.start_start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.start_end_date ?? '9999-12-31').setUTCHours(0),
        }
    }

    if (filters.end_start_date || filters.end_end_date) {
        queryFilters.end_date = {
            [Op.gte]: new Date(filters.end_start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_end_date ?? '9999-12-31').setUTCHours(0),
        }
    }
    return queryFilters;
}

const UserQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }

    if (filters.email) {
        queryFilters.email = { [Op.like]: `%${filters.email ?? ''}%` }
    }
    return queryFilters;
}

const RecommendationQueryFilter = (filters) => {
    const queryFilters = {}

    if (filters.id_employee) {
        queryFilters.id_employee = filters.id_employee
    }

    if (filters.id_recommended_employee) {
        queryFilters.id_recommended_employee = filters.id_recommended_employee
    }

    if (filters.amount) {
        queryFilters.amount = filters.amount
    }

    return queryFilters;
}

const RecommendationPaymentQueryFilter = (filters) => {
    const queryFilters = {}
    if (filters.id_recommendation) {
        queryFilters.id_recommendation = filters.id_recommendation
    }

    if (filters.id_paying_employee) {
        queryFilters.id_paying_employee = filters.id_paying_employee
    }

    if (filters.start_date || filters.end_date) {
        queryFilters.payment_date = {
            [Op.gte]: new Date(filters.start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.end_date ?? '9999-12-31').setUTCHours(0),
        }
    }
    return queryFilters;
}

const NotificationQueryFilter = (filters) => {
    const queryFilters = {}

    if (filters.id_notification_type) {
        queryFilters.id_notification_type = filters.id_notification_type
    }

    if (filters.title) {
        queryFilters.title = { [Op.like]: `%${filters.title ?? ''}%` }
    }

    if (filters.description) {
        queryFilters.description = { [Op.like]: `%${filters.description ?? ''}%` }
    }

    return queryFilters;
}

const NotificationUserQueryFilter = (filters) => {
    const queryFilters = {}

    if (filters.id_notification) {
        queryFilters.id_notification = filters.id_notification
    }

    if (filters.id_user) {
        queryFilters.id_user = filters.id_user
    }

    if (filters.status) {
        queryFilters.status = filters.status
    }

    return queryFilters;
}

const EmployeeQueryFilter = (filters) => {
    const queryFilters = {}

    if (filters.id_department) {
        queryFilters.id_department = filters.id_department
    }

    if (filters.id_job) {
        queryFilters.id_job = filters.id_job
    }

    if (filters.id_recruitment_method) {
        queryFilters.id_recruitment_method = filters.id_recruitment_method
    }

    if (filters.code) {
        queryFilters.code = { [Op.like]: `%${filters.code ?? ''}%` }
    }

    if (filters.name) {
        queryFilters.name = { [Op.like]: `%${filters.name ?? ''}%` }
    }

    if (filters.sure_name) {
        queryFilters.sure_name = { [Op.like]: `%${filters.sure_name ?? ''}%` }
    }

    if (filters.last_name) {
        queryFilters.last_name = { [Op.like]: `%${filters.last_name ?? ''}%` }
    }

    if (filters.entry_start_date || filters.entry_end_date) {
        queryFilters.natal_date = {
            [Op.gte]: new Date(filters.entry_start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.entry_end_date ?? '9999-12-31').setUTCHours(0),
        }
    }

    if (filters.status) {
        queryFilters.status = filters.status
    }

    if (filters.gender) {
        queryFilters.gender = filters.gender
    }

    if (filters.ssp) {
        queryFilters.ssp = filters.ssp
    }

    if (filters.natal_start_date || filters.natal_end_date) {
        queryFilters.natal_date = {
            [Op.gte]: new Date(filters.natal_start_date ?? '0001-01-01').setUTCHours(0),
            [Op.lte]: new Date(filters.natal_end_date ?? '9999-12-31').setUTCHours(0),
        }
    }

    if (filters.has_children) {
        queryFilters.has_children = filters.has_children
    }

    return queryFilters;
}

module.exports = {
    AreaQueryFilter,
    JobQueryFilter,
    DepartmentQueryFilter,
    DiseaseQueryFilter,
    TypeAbsenceQueryFilter,
    TypeLeaveQueryFilter,
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
    EmployeeVacationQueryFilter,
    UserQueryFilter,
    RecommendationQueryFilter,
    RecommendationPaymentQueryFilter,
    NotificationQueryFilter,
    NotificationUserQueryFilter,
    EmployeeQueryFilter
}