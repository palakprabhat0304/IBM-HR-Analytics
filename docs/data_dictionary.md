# Data Dictionary

Source: IBM HR Analytics Employee Attrition & Performance (1,470 rows, 35 columns). Scale labels follow the published IBM guidance. The dataset is fictional.

## Original fields

| Field | Type | Values / description |
|---|---|---|
| Age | int | 18-60 years |
| Attrition | text | `Yes` = employee left, `No` = stayed (target field) |
| BusinessTravel | text | Non-Travel, Travel_Rarely, Travel_Frequently |
| DailyRate | int | Daily rate; unit not documented |
| Department | text | Sales, Research & Development, Human Resources |
| DistanceFromHome | int | 1-29; unit not documented |
| Education | int | 1 Below College, 2 College, 3 Bachelor, 4 Master, 5 Doctor |
| EducationField | text | Human Resources, Life Sciences, Marketing, Medical, Technical Degree, Other |
| EmployeeCount | int | Always 1 (constant, not used) |
| EmployeeNumber | int | Unique employee ID |
| EnvironmentSatisfaction | int | 1 Low, 2 Medium, 3 High, 4 Very High |
| Gender | text | Female, Male |
| HourlyRate | int | Hourly rate; unit not documented |
| JobInvolvement | int | 1 Low, 2 Medium, 3 High, 4 Very High |
| JobLevel | int | 1-5 seniority level |
| JobRole | text | Healthcare Representative, Human Resources, Laboratory Technician, Manager, Manufacturing Director, Research Director, Research Scientist, Sales Executive, Sales Representative |
| JobSatisfaction | int | 1 Low, 2 Medium, 3 High, 4 Very High |
| MaritalStatus | text | Single, Married, Divorced |
| MonthlyIncome | int | 1,009-19,999; currency not stated |
| MonthlyRate | int | Monthly rate; unit not documented |
| NumCompaniesWorked | int | Number of previous employers |
| Over18 | text | Always `Y` (constant, not used) |
| OverTime | text | `Yes` / `No` |
| PercentSalaryHike | int | Last salary increase, percent (11-25) |
| PerformanceRating | int | 1 Low, 2 Good, 3 Excellent, 4 Outstanding; only 3 and 4 occur |
| RelationshipSatisfaction | int | 1 Low, 2 Medium, 3 High, 4 Very High |
| StandardHours | int | Always 80 (constant, not used) |
| StockOptionLevel | int | 0-3 |
| TotalWorkingYears | int | Total years of work experience |
| TrainingTimesLastYear | int | Number of training sessions last year |
| WorkLifeBalance | int | 1 Bad, 2 Good, 3 Better, 4 Best |
| YearsAtCompany | int | Tenure at the company, in years |
| YearsInCurrentRole | int | Years in current role |
| YearsSinceLastPromotion | int | Years since last promotion |
| YearsWithCurrManager | int | Years with current manager |

## Derived fields (created in queries, not stored in the table)

| Field | Rule |
|---|---|
| age_group | Under 25; 25-34; 35-44; 45-54; 55+ |
| tenure_group | Less than 2 years (YearsAtCompany < 2); 2-5; 6-10; 11-20; More than 20 years |
| income_group | Below 3000; 3000-5999; 6000-9999; 10000-14999; 15000+ |
| attrition_flag | 1 if Attrition = 'Yes', else 0 (used for correlation) |
| risk_score | OverTime = Yes: +2; JobSatisfaction = 1: +1; MonthlyIncome < 3000: +1; YearsAtCompany < 2: +2. Range 0-6 |
| risk_category | 0-1 Low Risk; 2-3 Medium Risk; 4-6 High Risk |

## Metric definitions
- **Attrition rate** = employees who left / total employees in the group x 100.
- **Overall attrition rate** = 237 / 1,470 = 16.12%.
- **Overtime attrition rate** = overtime employees who left / all overtime employees = 127 / 416 = 30.53%. This is different from the share of the whole workforce who both worked overtime and left (8.64%).
