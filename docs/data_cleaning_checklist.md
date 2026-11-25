# Data Cleaning Checklist

Dataset: IBM HR Analytics Employee Attrition & Performance (`WA_Fn-UseC_-HR-Employee-Attrition.csv`), loaded as PostgreSQL table `hr_employee`.

Result: the data was already clean. No rows were removed and no values were changed. Checks were run on all 1,470 rows and 35 columns.

## Checks and results

| # | Check | How | Result | Action |
|---|---|---|---|---|
| 1 | Row and column count | `SELECT COUNT(*)` | 1,470 rows, 35 columns | None |
| 2 | Missing values | `COUNT(*) FILTER (WHERE col IS NULL)` per column | 0 nulls in every column | None |
| 3 | Duplicate rows | Compare full rows | 0 duplicates | None |
| 4 | Duplicate employee IDs | `COUNT(DISTINCT EmployeeNumber)` vs `COUNT(*)` | 1,470 distinct IDs (range 1-2068, gaps are normal) | None |
| 5 | Target values | `GROUP BY Attrition` | Only `Yes` (237) and `No` (1,233) | None |
| 6 | Categorical spelling and spaces | `DISTINCT` on all text columns; leading/trailing space test | No misspellings, no stray whitespace. 3 departments, 9 job roles, 3 travel types, 3 marital statuses, 6 education fields | None |
| 7 | Constant columns | `COUNT(DISTINCT col)` | `EmployeeCount` = 1, `Over18` = Y, `StandardHours` = 80 for every row | Kept in the table, excluded from analysis (no information) |
| 8 | Numeric ranges | `MIN`/`MAX` | Age 18-60; MonthlyIncome 1,009-19,999; YearsAtCompany 0-40; TotalWorkingYears 0-40; DistanceFromHome 1-29; PercentSalaryHike 11-25. All plausible, no negatives | None |
| 9 | Ordinal scales | `DISTINCT` per rating column | Education 1-5; JobLevel 1-5; Environment/Job/Relationship satisfaction, JobInvolvement, WorkLifeBalance 1-4; StockOptionLevel 0-3; PerformanceRating only 3 and 4 | None. Note: PerformanceRating has no 1 or 2 values |
| 10 | Logical consistency | Row-level comparisons | YearsAtCompany <= TotalWorkingYears for all rows; YearsInCurrentRole, YearsWithCurrManager and YearsSinceLastPromotion <= YearsAtCompany for all rows; Age minus TotalWorkingYears >= 14 for all rows | None |
| 11 | Outliers | Reviewed min/max and distributions | MonthlyIncome is right-skewed (typical for pay); no impossible values | Kept all rows; group by income bands instead of trimming |

## Decisions
- No imputation, deletion or capping was needed.
- `MonthlyIncome` has no stated currency, so values are used as given and never converted.
- Banded fields (age, tenure, income) are derived at query time with `CASE WHEN`; the source table is not modified. Band edges are in `data_dictionary.md`.
- Column names are used exactly as in the CSV.

## Not checked / caveats
- The dataset is fictional (published by IBM data scientists), so "clean" says nothing about real HR data quality.
- Units for `DailyRate`, `HourlyRate`, `MonthlyRate` and `DistanceFromHome` are not documented.

## Re-run
Run `sql/01_data_quality.sql`. The null check there shows two example columns; repeat it for every column, or generate the query from `information_schema.columns`.
