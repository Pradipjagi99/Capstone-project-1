-- EDA Q4--  Which product categories or products contribute most to order revenue?
-- TOP PRODUCTS BY REVENUE--
SELECT 
    product_name, ROUND(SUM(sales_amount), 2) AS total_revenue
FROM
    master_sales
GROUP BY product_name
ORDER BY total_revenue DESC;


-- CATEGORY-WISE REVENUE-- 
SELECT 
    category_name, ROUND(SUM(sales_amount), 2) AS total_revenue
FROM
    master_sales
GROUP BY category_name
ORDER BY total_revenue DESC;


-- REVENUE CONTRIBUTION %--
SELECT 
    category_name,
    ROUND(SUM(sales_amount),2) AS total_revenue,
    ROUND(SUM(sales_amount) * 100.0 / (SELECT 
                    SUM(sales_amount)
                FROM
                    master_sales),
            2) AS contribution_percent
FROM
    master_sales
GROUP BY category_name
ORDER BY contribution_percent DESC;











