# Power BI / Tableau Build Guide

## Measures
Create:
- Total Employees = COUNT(EmployeeNumber)
- Attrition Count = SUM(attrition_flag)
- Attrition Rate = Attrition Count / Total Employees
- Average Monthly Income = AVG(MonthlyIncome)

## Power BI
Recommended visuals:
- Card
- Clustered bar chart
- Column chart
- Matrix/table
- Slicers

Use a measure for Attrition Rate so all visuals respond to filters.

## Tableau
Recommended sheets:
1. KPI — Overall Attrition
2. Department Attrition
3. Job Role Attrition
4. Overtime Impact
5. Tenure Attrition
6. Driver Table

Combine them into one dashboard.

## Dashboard QA
Before publishing:
- Check totals against SQL.
- Verify filters affect every intended chart.
- Confirm percentages use the filtered denominator.
- Show employee counts.
- Check that role-level comparisons do not overinterpret tiny groups.
