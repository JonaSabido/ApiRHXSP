const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const { getTodayFormat } = require('../../../helpers/DateService');
const EmployeeService = require('../../employee/application/EmployeeService');
const EmployeeRepository = require('../../employee/infrastructure/EmployeeRepository');
const AnalyticService = require('../application/AnalyticService');
const AnalyticRepository = require('./AnalyticRepository');
const RecommendationPaymentService = require('../../recommendation_payment/application/RecommendationPaymentService');
const RecommendationPaymentRepository = require('../../recommendation_payment/infrastructure/RecommendationPaymentRepository');
const ContractService = require('../../contract/application/ContractService');
const ContractRepository = require('../../contract/infrastructure/ContractRepository');
const AreaRepository = require('../../area/infrastructure/AreaRepository');
const JobRepository = require('../../job/infrastructure/JobRepository');
const DepartmentRepository = require('../../department/infrastructure/DepartmentRepository');
const AreaService = require('../../area/application/AreaService');
const JobService = require('../../job/application/JobService');
const DepartmentService = require('../../department/application/DepartmentService');


const analyticRepository = new AnalyticRepository();
const analyticService = new AnalyticService(analyticRepository);

const employeeRepository = new EmployeeRepository();
const employeeService = new EmployeeService(employeeRepository);

const recommendationPaymentRepository = new RecommendationPaymentRepository();
const recommendationPaymentService = new RecommendationPaymentService(recommendationPaymentRepository);

const contractRepository = new ContractRepository();
const contractService = new ContractService(contractRepository);

const areaRepository = new AreaRepository();
const areaService = new AreaService(areaRepository);

const jobRepository = new JobRepository();
const jobService = new JobService(jobRepository);

const departmentRepository = new DepartmentRepository();
const departmentService = new DepartmentService(departmentRepository);

const getTotalData = async (request, response) => {
    const employees = await employeeService.getAllEmployees({})
    const areas = await areaService.getAllAreas({})
    const jobs = await jobService.getAllJobs({})
    const departments = await departmentService.getAllDepartments({})
    const data = {
        total_employees: employees.length,
        total_areas: areas.length,
        total_jobs: jobs.length,
        total_departments: departments.length
    }

    SendSuccessData(response, 200, data, 'Ok')

}

const getEventsByMonth = async (request, response) => {
    const events = []
    const currentYear = getTodayFormat().slice(0, 4)
    const currentMonth = getTodayFormat().slice(5, 7)
    const startDate = `${currentYear}-${currentMonth}-01`
    const endDate = `${currentYear}-${currentMonth}-31`

    const employees = await employeeService.getAllEmployees({})
    for (const employee of employees) {
        employee.natal_date = `${currentYear}-${employee.natal_date.slice(5, 7)}-${employee.natal_date.slice(8, 10)}`
        if (employee.natal_date >= startDate && employee.natal_date <= endDate) {
            events.push({
                type: 1,
                date: employee.natal_date
            })
        }
    }

    const payments = await recommendationPaymentService.getAllRecommendationPayments({
        start_date: startDate,
        end_date: endDate
    })
    for (const payment of payments) {
        events.push({
            type: 2,
            date: payment.payment_date
        })
    }

    const contracts = await contractService.getAllContracts({
        end_start_date: startDate,
        end_end_date: endDate,
    })
    for (const contract of contracts) {
        events.push({
            type: 3,
            date: contract.end_date
        })
    }

    return SendSuccessData(response, 200, events, 'Ok')
}

const getLeavesByMonth = async (request, response) => {
    const data = await analyticService.getLeavesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getEntriesByMonth = async (request, response) => {
    const data = await analyticService.getEntriesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getRecruitmentsByMonth = async (request, response) => {
    let data = await analyticService.getRecruitmentsByMonth(request.query.month, request.query.year)
    if (data.length) {
        data = data.filter(x => x.total != 0)
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getValidationsByMonth = async (request, response) => {
    const data = await analyticService.getValidationsByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getTypeLeavesByMonth = async (request, response) => {
    const data = await analyticService.getTypeLeavesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getActiveTimesByMonth = async (request, response) => {
    const data = await analyticService.getActiveTimesByMonth(request.query.month, request.query.year)
    if (data.length) {
        return SendSuccessData(response, 200, data, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

module.exports = {
    getTotalData,
    getEventsByMonth,
    getLeavesByMonth,
    getEntriesByMonth,
    getRecruitmentsByMonth,
    getValidationsByMonth,
    getTypeLeavesByMonth,
    getActiveTimesByMonth
};