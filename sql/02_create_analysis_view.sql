-- Analytical layer for dashboard and business analysis

CREATE OR REPLACE VIEW hr_employee_analysis AS
SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    JobLevel,
    JobSatisfaction,
    EnvironmentSatisfaction,
    WorkLifeBalance,
    JobInvolvement,
    MonthlyIncome,
    OverTime,
    Attrition,
    YearsAtCompany,
    TotalWorkingYears,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager,

    CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS attrition_flag,
    CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END AS overtime_flag,

    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        WHEN YearsAtCompany <= 15 THEN '11-15 Years'
        ELSE '16+ Years'
    END AS tenure_band

FROM hr_employee;
