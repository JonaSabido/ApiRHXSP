const cron = require('node-cron');
const { createAll } = require('./src/notification/infrastructure/NotificationController');
const { checkExpired } = require('./src/contract/infrastructure/ContractController');
const { createNextVacationTime } = require('./src/employee/infrastructure/EmployeeController');

// Configurar el cron job para que se ejecute todos los días a las 12:00 AM
cron.schedule('0 0 * * *', () => {
    console.log('Running createAll function at 12:00 AM');
    createAll();
    checkExpired();
});

cron.schedule('0 0 1 1 *', () => {
    console.log('Running next vacation time function at 12:00 AM');
    createNextVacationTime()
});
console.log('Cron job scheduled to run at 12:00 AM every day');
