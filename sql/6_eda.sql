-- Overall attrition rate
SELECT
  SUM(attrition_flag) AS attrition_count,
  COUNT(*) AS total_employees,
  SAFE_DIVIDE(SUM(attrition_flag), COUNT(*)) AS attrition_rate
FROM i-breaker-415709.hr_analytics.hr_employees_curated;

-- By department
SELECT
  department,
  SUM(attrition_flag) AS attrition_count,
  COUNT(*) AS employees,
  SAFE_DIVIDE(SUM(attrition_flag), COUNT(*)) AS attrition_rate
FROM i-breaker-415709.hr_analytics.hr_employees_curated
GROUP BY department
ORDER BY attrition_count DESC;

-- By gender x department
SELECT
  gender, department,
  SUM(attrition_flag) AS attrition_count
FROM i-breaker-415709.hr_analytics.hr_employees_curated
GROUP BY gender, department
ORDER BY gender, attrition_count DESC;

-- By tenure band
SELECT
  tenure_band,
  SUM(attrition_flag) AS attrition_count
FROM i-breaker-415709.hr_analytics.hr_employees_curated
GROUP BY tenure_band
ORDER BY
  CASE tenure_band
    WHEN '0-1' THEN 1 WHEN '2-5' THEN 2 WHEN '6-10' THEN 3
    WHEN '11-15' THEN 4 WHEN '16-20' THEN 5 ELSE 6 END;
