-- EDA Q6 -- How frequently do different customer segments place orders?
SELECT 
    customer_segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(total_orders) AS total_orders,
    AVG(total_orders) AS avg_orders_per_customer
FROM
    (SELECT 
        customer_id,
            COUNT(DISTINCT order_id) AS total_orders,
            SUM(sales_amount) AS total_spent,
            CASE
                WHEN
                    SUM(sales_amount) > 5000
                        AND COUNT(DISTINCT order_id) > 10
                THEN
                    'High Value'
                WHEN SUM(sales_amount) BETWEEN 2000 AND 5000 THEN 'Medium Value'
                ELSE 'Low Value'
            END AS customer_segment
    FROM
        master_sales
    GROUP BY customer_id) t
GROUP BY customer_segment
ORDER BY avg_orders_per_customer DESC;