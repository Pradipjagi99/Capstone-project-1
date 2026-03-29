-- EDA Q12 -- Can we identify anomalies in product sales or revenue performance?
-- ORDER LEVEL SALES--
SELECT 
    order_id,
    ROUND(SUM(sales_amount),2) AS order_total
FROM master_sales
GROUP BY order_id;


-- AVERAGE ORDER VALUE--
SELECT 
    ROUND(AVG(order_total),2) AS avg_order_value
FROM (
    SELECT 
        order_id,
        SUM(sales_amount) AS order_total
    FROM master_sales
    GROUP BY order_id
) t;


-- DETECT ANOMALIES--
SELECT 
    order_id, SUM(sales_amount) AS order_total
FROM
    master_sales
GROUP BY order_id
HAVING order_total > (SELECT 
        AVG(order_total) * 2
    FROM
        (SELECT 
            order_id, SUM(sales_amount) AS order_total
        FROM
            master_sales
        GROUP BY order_id) t)
ORDER BY order_total DESC;
