--LEAVES BY MONTH
SELECT
    departments.name as department,
    COUNT(employee_leaves.id) as total,
    ROUND(
        COUNT(employee_leaves.id) * 100.0 / (
            SELECT
                COUNT(*)
            FROM
                employee_leaves
            WHERE
                leave_date >= '2024-05-01'
                AND leave_date <= '2024-05-31'
        ),
        2
    ) as percentage
FROM
    employee_leaves
    INNER JOIN employees ON employee_leaves.id_employee = employees.id
    INNER JOIN departments ON employees.id_department = departments.id
WHERE
    employee_leaves.leave_date >= '2024-05-01'
    AND employee_leaves.leave_date <= '2024-05-31'
GROUP BY
    departments.id;

--ENTRY OR REENTRY BY MONTH
SELECT
    departments.name as department,
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
                            employee_reentries.reentry_date >= '2024-05-01'
                            AND employee_reentries.reentry_date <= '2024-05-31'
                        )
                        OR (
                            employees.entry_date >= '2024-05-01'
                            AND employees.entry_date <= '2024-05-31'
                        )
                    UNION
                    SELECT
                        employees.id
                    FROM
                        employees
                    WHERE
                        employees.entry_date >= '2024-05-01'
                        AND employees.entry_date <= '2024-05-31'
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
        employee_reentries.reentry_date >= '2024-05-01'
        AND employee_reentries.reentry_date <= '2024-05-31'
    )
    OR (
        employees.entry_date >= '2024-05-01'
        AND employees.entry_date <= '2024-05-31'
    )
GROUP BY
    departments.id;

--RECRUITMENT METHODS
WITH total_counts AS (
    SELECT
        (
            SELECT
                COUNT(*)
            FROM
                employees
            WHERE
                entry_date >= '2024-05-01'
                AND entry_date <= '2024-05-31'
        ) + (
            SELECT
                COUNT(*)
            FROM
                employee_reentries
            WHERE
                reentry_date >= '2024-05-01'
                AND reentry_date <= '2024-05-31'
        ) AS total
)
SELECT
    recruitment_methods.name as recruitment_method,
    COUNT(employees.id) as total,
    ROUND(
        COUNT(employees.id) * 100.0 / (
            SELECT
                total
            FROM
                total_counts
        ),
        2
    ) as percentage
FROM
    employees
    INNER JOIN recruitment_methods ON employees.id_recruitment_method = recruitment_methods.id
WHERE
    employees.entry_date >= '2024-05-01'
    AND employees.entry_date <= '2024-05-31'
GROUP BY
    recruitment_methods.id
UNION
ALL
SELECT
    'Reingreso' as recruitment_method,
    COUNT(employee_reentries.id_employee) as total,
    ROUND(
        COUNT(employee_reentries.id_employee) * 100.0 / (
            SELECT
                total
            FROM
                total_counts
        ),
        2
    ) as percentage
FROM
    employee_reentries
    INNER JOIN employees ON employee_reentries.id_employee = employees.id
WHERE
    employee_reentries.reentry_date >= '2024-05-01'
    AND employee_reentries.reentry_date <= '2024-05-31';