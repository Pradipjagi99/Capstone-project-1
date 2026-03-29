CREATE VIEW master_sales as
SELECT 
    orders.order_id,
    orders.order_date,
    orders.shipped_date,
    orders.freight,
    
    customers.customer_id,
    customers.company_name AS customer_name,
    customers.city AS customer_city,
    customers.country AS customer_country,
    
    employee.employee_id,
    CONCAT(employee.first_name, ' ', employee.last_name) AS employee_name,
    employee.title AS employee_title,
    
    order_details.product_id,
    order_details.unit_price,
    order_details.quantity,
    order_details.discount,
    
    (order_details.unit_price * order_details.quantity * (1 - order_details.discount)) AS sales_amount,
    
    products.product_name,
    products.category_id,
    products.supplier_id,
    
    categories.category_name,
    
    suppliers.company_name AS supplier_name,
    suppliers.country AS supplier_country

FROM orders 
JOIN customers  ON orders.customer_id = customers.customer_id
JOIN employee  ON orders.employee_id = employee.employee_id
JOIN order_details  ON orders.order_id = order_details.order_id
JOIN products  ON order_details.product_id = products.product_id
JOIN categories  ON products.category_id = categories.category_id
JOIN suppliers  ON products.supplier_id = suppliers.supplier_id;

select * from master_sales;