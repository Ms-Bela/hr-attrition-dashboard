-- Null profile per column
SELECT
  column_name,
  SUM(CASE WHEN t[col] IS NULL THEN 1 ELSE 0 END) AS nulls,
  COUNT(1) AS total_rows,
  SAFE_DIVIDE(SUM(CASE WHEN t[col] IS NULL THEN 1 ELSE 0 END), COUNT(1)) AS null_rate
FROM (
  SELECT * FROM `i-breaker-415709.hr_analytics.hr_employees`
) t,
UNNEST(REGEXP_EXTRACT_ALL(TO_JSON_STRING(t), r'"(.*?)":')) AS column_name,
UNNEST([column_name]) AS col
GROUP BY column_name, total_rows
ORDER BY null_rate DESC;

-- Numeric outlier sketch using Z-scores (example: monthly_income)
WITH stats AS (
  SELECT
    AVG(monthly_income) AS mean_income,
    STDDEV_SAMP(monthly_income) AS sd_income
  FROM `i-breaker-415709.hr_analytics.hr_employees`
)
SELECT
  e.employee_number,
  e.monthly_income,
  (e.monthly_income - s.mean_income) / NULLIF(s.sd_income,0) AS z_score
FROM `i-breaker-415709.hr_analytics.hr_employees` e, stats s
WHERE ABS((e.monthly_income - s.mean_income) / NULLIF(s.sd_income,0)) > 3
ORDER BY z_score DESC;
