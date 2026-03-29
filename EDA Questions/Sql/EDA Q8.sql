-- EDA Q8 -- What trends can we observe in hire dates across employee titles?
-- HIRES BY YEAR-- 
SELECT 
    YEAR(hire_date) AS hire_year, COUNT(*) AS total_hires
FROM
    employee
GROUP BY YEAR(hire_date)
ORDER BY hire_year;


-- HIRES BY TITLE OVER TIME-- 
SELECT 
    YEAR(hire_date) AS hire_year, title, COUNT(*) AS total_hires
FROM
    employee
GROUP BY YEAR(hire_date) , title
ORDER BY hire_year , total_hires DESC;