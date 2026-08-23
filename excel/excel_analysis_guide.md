# Excel Analysis Guide

Convert the dataset into an Excel Table named `HR`.

## Overall attrition
`=COUNTIF(HR[Attrition],"Yes")/COUNTA(HR[EmployeeNumber])`

## Department attrition
If department is in A2:
`=COUNTIFS(HR[Department],A2,HR[Attrition],"Yes")/COUNTIF(HR[Department],A2)`

## Job role attrition
If role is in A2:
`=COUNTIFS(HR[JobRole],A2,HR[Attrition],"Yes")/COUNTIF(HR[JobRole],A2)`

## Overtime attrition
If overtime is in A2:
`=COUNTIFS(HR[OverTime],A2,HR[Attrition],"Yes")/COUNTIF(HR[OverTime],A2)`

## Average monthly income
Attrition:
`=AVERAGEIF(HR[Attrition],"Yes",HR[MonthlyIncome])`

Non-attrition:
`=AVERAGEIF(HR[Attrition],"No",HR[MonthlyIncome])`

## Tenure band
`=IFS([@YearsAtCompany]<=2,"0-2 Years",[@YearsAtCompany]<=5,"3-5 Years",[@YearsAtCompany]<=10,"6-10 Years",[@YearsAtCompany]<=15,"11-15 Years",TRUE,"16+ Years")`

## Flags
Attrition:
`=IF([@Attrition]="Yes",1,0)`

Overtime:
`=IF([@OverTime]="Yes",1,0)`

## Correlation
`=CORREL(HR[Age],HR[attrition_flag])`
`=CORREL(HR[MonthlyIncome],HR[attrition_flag])`
`=CORREL(HR[YearsAtCompany],HR[attrition_flag])`
`=CORREL(HR[overtime_flag],HR[attrition_flag])`

## Risk score
Example:
`=IF([@OverTime]="Yes",1,0)+IF([@YearsAtCompany]<=2,1,0)+IF([@JobSatisfaction]<=2,1,0)+IF([@WorkLifeBalance]<=2,1,0)`

Treat this as a transparent screening framework, not a prediction model.
