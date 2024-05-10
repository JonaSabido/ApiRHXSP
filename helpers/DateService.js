

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

module.exports = {
    getDifferenceDaysBetweenDates,
    getToday,
    dateFormatted
}