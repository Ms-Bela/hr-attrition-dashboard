-- If you have a real attrition_date column: use EXTRACT(MONTH FROM attrition_date)
-- Here we use the deterministic synthetic month created earlier:
SELECT
  attrition_month_num AS month_num,
  FORMAT_DATE('%b', DATE(2024, attrition_month_num, 1)) AS month_abbr,
  COUNTIF(attrition_flag = 1) AS attrition_count
FROM i-breaker-415709.hr_analytics.hr_employees_curated
GROUP BY month_num, month_abbr
ORDER BY month_num;
