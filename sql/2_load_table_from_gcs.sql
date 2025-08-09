-- Load data from CSV in Cloud Storage into `i-breaker-415709.hr_analytics.hr_employees`
-- 1) Upload 'data/hr_attrition_cleaned.csv' to gs://<your-bucket>/hr/hr_attrition_cleaned.csv
-- 2) Then run this statement (replace <your-bucket>):
CREATE OR REPLACE TABLE `i-breaker-415709.hr_analytics.hr_employees`
OPTIONS(
  description="HR attrition cleaned table for dashboard"
) AS
SELECT * FROM EXTERNAL_QUERY(
  "project-id.US",  -- not used; keeping placeholder
  "SELECT 1"
);
-- NOTE: For production, prefer:
-- CREATE OR REPLACE TABLE `i-breaker-415709.hr_analytics.hr_employees`
-- AS SELECT * FROM `project.dataset.external_hr_attrition_cleaned`;
-- Or use the BigQuery UI to load the CSV. This file is a placeholder reminder.
