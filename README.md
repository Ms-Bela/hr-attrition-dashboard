
# HR Attrition Analytics — Tableau Portfolio Package

**Owner:** Issabela Mkhonto  
**Data Source:** `data/hr_attrition_cleaned.csv` (IBM HR dataset variant, cleaned)  
**BI:** Tableau Public  
**Link to Live Dashboard:** https://public.tableau.com/app/profile/issabela.mkhonto/viz/HRATTRITIONANALYTICS_17546610780520/Dashboard3

---

## 🎯 Business Problem

Employee turnover increases recruitment cost, disrupts projects, and erodes institutional knowledge. Leaders need to quickly identify **where** attrition happens (departments, roles, tenure, demographics), **why** it happens (satisfaction, work–life balance, income), and **when** it happens (seasonality) to act proactively.

**Goal:** Build an executive dashboard that surfaces attrition hotspots and drivers so HR can prioritize interventions and monitor impact.

---

📌 Project Overview
The HR Attrition Analytics Dashboard is an interactive business intelligence tool designed to analyze employee turnover trends and patterns.
It provides HR leaders with insights into who is leaving, from where, and why, helping them implement targeted retention strategies.

Built with:

BigQuery (for data preparation & SQL analysis)

Tableau (for visualization & interactivity)

IBM HR Analytics dataset (cleaned & structured)
--

Linking attrition trends to satisfaction and engagement metrics.
---
✅ Solution
A data-driven dashboard that:

Monitors attrition KPIs: Attrition rate, total employees, total exits.

Highlights hotspots: By department, job role, gender, age band, and tenure.

Reveals trends: Attrition over time, income vs tenure patterns.

Supports drill-down: Interactive filters for exploring specific segments.
---
📊 Key Visualizations
KPI Cards
Attrition Rate — % of employees leaving.

Total Employees — Current workforce size.

Attrition Count — Total number of leavers.

Attrition by Department
Bar chart comparing departments — reveals R&D and Sales have the highest attrition.

Attrition by Gender × Department
Stacked bar chart showing gender-specific attrition patterns within each department.

Attrition by Tenure Band
Highlights early-tenure vulnerability (0–1 and 2–5 years).

Department Attrition per Age Group
Donut charts showing department-level attrition across five age groups.

Job Level Distribution
Histogram illustrating headcount distribution by job level.

Monthly Income vs Years at Company
Scatter plot identifying compensation and tenure outliers among leavers.
---
🧹 Data Preparation
Steps in BigQuery
Load cleaned dataset (hr_attrition_cleaned.csv) into:
i-breaker-415709.hr_analytics.hr_employees

Data cleaning:

Standardize column names.

Remove irrelevant fields (employee_count, standard_hours).

Create calculated fields:

attrition_flag (Yes=1, No=0)

tenure_band (bucketed years at company)

Feature engineering:

Synthetic attrition_month for month-level trend analysis (replace with real attrition dates if available).
---
🧭 Interactivity & Filters
Dashboard includes:

Department

Job Role

Gender

Age Band

Tenure Band

Education Field

Attrition Status

Attrition Month

Filters are applied to all worksheets for a unified interactive experience.

---

💡 Insights
R&D and Sales lead in attrition counts.

Early-tenure employees are at highest risk.

Low satisfaction scores correlate with higher exits.

📌 Recommendations
Onboarding & Mentorship — Focus retention efforts on employees in their first 1–2 years.

Targeted Interventions — Address job satisfaction in high-turnover departments.

Compensation Review — Investigate pay disparities affecting retention.

Ongoing Monitoring — Refresh dashboard monthly and set alerts for attrition spikes.
---

🚀 How to Use
Clone this repository.

Load hr_attrition_cleaned.csv into BigQuery.

Run scripts in /sql to prepare tables.

Open the Tableau dashboard using the provided public link or recreate it locally.

----

📝 License
MIT License — Free for educational and portfolio use.
---

## 🚀 How to Use This Package

1. Clone or download the repo.
2. Load `data/hr_attrition_cleaned.csv` into BigQuery and/or directly into Tableau.
3. Open the Tableau Public link to explore:  
   https://public.tableau.com/app/profile/issabela.mkhonto/viz/HRATTRITIONANALYTICS_17546610780520/Dashboard3
4. (Optional) Rebuild the dashboard locally using the same fields and calculations documented above.

---

