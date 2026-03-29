-- EDA Q13 -- Are there any regional trends in supplier distribution and pricing?
-- SUPPLIERS BY COUNTRY--
SELECT 
    supplier_country,
    COUNT(DISTINCT supplier_id) AS total_suppliers,
    COUNT(DISTINCT product_id) AS total_products
FROM
    master_sales
GROUP BY supplier_country
ORDER BY total_suppliers DESC;


-- PRICING BY REGION--
SELECT 
    supplier_country,
    ROUND(AVG(unit_price), 2) AS avg_price,
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price
FROM
    master_sales
GROUP BY supplier_country
ORDER BY avg_price DESC;
