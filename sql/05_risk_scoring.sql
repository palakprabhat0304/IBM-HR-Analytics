-- Simple, transparent HR risk-scoring concept
-- This is NOT a machine-learning model.
-- It is a rule-based screening score built from observed risk signals.
--
-- Suggested starting signals:
-- 1 point: overtime
-- 1 point: tenure <= 2 years
-- 1 point: low job satisfaction (1 or 2)
-- 1 point: low work-life balance (1 or 2)
-- 1 point: belongs to a high-attrition role identified in analysis
--
-- IMPORTANT:
-- Replace the example role list below with roles confirmed by your own
-- attrition breakdown. Do not claim a 3x risk multiplier unless it is
-- actually calculated from the data.

WITH scored AS (
    SELECT
        *,
        (
            CASE WHEN overtime_flag = 1 THEN 1 ELSE 0 END
            +
            CASE WHEN YearsAtCompany <= 2 THEN 1 ELSE 0 END
            +
            CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END
            +
            CASE WHEN WorkLifeBalance <= 2 THEN 1 ELSE 0 END
            +
            CASE
                WHEN JobRole IN (
                    -- Replace with roles shown to have elevated attrition
                    'Sales Representative'
                ) THEN 1 ELSE 0
            END
        ) AS risk_score
    FROM hr_employee_analysis
)
SELECT
    risk_score,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM scored
GROUP BY risk_score
ORDER BY risk_score;

-- Compare high-score employees with the rest.
WITH scored AS (
    SELECT
        *,
        (
            CASE WHEN overtime_flag = 1 THEN 1 ELSE 0 END
            +
            CASE WHEN YearsAtCompany <= 2 THEN 1 ELSE 0 END
            +
            CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END
            +
            CASE WHEN WorkLifeBalance <= 2 THEN 1 ELSE 0 END
        ) AS risk_score
    FROM hr_employee_analysis
)
SELECT
    CASE WHEN risk_score >= 3 THEN 'High score (3+)' ELSE 'Lower score (0-2)' END AS risk_group,
    COUNT(*) AS employees,
    SUM(attrition_flag) AS attritions,
    ROUND(100.0 * SUM(attrition_flag) / COUNT(*), 2) AS attrition_rate_pct
FROM scored
GROUP BY 1;

-- To calculate a relative risk-style ratio:
-- high_group_rate / lower_group_rate
-- Only report "X times higher" after calculating it from the output.
