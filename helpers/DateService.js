

const getToday = () => {
    return new Date().toLocaleString("es-MX", { timeZone: "America/Mexico_City" });
}

const getTodayFormat = () => {
    const date = new Date();
    const options = { timeZone: 'America/Mexico_City' };

    const year = date.toLocaleString('es-MX', { ...options, year: 'numeric' });
    const month = date.toLocaleString('es-MX', { ...options, month: '2-digit' });
    const day = date.toLocaleString('es-MX', { ...options, day: '2-digit' });

    return `${year}-${month}-${day}`;
}

const getDateFormat = (date) => {
    const options = { timeZone: 'America/Mexico_City' };

    const year = date.toLocaleString('es-MX', { ...options, year: 'numeric' });
    const month = date.toLocaleString('es-MX', { ...options, month: '2-digit' });
    const day = date.toLocaleString('es-MX', { ...options, day: '2-digit' });

    return `${year}-${month}-${day}`;
}

const getLastDayByMonth = (month, year) => {
    // Verificar que el mes esté en el rango válido
    month = Number(month)
    
    if (month < 1 || month > 12) {
        throw new Error('El mes debe ser un número entre 1 y 12.');
    }

    // Array con los últimos días de cada mes por defecto (no bisiesto)
    const lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // Si el mes es febrero, verificar si es un año bisiesto
    if (month === 2) {
        // Comprobar si el año es bisiesto
        const isLeapYear = (year) => {
            if ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) {
                return true;
            }
            return false;
        };

        // Si es bisiesto, el último día de febrero es 29
        return isLeapYear(year) ? 29 : 28;
    }

    // Devolver el último día del mes
    return lastDay[month - 1];
};

const getDifferenceDaysBetweenDates = (first_date, second_date) => {
    const oneDay = 24 * 60 * 60 * 1000; // milisegundos en un día
    first_date = new Date(`${first_date}T00:00:00`)
    second_date = new Date(`${second_date}T00:00:00`)
    const differenceTime = second_date.getTime() - first_date.getTime() + oneDay; // Agregar un día extra
    const differenceDays = Math.ceil(differenceTime / oneDay); // Redondear hacia arriba para asegurar que el primer día se cuente
    return differenceDays;
}

const getDifferenceDaysBetweenDatesNoFirstDay = (first_date, second_date) => {
    const oneDay = 24 * 60 * 60 * 1000; // milisegundos en un día
    first_date = new Date(`${first_date}T00:00:00`);
    second_date = new Date(`${second_date}T00:00:00`);
    const differenceTime = second_date.getTime() - first_date.getTime(); // Calcular la diferencia en milisegundos
    const differenceDays = Math.floor(differenceTime / oneDay); // Redondear hacia abajo
    return differenceDays;
}

const dateFormatted = (date) => {
    const newDate = new Date(`${date}T00:00:00`)
    return newDate.toLocaleDateString('es-MX', { day: '2-digit', month: 'long', year: 'numeric', timeZone: 'America/Mexico_City' });
}

const getDatesInRange = (start_date, end_date) => {
    const startDate = new Date(start_date);
    const endDate = new Date(end_date);

    const dateArray = [];

    let currentDate = startDate;

    while (currentDate <= endDate) {
        dateArray.push(currentDate.toISOString().split('T')[0]);
        currentDate.setDate(currentDate.getDate() + 1);
    }

    return dateArray;
}

const groupDatesByMonth = (dates) => {
    const groupedDates = {};

    dates.forEach(dateString => {
        const date = new Date(`${dateString}T00:00:00`);
        const year = date.getFullYear();
        const month = date.getMonth() + 1;

        const key = `${year}-${month}`;

        if (!groupedDates[key]) {
            groupedDates[key] = {
                year: year,
                month: month,
                dates: []
            };
        }

        groupedDates[key].dates.push(dateString);
    });

    // Convert the object to an array
    const groupedDatesArray = Object.values(groupedDates);

    groupedDatesArray.sort((a, b) => {
        if (a.year === b.year) {
            return a.month - b.month;
        } else {
            return a.year - b.year;
        }
    });

    return groupedDatesArray;
}
module.exports = {
    getDifferenceDaysBetweenDates,
    getToday,
    dateFormatted,
    getDatesInRange,
    groupDatesByMonth,
    getTodayFormat,
    getDifferenceDaysBetweenDatesNoFirstDay,
    getLastDayByMonth,
    getDateFormat
}