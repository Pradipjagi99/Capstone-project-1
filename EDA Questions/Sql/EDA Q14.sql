-- EDA Q14 -- How are suppliers distributed across different product categories?
-- SUPPLIERS PER CATEGORY--
SELECT 
    category_name,
    COUNT(DISTINCT supplier_id) AS total_suppliers,
    COUNT(DISTINCT product_id) AS total_products
FROM
    master_sales
GROUP BY category_name
ORDER BY total_suppliers DESC;


-- SUPPLIER CONTRIBUTION--
SELECT 
    supplier_name,
    category_name,
    COUNT(DISTINCT product_id) AS products_supplied
FROM
    master_sales
GROUP BY supplier_name , category_name
ORDER BY products_supplied DESC;