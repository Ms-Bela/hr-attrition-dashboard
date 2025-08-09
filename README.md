
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

## 📦 Repository Structure

```
hr-attrition-dashboard/
├─ data/
│  └─ hr_attrition_cleaned.csv
├─ images/
│  ├─ Dashboard 3.png
│  ├─ Age Band Distribution.png
│  ├─ Attrition by Gender.png
│  └─ Attrition by Department.png
├─ sql/
│  ├─ 1_create_dataset.sql
│  ├─ 2_load_table_from_gcs.sql
│  ├─ 3_schema_checks.sql
│  ├─ 4_nulls_and_quality.sql
│  ├─ 5_casts_and_features.sql
│  ├─ 6_eda.sql
│  └─ 7_attrition_by_month.sql
└─ README.md
```

> **BigQuery Namespace:** `i-breaker-415709.hr_analytics` (table: `hr_employees`)  
> Update to match your own project if different.

---

## 🧹 Data Cleaning & Feature Engineering

- Standardized column names and dropped non-analytic fields (employee_count, standard_hours, etc.).
- Created `attrition_flag` (Yes=1, No=0) and `tenure_band` buckets.
- Ensured categorical fields are strings (department, job_role, gender, cf_age_band, tenure_band, education_field).
- For monthly analysis, generated a **deterministic synthetic month** for leavers using employee fingerprinting (see `5_casts_and_features.sql`). Replace with real `attrition_date` if available.

---

## 🔍 SQL (BigQuery) — How to Reproduce

1. **Create Dataset**
   ```sql
   -- sql/1_create_dataset.sql
   CREATE SCHEMA IF NOT EXISTS `i-breaker-415709.hr_analytics`;
   ```

2. **Load Table**
   - Upload `data/hr_attrition_cleaned.csv` to Cloud Storage, then load into `i-breaker-415709.hr_analytics.hr_employees` via the BigQuery UI  
     *(or adapt `2_load_table_from_gcs.sql` to your environment).*

3. **Quality Checks & Features**
   - Run `3_schema_checks.sql` and `4_nulls_and_quality.sql` for sanity checks.
   - Run `5_casts_and_features.sql` to create `hr_employees_curated` with features like `attrition_month_num`.

4. **Exploratory Queries**
   - Use `6_eda.sql` for department/gender/tenure summaries.
   - Use `7_attrition_by_month.sql` for the month view driving the histogram/bar chart in Tableau.

> **Fully Qualified Names Used:** ``i-breaker-415709.hr_analytics.hr_employees`` and `i-breaker-415709.hr_analytics.hr_employees_curated`

---

## 📊 Dashboard Contents (Tableau)

### 1) KPIs
- **Total Employees** (COUNTD employee_number)
- **Attrition Count** (SUM attrition_flag)
- **Attrition Rate** (SUM(attrition_flag)/COUNT(employee_number))

### 2) Attrition by Department (Bar)
Highlights volume of exits across R&D, Sales, and HR. R&D shows the highest attrition count in this dataset snapshot.

### 3) Attrition by Gender × Department (Stacked Bar)
Reveals department–gender interaction. Useful to spot skew (e.g., male-dominant exits in specific roles).

### 4) Department Attrition per Age Group (Donut Small Multiples)
Five age bands (Under 25, 25–34, 35–44, 45–54, Over 55). Sales tends to dominate in younger bands; HR share increases with age group in the sample.

### 5) Job Level Distribution (Histogram)
Checks headcount distribution across job levels; skewed lower levels can artificially inflate attrition count in those bands.

### 6) Monthly Income vs Years at Company (Scatter)
Identifies potential compensation-tenure outliers among leavers (mark color = Attrition).

### 7) Attrition by Tenure Band (Bar)
Shows early-tenure vulnerability (0–1, 2–5 years) typical of onboarding/fit concerns.

> Images for quick preview are in `/images/`:
- `images/Dashboard 3.png`
- `images/Age Band Distribution.png`
- `images/Attrition by Gender.png`
- `images/Attrition by Department.png`

---

## 🧭 Interactivity (Filters)

Recommended dashboard filters:
- `Department`, `Job Role`, `Gender`
- `CF Age Band` (age groups), `Tenure Band`
- `Education Field`
- `Attrition` (Yes/No)
- `Attrition Month` (synthetic or real)

Apply filters to **“All Using This Data Source”** for a cohesive experience.

---

## 💡 Insights & Recommendations

**Findings (from the sample):**
- **R&D** and **Sales** show higher attrition volumes.
- **Early tenure** (0–1 and 2–5 years) accounts for a majority of exits.
- **Satisfaction signals** (work-life, relationship, environment) correlate with exits; low scores align with higher attrition clusters in scatter plots.

**Recommendations:**
1. **Strengthen onboarding & mentorship** in first 12 months; track cohort-level retention KPIs.
2. **Manager enablement**: target teams with low satisfaction scores; deploy pulse surveys + action plans.
3. **Role-specific retention levers**: for Sales (variable pay, territory fairness), for R&D (career path visibility, learning budgets).
4. **Compensation review**: boxplot income by role/tenure to flag inequities.
5. **Operationalize monitoring**: refresh dashboard monthly; add alerts when attrition rate exceeds threshold by department.

**Next Enhancements:**
- Replace synthetic month with **true attrition dates**.
- Add **survival analysis** (Kaplan–Meier) and **drivers modeling** (logistic regression or SHAP on tree models).
- Integrate **recruiting funnel** to connect exits with backfills and time-to-fill.

---

## 🚀 How to Use This Package

1. Clone or download the repo.
2. Load `data/hr_attrition_cleaned.csv` into BigQuery and/or directly into Tableau.
3. Open the Tableau Public link to explore:  
   https://public.tableau.com/app/profile/issabela.mkhonto/viz/HRATTRITIONANALYTICS_17546610780520/Dashboard3
4. (Optional) Rebuild the dashboard locally using the same fields and calculations documented above.

---

## 📝 License
MIT — free for educational and portfolio use. Replace or remove if needed.
