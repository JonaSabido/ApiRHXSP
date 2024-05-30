const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const { getToday, getDifferenceDaysBetweenDates, dateFormatted } = require('../../../helpers/DateService');
const ContractRepository = require('../../contract/infrastructure/ContractRepository');
const NotificationService = require('../application/NotificationService');
const NotificationRepository = require('./NotificationRepository');

const notificationRepository = new NotificationRepository();
const notificationService = new NotificationService(notificationRepository);

const contractRepository = new ContractRepository();
const contractService = new ContractRepository(contractRepository);

const createAll = async (request, response) => {
    const data = request.body
    try {
        const contracts = await contractService.getAll()

        if (contracts.length > 0) {
            const today = getToday()
            contracts.forEach(async contract => {
                const difference = getDifferenceDaysBetweenDates(today, contract.end_date)
                if (difference == 30 || difference == 14 || difference == 7) {
                    await notificationService.createNotification({
                        id_notification_type: 3,
                        title: `${contract.employee.name} ${contract.employee.sure_name} ${contract.employee.last_name}`,
                        description: `Vencimiento de Contrato el ${dateFormatted(contract.end_date)}`,
                    })
                }
            });
        }
    }
    catch (err) {
        return SendErrorData(response, 500, null, err.message)
    }
}


module.exports = {
    createAll
};