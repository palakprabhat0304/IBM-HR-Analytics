-- IBM HR Analytics: Data quality checks
-- PostgreSQL-compatible SQL

-- 1. Dataset size
SELECT COUNT(*) AS total_rows
FROM hr_employee;

-- 2. Duplicate employee IDs
SELECT EmployeeNumber, COUNT(*) AS employee_count
FROM hr_employee
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- 3. Missing values in important analysis fields
SELECT
    COUNT(*) - COUNT(EmployeeNumber) AS missing_employee_number,
    COUNT(*) - COUNT(Age) AS missing_age,
    COUNT(*) - COUNT(MonthlyIncome) AS missing_income,
    COUNT(*) - COUNT(JobRole) AS missing_job_role,
    COUNT(*) - COUNT(Department) AS missing_department,
    COUNT(*) - COUNT(OverTime) AS missing_overtime,
    COUNT(*) - COUNT(Attrition) AS missing_attrition,
    COUNT(*) - COUNT(YearsAtCompany) AS missing_tenure
FROM hr_employee;

-- 4. Categorical validation
SELECT DISTINCT Attrition FROM hr_employee ORDER BY Attrition;
SELECT DISTINCT OverTime FROM hr_employee ORDER BY OverTime;
SELECT DISTINCT Department FROM hr_employee ORDER BY Department;
SELECT DISTINCT JobRole FROM hr_employee ORDER BY JobRole;

-- 5. Numeric range checks
SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income,
    MIN(YearsAtCompany) AS min_years_at_company,
    MAX(YearsAtCompany) AS max_years_at_company
FROM hr_employee;

-- 6. Logical consistency checks
SELECT *
FROM hr_employee
WHERE YearsAtCompany > TotalWorkingYears;

SELECT *
FROM hr_employee
WHERE YearsInCurrentRole > YearsAtCompany;

SELECT *
FROM hr_employee
WHERE YearsWithCurrManager > YearsAtCompany;

-- 7. Optional whitespace inspection
SELECT '[' || OverTime || ']' AS overtime_value
FROM hr_employee
GROUP BY OverTime;
