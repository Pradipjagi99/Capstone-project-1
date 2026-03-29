-- EDA Q1-- What is the average number of orders per customer?
SELECT 
    AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT 
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM master_sales
    GROUP BY customer_id
) t;

  -- Are there high-value repeat customers?-- 
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    round(SUM(sales_amount),2) AS total_spent
FROM master_sales
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC;

SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales_amount) AS total_spent
FROM master_sales
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT order_id) > 10
    AND SUM(sales_amount) > 5000
ORDER BY total_spent DESC;