-- Compact result set for portfolio documentation

-- Overall
SELECT
    ROUND(100.0 * AVG(attrition_flag), 2) AS overall_attrition_pct
FROM hr_employee_analysis;

-- Highest department
WITH dept AS (
    SELECT Department,
           ROUND(100.0 * AVG(attrition_flag), 2) AS attrition_pct
    FROM hr_employee_analysis
    GROUP BY Department
)
SELECT *
FROM dept
ORDER BY attrition_pct DESC
LIMIT 1;

-- Highest job role
WITH roles AS (
    SELECT JobRole,
           COUNT(*) AS employees,
           ROUND(100.0 * AVG(attrition_flag), 2) AS attrition_pct
    FROM hr_employee_analysis
    GROUP BY JobRole
)
SELECT *
FROM roles
WHERE employees >= 20
ORDER BY attrition_pct DESC
LIMIT 3;

-- Overtime comparison
SELECT
    OverTime,
    ROUND(100.0 * AVG(attrition_flag), 2) AS attrition_pct
FROM hr_employee_analysis
GROUP BY OverTime
ORDER BY attrition_pct DESC;
