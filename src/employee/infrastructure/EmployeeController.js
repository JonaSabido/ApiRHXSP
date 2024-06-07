const { response } = require('express');
const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const VacationTimeRepository = require('../../vacationtime/infrastructure/VacationTimeRepository');
const EmployeeService = require('../application/EmployeeService');
const EmployeeResponseDTO = require('../domain/EmployeeResponseDTO');
const EmployeeRepository = require('./EmployeeRepository');
const VacationTimeService = require('../../vacationtime/application/VacationTimeService');

const employeeRepository = new EmployeeRepository();
const vacationTimeRepository = new VacationTimeRepository()

const employeeService = new EmployeeService(employeeRepository, vacationTimeRepository);
const vacationTimeService = new VacationTimeService(vacationTimeRepository)

const createAllVacationTimes = async (request, response) => {
    await employeeService.createAllVacationTimes()
    SendSuccessData(response, 200, 'Ok')
}

const createNextVacationTime = async () => {
    const employees = await employeeService.getAllEmployees({})
    for (const employee of employees) {
        await vacationTimeService.createVacationTimeCurrentYear(employee.id)
    }
}

const getAll = async (request, response) => {
    const data = await employeeService.getAllEmployees(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new EmployeeResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await employeeService.getEmployeeById(id)
        return SendSuccessData(response, 200, entity, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 404, null, err.message)
    }
}

const create = async (request, response) => {
    const data = request.body
    const files = request.files

    try {
        const newEntity = await employeeService.createEmployee(data)
        if (files) {
            await employeeService.saveFiles(newEntity.id, files)
        }
        return SendSuccessData(response, 201, newEntity, 'Created')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

const updateById = async (request, response) => {
    const data = request.body
    const files = request.files
    const id = request.params.id

    try {
        const updatedEntity = await employeeService.updateEmployee(id, data)
        if (files) {
            await employeeService.saveFiles(id, files)
        }
        return SendSuccessData(response, 200, updatedEntity, 'Updated')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)

    }
}


const deleteById = async (request, response) => {
    const id = request.params.id
    try {
        const deletedEntity = await employeeService.deleteEmployee(id)
        return SendSuccessData(response, 200, deletedEntity, 'Deleted')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

const saveFiles = async (request, response) => {
    const id = request.params.id
    const files = request.files
    try {
        const newFiles = await employeeService.saveFiles(id, files)
        return SendSuccessData(response, 200, newFiles, 'Ok')
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}

module.exports = {
    getAll,
    getById,
    create,
    updateById,
    deleteById,
    saveFiles,
    createAllVacationTimes,
    createNextVacationTime
};