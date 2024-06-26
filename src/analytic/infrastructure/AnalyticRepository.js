const IAnalyticRepository = require('../domain/IAnalyticRepository');
const { connection } = require('../../../config.db');
const { EmployeeLeaveModel } = require('../../employee-leaves/infrastructure/EmployeeLeaveModel');
const { EmployeeReentryModel } = require('../../employee-reentry/infrastructure/EmployeeReentryModel');

const { Op } = require("sequelize");
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const { getDifferenceDaysBetweenDates, getLastDayByMonth } = require('../../../helpers/DateService');



class AnalyticRepository extends IAnalyticRepository {
    constructor() {
        super()
    }


    async getLeavesByMonth(month, year) {
        try {
            const query = `
                SELECT 
                    departments.name as label, 
                    COUNT(employee_leaves.id) as total,
                    ROUND(COUNT(employee_leaves.id) * 100.0 / (SELECT COUNT(*) 
                                                        FROM employee_leaves 
                                                        WHERE leave_date >= '${year}-${month}-01' 
                                                        AND leave_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'), 2) as percentage
                FROM 
                    employee_leaves 
                INNER JOIN 
                    employees ON employee_leaves.id_employee = employees.id 
                INNER JOIN 
                    departments ON employees.id_department = departments.id 
                WHERE 
                    employee_leaves.leave_date >= '${year}-${month}-01' 
                    AND employee_leaves.leave_date <= '${year}-${month}-${getLastDayByMonth(month, year)}' 
                GROUP BY departments.id
            `;

            const data = await connection.query(query, {
                replacements: {}, // Reemplaza :userId con el valor real
                type: connection.QueryTypes.SELECT,
            });

            return data
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getEntriesByMonth(month, year) {
        try {
            const query = `
                SELECT
                    departments.name as label,
                    COUNT(employees.id) as total,
                    ROUND(
                        COUNT(employees.id) * 100.0 / (
                            SELECT
                                COUNT(*)
                            FROM
                                (
                                    SELECT
                                        employees.id
                                    FROM
                                        employees
                                        LEFT JOIN employee_reentries ON employee_reentries.id_employee = employees.id
                                    WHERE
                                        (
                                            employee_reentries.reentry_date >= '${year}-${month}-01'
                                            AND employee_reentries.reentry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                                        )
                                        OR (
                                            employees.entry_date >= '${year}-${month}-01'
                                            AND employees.entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                                        )
                                    UNION
                                    SELECT
                                        employees.id
                                    FROM
                                        employees
                                    WHERE
                                        employees.entry_date >= '${year}-${month}-01'
                                        AND employees.entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                                ) AS subquery
                        ),
                        2
                    ) as percentage
                FROM
                    employees
                    LEFT JOIN employee_reentries ON employee_reentries.id_employee = employees.id
                    INNER JOIN departments ON employees.id_department = departments.id
                WHERE
                    (
                        employee_reentries.reentry_date >= '${year}-${month}-01'
                        AND employee_reentries.reentry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                    )
                    OR (
                        employees.entry_date >= '${year}-${month}-01'
                        AND employees.entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                    )
                GROUP BY
                    departments.id
            `;

            const data = await connection.query(query, {
                replacements: {}, // Reemplaza :userId con el valor real
                type: connection.QueryTypes.SELECT,
            });

            return data
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getRecruitmentsByMonth(month, year) {
        try {
            const query = `
            WITH total_counts AS (
                SELECT 
                    (SELECT COUNT(*) FROM employees WHERE entry_date >= '${year}-${month}-01' AND entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}') 
                    + 
                    (SELECT COUNT(*) FROM employee_reentries WHERE reentry_date >= '${year}-${month}-01' AND reentry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}') 
                    AS total
            )
            
            SELECT
                recruitment_methods.name as label,
                COUNT(employees.id) as total,
                ROUND(
                    COUNT(employees.id) * 100.0 / (
                        SELECT total FROM total_counts
                    ), 2
                ) as percentage
            FROM
                employees
                INNER JOIN recruitment_methods ON employees.id_recruitment_method = recruitment_methods.id
            WHERE
                employees.entry_date >= '${year}-${month}-01'
                AND employees.entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
            GROUP BY
                recruitment_methods.id
            
            UNION ALL
            
            SELECT
                'Reingresos' as recruitment_method,
                COUNT(employee_reentries.id_employee) as total,
                ROUND(
                    COUNT(employee_reentries.id_employee) * 100.0 / (
                        SELECT total FROM total_counts
                    ), 2
                ) as percentage
            FROM
                employee_reentries
                INNER JOIN employees ON employee_reentries.id_employee = employees.id
            WHERE
                employee_reentries.reentry_date >= '${year}-${month}-01'
                AND employee_reentries.reentry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}';
            `;

            const data = await connection.query(query, {
                replacements: {}, // Reemplaza :userId con el valor real
                type: connection.QueryTypes.SELECT,
            });

            return data
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getValidationsByMonth(month, year) {
        try {
            const query = `
            SELECT
                departments.name as label,
                COUNT(employees.id) as total,
                ROUND(
                    COUNT(employees.id) * 100.0 / (
                        SELECT
                            COUNT(*)
                        FROM
                            employees
                        WHERE
                            entry_date >= '${year}-${month}-01'
                            AND entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                    ),
                    2
                ) as percentage
            FROM
                employees
                INNER JOIN departments ON employees.id_department = departments.id
            WHERE
                employees.entry_date >= '${year}-${month}-01'
                AND employees.entry_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
            GROUP BY
                departments.id;
            `;

            const data = await connection.query(query, {
                replacements: {}, // Reemplaza :userId con el valor real
                type: connection.QueryTypes.SELECT,
            });

            return data
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getTypeLeavesByMonth(month, year) {
        try {
            const query = `
                SELECT
                    type_leaves.name as label,
                    COUNT(employee_leaves.id) as total,
                    ROUND(
                        COUNT(employee_leaves.id) * 100.0 / (
                            SELECT
                                COUNT(*)
                            FROM
                                employee_leaves
                            WHERE
                                leave_date >= '${year}-${month}-01'
                                AND leave_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                        ),
                        2
                    ) as percentage
                FROM
                    employee_leaves
                    INNER JOIN type_leaves ON employee_leaves.id_type_leave = type_leaves.id
                WHERE
                    employee_leaves.leave_date >= '${year}-${month}-01'
                    AND employee_leaves.leave_date <= '${year}-${month}-${getLastDayByMonth(month, year)}'
                GROUP BY
                    type_leaves.id;
                `;

            const data = await connection.query(query, {
                replacements: {}, // Reemplaza :userId con el valor real
                type: connection.QueryTypes.SELECT,
            });

            return data
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getActiveTimesByMonth(month, year) {
        try {
            const leaves = await EmployeeLeaveModel.findAll({
                where: {
                    leave_date: {
                        [Op.gte]: new Date(`${year}-${month}-01`).setUTCHours(0),
                        [Op.lte]: new Date(`${year}-${month}-${getLastDayByMonth(month, year)}`).setUTCHours(0),
                    }
                }
            });

            const differenceDays = [];

            for (const leave of leaves) {
                const last_reentry = await EmployeeReentryModel.findOne({
                    where: {
                        id_employee: leave.id_employee,
                        reentry_date: {
                            [Op.lte]: new Date(leave.leave_date).setUTCHours(0),
                        }
                    },
                    order: [['reentry_date', 'DESC']],
                });

                let recently_reentry = '';

                if (!last_reentry) {
                    const employee = await EmployeeModel.findByPk(leave.id_employee);
                    recently_reentry = employee.entry_date;
                } else {
                    recently_reentry = last_reentry.reentry_date;
                }

                differenceDays.push(getDifferenceDaysBetweenDates(recently_reentry, leave.leave_date));
            }
            const response = []

            console.log(differenceDays)

            const firstParemeter = differenceDays.filter(x => x <= 29).length
            if (firstParemeter > 0) {
                response.push({
                    label: 'Menos de 1 mes',
                    total: firstParemeter,
                    percentage: (firstParemeter / differenceDays.length * 100).toFixed(2)
                })
            }

            const secondParemeter = differenceDays.filter(x => x >= 30 && x <= 119).length
            if (secondParemeter > 0) {
                response.push({
                    label: '1 a 3 meses',
                    total: secondParemeter,
                    percentage: (secondParemeter / differenceDays.length * 100).toFixed(2)
                })
            }

            const thirdParemeter = differenceDays.filter(x => x >= 120 && x <= 364).length
            if (thirdParemeter > 0) {
                response.push({
                    label: '4 a 11 meses',
                    total: thirdParemeter,
                    percentage: (thirdParemeter / differenceDays.length * 100).toFixed(2)
                })
            }

            const fourthParemeter = differenceDays.filter(x => x >= 365 && x <= 1459).length
            if (fourthParemeter > 0) {
                response.push({
                    label: '1 a 3 años',
                    total: fourthParemeter,
                    percentage: (fourthParemeter / differenceDays.length * 100).toFixed(2)
                })
            }

            const fifthParemeter = differenceDays.filter(x => x >= 1460).length
            if (fifthParemeter > 0) {
                response.push({
                    label: 'Más de 4 años',
                    total: fifthParemeter,
                    percentage: (fifthParemeter / differenceDays.length * 100).toFixed(2)
                })
            }

            return response;

        } catch (err) {
            throw new Error(err.message);
        }
    }

}

module.exports = AnalyticRepository;