# IBM HR Employee Attrition Analysis

SQL-first exploratory analysis of employee attrition in the IBM HR Analytics dataset, with an Excel workbook, a Power BI dashboard specification and a written report.

> **Status:** SQL analysis, Excel workbook and report are complete. The Power BI `.pbix` is built from `powerbi/powerbi_build_guide.md`; add the screenshot to `images/` once it is done.

## Business question
Which employees are leaving, and which working conditions are associated with leaving, so HR can focus retention effort where it matters?

## Dataset
- Source: IBM HR Analytics Employee Attrition & Performance (fictional data published by IBM data scientists).
- 1,470 employees, 35 fields, no missing values, no duplicate rows.
- `EmployeeCount`, `Over18` and `StandardHours` are constant and carry no information.
- Details: [`docs/data_dictionary.md`](docs/data_dictionary.md)

## Tools
PostgreSQL (analysis) · Excel (summary workbook, formulas) · Power BI (dashboard) · Python/matplotlib (report charts)

## Headline findings
Overall attrition: **237 of 1,470 employees left (16.12%)**.

| Finding | Result |
|---|---|
| Overtime vs non-overtime attrition | 30.53% vs 10.44% (about 2.9x) |
| Highest-attrition department | Sales, 20.63% (R&D lowest, 13.84%) |
| Highest-attrition job role | Sales Representative, 39.76% (n=83) |
| Highest-attrition age group | Under 25, 39.18% (n=97) |
| Tenure under 2 years | 34.88% vs 6.67% for 11-20 years |
| Monthly income below 3000 | 28.61% vs 3.76% for 15000+ |
| Job satisfaction 1 (low) | 22.84% vs 11.33% for satisfaction 4 |
| Rule-based High Risk group | 54.37% attrition vs 7.61% for Low Risk (in-sample) |

Correlations with attrition are weak: Age -0.159, MonthlyIncome -0.16, YearsAtCompany -0.134, OverTime (0/1) +0.246.

![Overtime](images/02_overtime.png)
![Job role](images/03_jobrole.png)

## Repository structure
```
sql/          numbered SQL scripts (01 data quality ... 06 executive results)
data/         source CSV (WA_Fn-UseC_-HR-Employee-Attrition.csv)
excel/        HR_Attrition_Analysis.xlsx (formula-driven summary sheets and charts)
powerbi/      build guide (DAX measures, page layout) and the .pbix once built
images/       charts and dashboard screenshot
docs/         data dictionary, methodology, recommendations, limitations
report/       final report PDF
```

## How to reproduce
1. Load the CSV into PostgreSQL as table `hr_employee` (column names as in the CSV).
2. Run the scripts in `sql/` in order.
3. Open `excel/HR_Attrition_Analysis.xlsx`; every figure recalculates from the `Data` sheet.

## Limitations (short version)
Associations, not causes. Single snapshot with no leave dates. Small groups (HR roles, age 55+) give unstable rates. The risk score is an exploratory rule set evaluated on the same data used to design it, so it is not a validated predictive model. See [`docs/limitations.md`](docs/limitations.md).
