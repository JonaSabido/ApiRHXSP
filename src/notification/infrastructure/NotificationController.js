const { SendSuccessData, SendErrorData } = require('../../../helpers/ApiResponse');
const { dateFormatted, getTodayFormat, getDifferenceDaysBetweenDatesNoFirstDay } = require('../../../helpers/DateService');

const ContractService = require('../../contract/application/ContractService');
const ContractRepository = require('../../contract/infrastructure/ContractRepository');
const EmployeeService = require('../../employee/application/EmployeeService');
const EmployeeRepository = require('../../employee/infrastructure/EmployeeRepository');
const NotificationUserService = require('../../notification-user/application/NotificationUserService');
const NotificationUserRepository = require('../../notification-user/infrastructure/NotificationUserRepository');
const RecommendationPaymentService = require('../../recommendation_payment/application/RecommendationPaymentService');
const RecommendationPaymentRepository = require('../../recommendation_payment/infrastructure/RecommendationPaymentRepository');
const UserService = require('../../user/application/UserService');
const UserRepository = require('../../user/infrastructure/UserRepository');
const NotificationService = require('../application/NotificationService');
const NotificationRepository = require('./NotificationRepository');

const notificationRepository = new NotificationRepository();
const notificationService = new NotificationService(notificationRepository);

const notificationUserRepository = new NotificationUserRepository();
const notificationUserService = new NotificationUserService(notificationUserRepository);

const contractRepository = new ContractRepository();
const contractService = new ContractService(contractRepository);

const employeeRepository = new EmployeeRepository();
const employeeService = new EmployeeService(employeeRepository);

const recommendationPaymentRepository = new RecommendationPaymentRepository();
const recommendationPaymentService = new RecommendationPaymentService(recommendationPaymentRepository);

const userRepository = new UserRepository();
const userService = new UserService(userRepository);

const createAll = async () => {
    try {
        const newNotifications = []
        const today = getTodayFormat();


        const contracts = await contractService.getAllContracts({
            end_start_date: today
        })

        if (contracts.length > 0) {
            for (const contract of contracts) {
                const difference = getDifferenceDaysBetweenDatesNoFirstDay(today, contract.end_date)
                if (difference == 30 || difference == 14 || difference == 7 || difference == 0) {

                    const restantDays = difference == 0 ? ' (Hoy)' : ` (${difference} días restantes)`
                    const title = `${contract.employee.name} ${contract.employee.sure_name} ${contract.employee.last_name}`;
                    const description = `Vencimiento de Contrato el ${dateFormatted(contract.end_date)} ${restantDays}`;

                    const existNotification = await notificationService.getAllNotifications({
                        title: title,
                        description: description
                    })

                    if (existNotification.length == 0) {
                        const newNotification = await notificationService.createNotification({
                            id_notification_type: 3,
                            title: title,
                            description: description,
                            date: new Date().setUTCHours(0)
                        })
                        newNotifications.push(newNotification)
                    }
                }
            }
        }

        const payments = await recommendationPaymentService.getAllRecommendationPayments({
            start_date: today
        })

        if (payments.length > 0) {
            for (const payment of payments) {
                const difference = getDifferenceDaysBetweenDatesNoFirstDay(today, payment.payment_date)
                if (difference == 30 || difference == 14 || difference == 7 || difference == 0) {

                    const restantDays = difference == 0 ? ' (Hoy)' : ` (${difference} días restantes)`
                    const title = `${payment.employee.name} ${payment.employee.sure_name} ${payment.employee.last_name}`;
                    const description = `Pago por recomendación el ${dateFormatted(payment.payment_date)} ${restantDays}`;

                    const existNotification = await notificationService.getAllNotifications({
                        title: title,
                        description: description
                    })

                    if (existNotification.length == 0) {
                        const newNotification = await notificationService.createNotification({
                            id_notification_type: 2,
                            title: title,
                            description: description,
                            date: new Date().setUTCHours(0)
                        })
                        newNotifications.push(newNotification)
                    }
                }
            }
        }

        const employees = await employeeService.getAllEmployees({})

        if (employees.length > 0) {
            for (const employee of employees) {

                employee.natal_date = `${getTodayFormat().slice(0, 4)}-${employee.natal_date.slice(5, 7)}-${employee.natal_date.slice(8, 10)}`

                const difference = getDifferenceDaysBetweenDatesNoFirstDay(today, employee.natal_date)
                if (difference == 30 || difference == 14 || difference == 7 || difference == 0) {

                    const restantDays = difference == 0 ? ' (Hoy)' : ` (${difference} días restantes)`
                    const title = `${employee.name} ${employee.sure_name} ${employee.last_name}`;
                    const description = `Próximo cumpleaños el ${dateFormatted(employee.natal_date)} ${restantDays}`;

                    const existNotification = await notificationService.getAllNotifications({
                        title: title,
                        description: description
                    })

                    if (existNotification.length == 0) {
                        const newNotification = await notificationService.createNotification({
                            id_notification_type: 1,
                            title: title,
                            description: description,
                            date: new Date().setUTCHours(0)
                        })
                        newNotifications.push(newNotification)
                    }
                }
            }
        }

        const users = await userService.getAllUsers({})
        for (const user of users) {
            newNotifications.forEach(async notification => {
                await notificationUserService.createNotificationUser({
                    id_notification: notification.id,
                    id_user: user.id,
                    status: false
                })
            })
        }

    }
    catch (err) {
        console.log(err)
    }
}


module.exports = {
    createAll
};