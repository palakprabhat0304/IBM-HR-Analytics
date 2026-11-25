# Risk Scoring Methodology

## Purpose
A simple, transparent score that helps HR decide which employee groups to look at first for retention conversations. It is an **exploratory screening rule, not a validated predictive model**.

## Inputs and points
Chosen because each showed a clearly higher attrition rate in the single-factor analysis.

| Rule | Points | Single-factor attrition in that group |
|---|---:|---|
| OverTime = Yes | +2 | 30.53% vs 10.44% without overtime |
| YearsAtCompany < 2 | +2 | 34.88% (overall 16.12%) |
| JobSatisfaction = 1 | +1 | 22.84% |
| MonthlyIncome < 3000 | +1 | 28.61% |

Maximum score: 6. Overtime and short tenure are weighted 2 because they were the strongest single-factor signals; income and satisfaction are weighted 1. The weights are a judgement call, not fitted values.

## Categories
| Score | Category |
|---|---|
| 0-1 | Low Risk |
| 2-3 | Medium Risk |
| 4-6 | High Risk |

Cut-offs are project choices, not industry standards.

## SQL
See `sql/05_risk_score.sql`. Core expression:
```sql
CASE WHEN OverTime = 'Yes' THEN 2 ELSE 0 END +
CASE WHEN JobSatisfaction = 1 THEN 1 ELSE 0 END +
CASE WHEN MonthlyIncome < 3000 THEN 1 ELSE 0 END +
CASE WHEN YearsAtCompany < 2 THEN 2 ELSE 0 END
```
(PostgreSQL cannot use a SELECT alias in `ORDER BY CASE ...`, so the category is created in a CTE first.)

## Results (in-sample)
| Category | Employees | Share | Left | Attrition rate |
|---|---:|---:|---:|---:|
| High Risk | 103 | 7.01% | 56 | 54.37% |
| Medium Risk | 487 | 33.13% | 114 | 23.41% |
| Low Risk | 880 | 59.86% | 67 | 7.61% |

High Risk attrition is about 7.1 times Low Risk.

Attrition rate by individual score:

| Score | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|---|---:|---:|---:|---:|---:|---:|---:|
| Employees | 564 | 316 | 294 | 193 | 59 | 37 | 7 |
| Attrition rate | 5.9% | 10.8% | 18.4% | 31.1% | 42.4% | 67.6% | 85.7% |

The rate rises at every step, which supports the ordering of the score. Scores 5 and 6 contain only 44 employees combined, so those rates are unstable.

## Sensitivity check
Giving all four rules equal weight (1 each, 0-4) also separates attrition well (5.9% at 0 to 85.7% at 4, with only 7 employees at 4). The result does not depend on the 2/1/1/2 weights, though the exact category sizes change.

## Limitations
- **In-sample.** The rules were designed on the same data used to check them, so the 54.37% vs 7.61% gap overstates how well the score would work on new employees. No train/test split or cross-validation was done.
- **Overlapping factors.** Overtime, tenure, income and satisfaction are related to each other and to job role and age. The weights do not separate their individual effects.
- **Association, not cause.** A high score means an employee shares traits with past leavers, not that they will leave.
- **Small top group.** 103 High Risk employees (and 7 with a score of 6) make the high end volatile.
- **Snapshot.** No leave dates, so the score cannot say when someone might leave.
- **Fictional data.** Results show the method, not a real company.

## Responsible use
- Use only to prioritise supportive conversations (workload, pay review, onboarding), never for automated decisions about hiring, pay or dismissal.
- Age and gender are deliberately not inputs.
- Review the score against real outcomes before using it anywhere else.

## Next steps (if extended)
Logistic regression or a decision tree with a held-out test set and cross-validation; compare AUC against this rule; check results across gender and age groups for fairness.
