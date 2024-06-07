const cron = require('node-cron');
const { createAll } = require('./src/notification/infrastructure/NotificationController');

// Configurar el cron job para que se ejecute todos los días a las 12:00 AM
cron.schedule('0 0 * * *', () => {
    console.log('Running createAll function at 12:00 AM');
    createAll();
});

console.log('Cron job scheduled to run at 12:00 AM every day');
