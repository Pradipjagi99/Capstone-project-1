-- EDA Q11-- How does product demand change over months or seasons?
-- MONTHLY SALES TREND--
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales_amount), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM
    master_sales
GROUP BY YEAR(order_date) , MONTH(order_date)
ORDER BY year , month;


-- MONTH NAME --
SELECT 
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales_amount), 2) AS total_sales
FROM
    master_sales
GROUP BY MONTHNAME(order_date)
ORDER BY total_sales DESC;