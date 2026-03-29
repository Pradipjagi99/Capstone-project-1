-- EDA Q2-- How do customer order patterns vary by city or country?
SELECT 
    customer_country,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    round(SUM(sales_amount),2) AS total_sales,
    round(AVG(sales_amount),2) AS avg_order_value
FROM master_sales
GROUP BY customer_country
ORDER BY total_sales DESC;