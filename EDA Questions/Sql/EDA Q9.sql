-- EDA Q9 -- What patterns exist in employee title and courtesy title distributions?
-- JOB TITLE DISTRIBUTION--
SELECT 
    title, COUNT(*) AS employee_count
FROM
    employee
GROUP BY title
ORDER BY employee_count DESC;


-- COURTESY TITLE DISTRIBUTION --
SELECT 
    title_of_courtesy,
    COUNT(*) AS employee_count
FROM employee
GROUP BY title_of_courtesy
ORDER BY employee_count DESC;