-- EDA Q15 -- How do supplier pricing and categories relate across different regions?
SELECT 
    supplier_country,
    category_name,
    ROUND(AVG(unit_price),2) AS avg_price,
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price,
    COUNT(DISTINCT product_id) AS product_count
FROM master_sales
GROUP BY supplier_country, category_name
ORDER BY supplier_country, avg_price DESC;