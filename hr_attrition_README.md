# HR Employee Attrition Analysis — SQL Project

## Project Overview
This project analyzes IBM HR employee data using SQL to understand why employees leave the company.
The dataset was split into two tables to practice JOIN operations and explore attrition patterns across departments, age groups, salary levels, and performance ratings.

---

## Dataset
- Total Rows: 1,470
- Source: [Kaggle – IBM HR Analytics Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

## Tables Created
- employee_info — EmployeeNumber, Age, Gender, Department, JobRole, MaritalStatus, EducationField, BusinessTravel
- employee_performance — EmployeeNumber, MonthlyIncome, JobSatisfaction, PerformanceRating, Attrition, OverTime, YearsAtCompany, WorkLifeBalance, PercentSalaryHike

---

## Tool Used
- SQLite (sqliteonline.com)

---

## Business Questions Answered

**Attrition Analysis**
- Q1: How many employees left the company vs stayed?
- Q2: Which department has the highest attrition rate?
- Q3: Do employees who work overtime leave more?

**Salary & Job Analysis**
- Q4: Which job role has the highest average monthly income?
- Q5: Which department has the highest average salary?

**Employee Demographics**
- Q6: Which age group has the highest attrition?
- Q7: Does marital status affect attrition?

**Satisfaction & Performance**
- Q8: What is the average job satisfaction by department?
- Q9: Do higher performing employees get better salary hikes?

**Experience Analysis**
- Q10: Do employees with more years at company earn more?

---

## Key Findings

- Out of 1,470 employees, **237 left** the company while **1,233 stayed**
- **Research & Development** has the highest attrition with **133 employees** leaving
- Employees working **overtime are more likely to leave** (127 vs 110)
- **Managers** earn the highest average monthly income of **17,181.68**
- **Sales department** has the highest average salary of **6,959.17**
- The **26-35 age group** has the highest attrition with **116 employees** leaving
- **Single employees** leave the most (120), compared to Married (84) and Divorced (33)
- All departments have the **same average job satisfaction score of 3**
- Employees with **performance rating 4** receive an average salary hike of **22%** vs 14% for rating 3
- Salary **generally increases** with years spent at the company

---

## Files in this Repository

- `walmart_analysis.sql` — Walmart Sales Data Analysis
- `ecommerce_analysis.sql` — E-Commerce Customer Behavior Analysis
- `hr_attrition_analysis.sql` — HR Employee Attrition Analysis
- `README.md` — Project documentation and findings
