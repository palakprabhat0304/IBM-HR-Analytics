# One-Page HR Attrition Dashboard

## Canvas
Use a 16:9 desktop layout.

## Row 1 — KPI cards
Four cards across the top:
1. Overall Attrition Rate
2. Attrition Count
3. Total Employees
4. Average Monthly Income

## Row 2 — Main business view
LEFT (about 60% width):
### Attrition Rate by Department / Job Role
Horizontal bar chart.
- Axis: attrition rate %
- Category: department
- Optional drill-down: department → job role
- Sort descending
- Add data labels

RIGHT (about 40% width):
### Overtime Impact
Clustered bar:
- OverTime = Yes / No
- Metric = attrition rate
- Display the difference prominently

## Row 3 — Tenure and drivers
LEFT:
### Attrition Rate by Tenure Band
Column chart:
0-2, 3-5, 6-10, 11-15, 16+ years.

RIGHT:
### Top Attrition Signals
Ranked table:
Factor | Segment | Attrition Rate | Difference vs Overall

Potential factors:
- Overtime
- High-risk job roles
- Early tenure
- Low job satisfaction
- Low work-life balance

## Filters
Place a compact filter/slicer bar under the title:
- Department
- Job Role
- Tenure Band
- OverTime
- Job Level

## Design rules
- Use one consistent accent color for attrition.
- Keep neutral colors for comparison groups.
- Avoid pie charts for multiple categories.
- Show rates rather than only counts.
- Always display sample size when possible.
- Use tooltips for employee count and attrition count.

## Suggested dashboard title
"Employee Attrition: Who Is Leaving and Where Is the Risk?"

## Executive takeaway box
Reserve the bottom-right corner for 2-3 automatically updated sentences, such as:
"Overtime employees show X.X% attrition versus Y.Y% for non-overtime employees."
Only populate with actual calculated values.
