-- EDA Q10 -- Are there correlations between product pricing, stock levels, and sales performance?
-- PRODUCT LEVEL ANALYSIS--
SELECT 
    products.product_name,
    products.unit_price AS product_price,
    products.units_instock,
    SUM(master_sales.quantity) AS total_quantity_sold,
    ROUND(SUM(master_sales.sales_amount), 2) AS total_sales
FROM
    master_sales
        JOIN
    products ON master_sales.product_id = products.product_id
GROUP BY products.product_name , products.unit_price , products.units_instock
ORDER BY total_sales DESC;