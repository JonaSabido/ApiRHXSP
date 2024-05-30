

const getToday = () => {
    return new Date().toLocaleString("es-MX", { timeZone: "America/Mexico_City" });
}

const getDifferenceDaysBetweenDates = (first_date, second_date) => {
    const oneDay = 24 * 60 * 60 * 1000; // milisegundos en un día
    first_date = new Date(`${first_date}T00:00:00`)
    second_date = new Date(`${second_date}T00:00:00`)
    const differenceTime = second_date.getTime() - first_date.getTime() + oneDay; // Agregar un día extra
    const differenceDays = Math.ceil(differenceTime / oneDay); // Redondear hacia arriba para asegurar que el primer día se cuente
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

    return Object.values(groupedDates);
}

module.exports = {
    getDifferenceDaysBetweenDates,
    getToday,
    dateFormatted,
    getDatesInRange,
    groupDatesByMonth
}