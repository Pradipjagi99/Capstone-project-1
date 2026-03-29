-- EDA Q5 -- Are there any correlations between orders and customer location or product category?
SELECT 
    customer_country,
    category_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_sales
FROM
    master_sales
GROUP BY customer_country , category_name
ORDER BY customer_country , total_sales DESC;
 


 
SELECT 
    category_name, SUM(sales_amount) AS total_sales
FROM
    master_sales
GROUP BY category_name
ORDER BY total_sales DESC; 