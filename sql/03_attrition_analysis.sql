-- Core attrition analysis

-- Overall attrition
SELECT
    COUNT(*) AS total_employees,
    SUM(attrition_flag) AS attrition_count,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_analysis;

-- Department
SELECT
    Department,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_analysis
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- Job role
SELECT
    JobRole,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_analysis
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Overtime
SELECT
    OverTime,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_analysis
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;

-- Tenure
SELECT
    tenure_band,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_analysis
GROUP BY tenure_band
ORDER BY
    CASE tenure_band
        WHEN '0-2 Years' THEN 1
        WHEN '3-5 Years' THEN 2
        WHEN '6-10 Years' THEN 3
        WHEN '11-15 Years' THEN 4
        ELSE 5
    END;

-- Average income
SELECT
    Attrition,
    COUNT(*) AS employees,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM hr_employee_analysis
GROUP BY Attrition;
