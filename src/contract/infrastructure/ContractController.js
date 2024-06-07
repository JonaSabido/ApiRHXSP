const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const { getTodayFormat } = require('../../../helpers/DateService');
const ContractService = require('../application/ContractService');
const ContractResponseDTO = require('../domain/ContractResponseDTO');
const ContractRepository = require('./ContractRepository');

const contractRepository = new ContractRepository();
const contractService = new ContractService(contractRepository);

const checkExpired = async () => {
    const contractExpireds = await contractService.getAllContracts({
        type: 1,
        end_end_date: getTodayFormat()
    })

    for (const contract of contractExpireds) {
        await contractService.updateContract(contract.id, {
            status: false
        })
    }
}

const getAll = async (request, response) => {
    const data = await contractService.getAllContracts(request.query)
    if (data.length) {
        const list = []
        data.forEach(element => {
            const newDTO = new ContractResponseDTO(element)
            list.push(newDTO)
        });
        return SendSuccessData(response, 200, list, 'Ok')
    }
    return SendErrorData(response, 404, [], 'No data found')
}

const getById = async (request, response) => {
    try {
        const id = request.params.id
        const entity = await contractService.getContractById(id)
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
        const newEntity = await contractService.createContract(data)
        if (files) {
            await contractService.saveFiles(newEntity.id, files)
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
        const updatedEntity = await contractService.updateContract(id, data)
        if (files) {
            await contractService.saveFiles(id, files)
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
        const deletedEntity = await contractService.deleteContract(id)
        return SendSuccessData(response, 200, deletedEntity, 'Deleted')
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
    checkExpired
};