# IBM HR Analytics — Employee Attrition Portfolio

## Objective
Analyze employee attrition patterns and turn SQL-based analysis into an HR-focused business story. The project demonstrates data cleaning, SQL analysis, statistical reasoning, dashboard design, risk scoring, and business recommendations.

## Business Questions
- What is the overall employee attrition rate?
- Which departments and job roles have the highest attrition?
- How strongly is overtime associated with employee attrition?
- Which tenure groups are most at risk?
- Does monthly income differ between employees who leave and those who stay?
- Which factors are most strongly associated with attrition?
- How can HR use the findings without treating correlation as causation?

## Dataset
IBM HR Analytics Employee Attrition & Performance dataset from Kaggle.

The third-party CSV is intentionally not bundled. Place it at:

`data/raw/WA_Fn-UseC_-HR-Employee-Attrition.csv`

## Workflow
RAW DATA
→ DATA QUALITY CHECKS
→ CLEAN ANALYTICAL VIEW
→ ATTRITION BREAKDOWNS
→ CORRELATION / ASSOCIATION CHECKS
→ SIMPLE RISK-SCORING IDEA
→ POWER BI / TABLEAU DASHBOARD
→ BUSINESS RECOMMENDATIONS

## Project Structure
- `data/raw/` — original Kaggle CSV
- `data/cleaned/` — cleaned/derived dataset
- `sql/` — data quality, analytical view, attrition, correlation and risk-score SQL
- `excel/` — Excel analysis formulas
- `dashboard/` — one-page Power BI/Tableau layout and build guide
- `reports/` — business summary template
- `docs/` — data dictionary, cleaning checklist and methodology
- `linkedin/` — LinkedIn announcement draft
- `assets/` — screenshot placeholder

## Statistical Interpretation
The project uses descriptive statistics and correlations to identify associations. These results do not prove that a factor causes employees to leave.

## Key Findings
Populate this section after running the SQL analysis. Use actual project numbers rather than invented values.

Suggested format:
- Overall attrition: `XX.X%`
- Highest-risk department: `________ — XX.X%`
- Highest-risk role: `________ — XX.X%`
- Overtime difference: `XX.X% vs XX.X%`
- Highest-risk tenure band: `________ — XX.X%`
- Strongest association: `________ — correlation/association = X.XX`

## Dashboard
Add the final Power BI/Tableau screenshot here:

`assets/dashboard_screenshot.png`

## Recommendations
1. Prioritize retention interventions for the highest-risk roles and segments.
2. Review overtime concentration and workload balance.
3. Strengthen early-tenure onboarding, manager support and career progression.
4. Investigate compensation and satisfaction patterns where the data shows meaningful differences.

## Portfolio Takeaway
The goal is not simply to predict who will leave. It is to show how an analyst can move from messy employee data → evidence → visual story → practical HR action.
