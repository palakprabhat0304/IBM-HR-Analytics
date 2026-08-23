-- Correlation / association analysis
-- PostgreSQL CORR() returns Pearson correlation.

SELECT
    CORR(Age, attrition_flag) AS age_attrition_corr,
    CORR(MonthlyIncome, attrition_flag) AS income_attrition_corr,
    CORR(TotalWorkingYears, attrition_flag) AS total_working_years_corr,
    CORR(YearsAtCompany, attrition_flag) AS tenure_attrition_corr,
    CORR(overtime_flag, attrition_flag) AS overtime_attrition_corr,
    CORR(JobSatisfaction, attrition_flag) AS job_satisfaction_corr,
    CORR(EnvironmentSatisfaction, attrition_flag) AS environment_satisfaction_corr,
    CORR(WorkLifeBalance, attrition_flag) AS work_life_balance_corr,
    CORR(JobInvolvement, attrition_flag) AS job_involvement_corr
FROM hr_employee_analysis;

-- Interpretation:
-- Larger absolute values indicate stronger linear association.
-- Correlation does NOT establish causation.
-- Binary 0/1 variables can be used to represent yes/no attributes.
