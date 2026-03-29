-- EDA Q7 -- What is the geographic and title-wise distribution of employees?
-- EMPLOYEES BY JOB TITLE-- 
SELECT 
    employee_title,
    COUNT(DISTINCT employee_id) AS employee_count
FROM master_sales
GROUP BY employee_title
ORDER BY employee_count DESC;

-- EMPLOYEES BY COUNTRY-- 
SELECT 
    employee.country,
    COUNT(*) AS employee_count
FROM employee 
GROUP BY employee.country
ORDER BY employee_count DESC;