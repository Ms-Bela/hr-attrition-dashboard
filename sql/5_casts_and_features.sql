-- Example: ensure numeric types and create features
CREATE OR REPLACE TABLE i-breaker-415709.hr_analytics.hr_employees_curated AS
SELECT
  * EXCEPT(attrition),
  attrition,
  SAFE_CAST(attrition_flag AS INT64) AS attrition_flag_int,
  -- Deterministic synthetic month for attrition to support month charts (replace if you have real dates)
  CASE WHEN attrition_flag = 1 THEN
    MOD(ABS(FARM_FINGERPRINT(CAST(employee_number AS STRING))), 12) + 1
  END AS attrition_month_num,
  CASE WHEN attrition_flag = 1 THEN
    LPAD(CAST(MOD(ABS(FARM_FINGERPRINT(CAST(employee_number AS STRING))), 12) + 1 AS STRING),2,'0')
  END AS attrition_month_str
FROM `i-breaker-415709.hr_analytics.hr_employees`;
