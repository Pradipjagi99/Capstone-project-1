-- EDA Q3--  Can we cluster customers based on total spend, order count, and preferred categories?
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_spent
FROM
    master_sales
GROUP BY customer_id , customer_name;


-- CUSTOMERS SEGMENTS
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_spent,
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
GROUP BY customer_id , customer_name
ORDER BY total_spent DESC;


-- high,low,medium value customer count
SELECT 
    customer_segment, COUNT(*) AS customer_count
FROM
    (SELECT 
        customer_id,
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
GROUP BY customer_segment;



