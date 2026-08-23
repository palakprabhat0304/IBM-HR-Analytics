# Simple Attrition Risk-Scoring Methodology

## Purpose
Provide a transparent, non-ML way to turn observed risk signals into a portfolio-friendly screening concept.

## Example score
Award 1 point for each observed condition:
- Overtime = Yes
- YearsAtCompany <= 2
- JobSatisfaction <= 2
- WorkLifeBalance <= 2
- High-attrition job role identified from the descriptive analysis

Possible score: 0-5.

## Interpretation
- 0-1: lower observed risk-signal exposure
- 2: moderate signal exposure
- 3-5: higher signal exposure

These labels are not predictions.

## How to test the idea
Group employees by risk score and calculate:
`attrition_rate = attritions / employees`

Then compare:
`relative_risk = high_score_attrition_rate / lower_score_attrition_rate`

Only write claims such as "3x higher attrition" if the calculated rates actually support that number.

## Example business language
"Employees with multiple observed risk signals had a higher historical attrition rate than employees with fewer signals."

Avoid:
"This employee will leave."

## Why this is useful
It demonstrates how an analyst can translate statistical findings into an interpretable business framework without pretending to have built a predictive ML system.
