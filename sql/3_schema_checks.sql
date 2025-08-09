-- Basic schema + row count
SELECT COUNT(*) AS row_count FROM `i-breaker-415709.hr_analytics.hr_employees`;

-- Peek columns
SELECT * FROM `i-breaker-415709.hr_analytics.hr_employees` LIMIT 50;

-- Data types
SELECT column_name, data_type
FROM `i-breaker-415709`.`hr_analytics`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = "hr_employees"
ORDER BY ordinal_position;
