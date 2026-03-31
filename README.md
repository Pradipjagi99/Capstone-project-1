# 🚢 Northwind Traders Sales Analysis Project Excel, SQL & Power Bi

 The Northwind Traders Sales Analysis Project analysed using Excel, SQL & Power Bi to uncover insights related to sales, customers, products, employees, and suppliers. The goal is to transform raw data into meaningful dashboards for decision-making. This dashboard provides insights into customer behavior, sales trends, product performance, and employee analysis. This project involves Customers Analysis, Sales Analysis, Products Analysis, Orders & Shipping Analysis, Employees Analysis, Suppliers Analysis, Geographic Analysis.

## 🎥 Demo

![Alt Text](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/northwind%20sales%20dashboard%20demo.gif)

> [!NOTE]
> Click the dropdown list below for more information on SQL or Power BI.

---

<details>
<summary>SQL 📊</summary>

# 🚢 Northwind Traders Sales Analysis SQL Project

## 📂 Introduction to the Database

This project involves analyzing the Northwind Traders dataset using Power BI to uncover insights related to sales, customers, products, employees, and suppliers. The database contains various tables (e.g., `customers`, `products`, `employees`, and `suppliers`) that store information about customer insights, sales and order insights, employee insights, product insights and supplier insights.
The main objective of this project is to extract meaningful insights and statistics using SQL queries. This document showcases a set of queries to answer specific analytical questions about the sales performance and customer behavior.

### 🛠️ How the Database Works

- **📊 Tables**: The database is primarily focused on the `northwind_traders_analysis` , which contains the following key tables:

- `categories`: Contains customer id an with respective company names.
- `customers`: It contains contact details with address according to region.
- `employee`: This table contains the details of employees their respective roles along with the who they report their task.
- `order_details`: Order details table contains the required information about order id, product id, price, quantity and discount.
- `orders`: Here the table consists of when the order placed, shipped and delivered along with the address details.
- `products`: In the products table, by which the supplier did the customer received the product and what is the product the customer received along with that the stocks of the product.
- `shippers`: Here the details of shipper company is mentioned.
- `suppliers`: In this is the details of supplier details along with who did they delivered with their respective address.

- **🔍 Views**: This document includes SQL `CREATE VIEW` statements to predefine specific datasets and make querying simpler for repetitive tasks.
 
- **📈 Key Insights**: Using SQL, we retrieve data that helps us answer questions such as:
  - Average number of orders per customer.
  -  high,low,medium value customer.
  -  Top products by revenue along with the contribution.
  -  Monthly sales trend
  -  Average orders along with anomalies.
  -  Supplier contribution according to the categories.
  -  Pricing according different region and country.

---

## 🏗️ Database Setup


```sql
CREATE DATABASE northwind_traders_analysis;
USE northwind_traders_analysis;
```

## 📂 Importing Data into MySQL Workbench

To work with the database, we first need to import the data from the `northwind_traders_analysis` file into MySQL Workbench. Follow these steps:

1. **Open MySQL Workbench**:

   - Launch MySQL Workbench and connect to your database server.

2. **Select the Database**:

   - Use the `northwind_traders_analysis` database by running:
     ```sql
     USE northwind_traders_analysis;
     ```

3. **Go to the Import Section**:

   - Click on the "Server" menu and select "Data Import."

4. **Choose the CSV File**:

   - In the "Import" tab, choose the `categories.csv` file as the source.
   - Ensure the "Import Data from File" option is selected.

5. **Map the Table**:

   - Select the destination table (`categories`).
   - Map the CSV columns to the corresponding table columns.

6. **Run the Import**:

   - Click on "Start Import."

7. **Verify the Data**:
   - After importing, verify the data using:
     ```sql
     SELECT * FROM  categories;
     ```

Same process for all the other tables as well.

---
  
## 📜 SQL Queries & Answers

### 1️⃣ What is the average number of orders per customer?

**📝 Query:**

```sql
SELECT 
    AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT 
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM master_sales
    GROUP BY customer_id
) t;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q1.png)

---

### 2️⃣ How do customer order patterns vary by city or country?

**📝 Query:**

```sql
SELECT 
    customer_country,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    round(SUM(sales_amount),2) AS total_sales,
    round(AVG(sales_amount),2) AS avg_order_value
FROM master_sales
GROUP BY customer_country
ORDER BY total_sales DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q2.png)

---

### 3️⃣ Can we cluster customers based on total spend, order count, and preferred categories?

**📝 Query:**

```sql
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_spent
FROM
    master_sales
GROUP BY customer_id , customer_name;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q3.1.png)

---

### 3️⃣ CUSTOMERS SEGMENTS

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q3.2.png)

---

### 3️⃣ high,low,medium value customer count

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q3.3.png)

---

### 4️⃣ Which product categories or products contribute most to order revenue?(TOP PRODUCTS BY REVENUE)

**📝 Query:**

```sql
SELECT 
    product_name, ROUND(SUM(sales_amount), 2) AS total_revenue
FROM
    master_sales
GROUP BY product_name
ORDER BY total_revenue DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q4.1.png)

---

### 4️⃣ CATEGORY-WISE REVENUE

**📝 Query:**

```sql
SELECT 
    category_name, ROUND(SUM(sales_amount), 2) AS total_revenue
FROM
    master_sales
GROUP BY category_name
ORDER BY total_revenue DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q4.2.png)

---

### 4️⃣ REVENUE CONTRIBUTION %

**📝 Query:**

```sql
SELECT 
    category_name,
    ROUND(SUM(sales_amount),2) AS total_revenue,
    ROUND(SUM(sales_amount) * 100.0 / (SELECT 
                    SUM(sales_amount)
                FROM
                    master_sales),
            2) AS contribution_percent
FROM
    master_sales
GROUP BY category_name
ORDER BY contribution_percent DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q4.3.png)

---

### 5️⃣ Are there any correlations between orders and customer location or product category?

**📝 Query:**

```sql
SELECT 
    customer_country,
    category_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales_amount), 2) AS total_sales
FROM
    master_sales
GROUP BY customer_country , category_name
ORDER BY customer_country , total_sales DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q5.1.png)

---

### 5️⃣ country based total sales

**📝 Query:**

```sql
SELECT 
    category_name, SUM(sales_amount) AS total_sales
FROM
    master_sales
GROUP BY category_name
ORDER BY total_sales DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q5.2.png)

---

### 6️⃣ How frequently do different customer segments place orders?

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q6.png)

---

### 7️⃣  What is the geographic and title-wise distribution of employees?(EMPLOYEES BY JOB TITLE)

**📝 Query:**

```sql
SELECT 
    employee_title,
    COUNT(DISTINCT employee_id) AS employee_count
FROM master_sales
GROUP BY employee_title
ORDER BY employee_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q7.1.png)

---

### 7️⃣ EMPLOYEES BY COUNTRY

**📝 Query:**

```sql
SELECT 
    employee.country,
    COUNT(*) AS employee_count
FROM employee 
GROUP BY employee.country
ORDER BY employee_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q7.2.png)

---

### 8️⃣ What trends can we observe in hire dates across employee titles?(HIRES BY YEAR)

**📝 Query:**

```sql
SELECT 
    YEAR(hire_date) AS hire_year, COUNT(*) AS total_hires
FROM
    employee
GROUP BY YEAR(hire_date)
ORDER BY hire_year;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q8.1.png)

---

### 8️⃣ HIRES BY TITLE OVER TIME

**📝 Query:**

```sql
SELECT 
    YEAR(hire_date) AS hire_year, title, COUNT(*) AS total_hires
FROM
    employee
GROUP BY YEAR(hire_date) , title
ORDER BY hire_year , total_hires DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q8.2.png)

---

### 9️⃣ What patterns exist in employee title and courtesy title distributions?(JOB TITLE DISTRIBUTION)

**📝 Query:**

```sql
SELECT 
    title, COUNT(*) AS employee_count
FROM
    employee
GROUP BY title
ORDER BY employee_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q9.1.png)

---

### 9️⃣ COURTESY TITLE DISTRIBUTION

**📝 Query:**

```sql
SELECT 
    title_of_courtesy,
    COUNT(*) AS employee_count
FROM employee
GROUP BY title_of_courtesy
ORDER BY employee_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q9.2.png)

---

### 🔟 Are there correlations between product pricing, stock levels, and sales performance?(PRODUCT LEVEL ANALYSIS)

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q10.png)

---

### 1️⃣1️⃣ How does product demand change over months or seasons?(MONTHLY SALES TREND)

**📝 Query:**

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales_amount), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM
    master_sales
GROUP BY YEAR(order_date) , MONTH(order_date)
ORDER BY year , month;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q11.1.png)

---

### 1️⃣1️⃣ MONTH NAME ANALYSIS

**📝 Query:**

```sql
SELECT 
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales_amount), 2) AS total_sales
FROM
    master_sales
GROUP BY MONTHNAME(order_date)
ORDER BY total_sales DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q11.2.png)

---

### 1️⃣2️⃣ Can we identify anomalies in product sales or revenue performance?(ORDER LEVEL SALES)

**📝 Query:**

```sql
SELECT 
    order_id,
    ROUND(SUM(sales_amount),2) AS order_total
FROM master_sales
GROUP BY order_id;
```

**📊 Answer:** 

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q12.1.png)

---

### 1️⃣2️⃣ AVERAGE ORDER VALUE

**📝 Query:**

```sql
SELECT 
    ROUND(AVG(order_total),2) AS avg_order_value
FROM (
    SELECT 
        order_id,
        SUM(sales_amount) AS order_total
    FROM master_sales
    GROUP BY order_id
) t;
```

**📊 Answer:** 

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q12.2.png)

---

### 1️⃣2️⃣ DETECT ANOMALIES

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q12.3.png)

---

### 1️⃣3️⃣  Are there any regional trends in supplier distribution and pricing?(SUPPLIERS BY COUNTRY)

**📝 Query:**

```sql
SELECT 
    supplier_country,
    COUNT(DISTINCT supplier_id) AS total_suppliers,
    COUNT(DISTINCT product_id) AS total_products
FROM
    master_sales
GROUP BY supplier_country
ORDER BY total_suppliers DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q13.1.png)

---

### 1️⃣3️⃣ PRICING BY REGION

**📝 Query:**

```sql
SELECT 
    supplier_country,
    ROUND(AVG(unit_price), 2) AS avg_price,
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price
FROM
    master_sales
GROUP BY supplier_country
ORDER BY avg_price DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q13.2.png)

---

### 1️⃣4️⃣ How are suppliers distributed across different product categories?(SUPPLIERS PER CATEGORY)

**📝 Query:**

```sql
SELECT 
    category_name,
    COUNT(DISTINCT supplier_id) AS total_suppliers,
    COUNT(DISTINCT product_id) AS total_products
FROM
    master_sales
GROUP BY category_name
ORDER BY total_suppliers DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q14.1.png)

---

### 1️⃣4️⃣ SUPPLIER CONTRIBUTION

**📝 Query:**

```sql
SELECT 
    supplier_name,
    category_name,
    COUNT(DISTINCT product_id) AS products_supplied
FROM
    master_sales
GROUP BY supplier_name , category_name
ORDER BY products_supplied DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q14.2.png)

---

### 1️⃣5️⃣ How do supplier pricing and categories relate across different regions?

**📝 Query:**

```sql
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
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/SQL%20images/EDA%20Q15.png)

---

## File Details 📁

- **File Name**: `northwind_categories.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_categories.sql)
- **File Name**: `northwind_customers.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_customers.sql)
- **File Name**: `northwind_employees.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_employees.sql)
- **File Name**: `northwind_order details.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_order%20details.sql)
- **File Name**: `northwind_orders.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_orders.sql)
- **File Name**: `northwind_products.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_products.sql)
- **File Name**: `northwind_shippers.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_shippers.sql)
- **File Name**: `northwind_suppliers.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/northwind_suppliers.sql)
- **File Name**: `master_sales.sql` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Data/sql/master_sales.sql)

</details>

---

<details>
    <summary>Power BI 📈</summary>

# 🚢 Northwind Traders Sales Analysis in Power BI 📊

This Power BI project provides a comprehensive analysis of Northwind Traders Sales Analysis and suppliers data along with that focusing on trend of category sales, shipping days and key performance indicators(KPIs) to identify and insights.

## ✨ Key Features

📌 **Customer Insights**: Major customers are concentrated in EUROPE and NORTH AMERICA.

📌 **Sales & Orders Insights**: Sales show consistent growth over time. Order volume increases with sales trend. Certain categories contribute major revenue. Peak sales observed in specific periods.

📌 **Employee Insights**: Employees are distributed across multiple roles. Majority have moderate tenure (mid-level experience). Clear hierarchical reporting structure exists.

📌 **Product Insights**: Few products contribute significantly to total sales. Certain categories dominate revenue. High demand products drive overall performance. Pricing varies across suppliers and products.

📌 **Supplier Insights**: Some suppliers provide more products than others. Pricing varies significantly across suppliers. Suppliers are distributed across multiple regions. Certain suppliers dominate specific product categories.

---

![App Screenshot](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/customer%20analysis.png)

---

## 🛠️ Tools Used:

**Power BI**: For creating dashboards, visualizations, and interactive reports.

**SQL**: For querying, aggregating, and preparing data for analysis.

**Excel/CSV**: For preprocessing and cleaning raw data.

## 🚀 Steps in Project

✔️ Requirement Gathering / Business Requirements

✔️ Data Extraction

✔️ Data Walkthrough

✔️ Data Cleaning

✔️ Data Modeling

✔️ DAX Calculations

✔️ Dashboard Layout Design

✔️ Chart Development and Formatting

✔️ Dashboard / Report Development

✔️ Insights Generation

✔️ Report Presentation

## 🧑‍💼 Business Requirement

The objective of this Power BI report is to create a visually appealing and user-friendly dashboard that communicates key performance metrics for Northwind Traders effectively. The report aims to generate insights into customer behavior, sales patterns, and employee performance to aid decision-making processes. It will cover sales analysis, customer segmentation, inventory trends, and employee performance, consolidating data from multiple tables for a comprehensive view of the company's operations. The report will empower stakeholders to make data-driven decisions by offering valuable insights and facilitating data exploration through interactive visualizations and dynamic filters. The expected impact is to revolutionize how Northwind Traders interacts with its data, enabling the company to remain competitive and drive its business forward in the wholesale market landscape.

## 📈 KPI’s Requirements

**1. Total Sales:** The overall revenue generated from all items sold.

**2. Average Sales:** The average revenue per sale.

**3. Top Products:** The top sales performing products.

**4. Average Shipping Days:** The average number of days to ship the product.

## 📊 Chart’s Requirements

<ol>  
<h3><li>  Customer Analysis 📅</li></h3>  
<ul>  
  <li> Customers are concentrated in Europe and North America.</li>  
  <li> Majority belongs to a specific roles like sales represantative.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/customer%20analysis.png"  />
</div>
</ul>

<h3><li> Sales Analysis 📈</li></h3>  
<ul>  
  <li> Sales show consistent growth over time. </li>
  <li> Order volume increases with sales trend. </li>
  <li> Certain categories contribute major revenue. </li>
  <li> Peak sales observed in specific periods. </li>  
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/sales%20analysis.png"  />
</div>
</ul>

<h3><li> Employee Analysis 🧑‍💼</li></h3>  
<ul>  
  <li> Employees are distributed across multiple roles. </li>
  <li> Majority have moderate tenure (mid-level experience). </li>
  <li> Clear hierarchical reporting structure exists. </li>
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/employee%20analyis.png"  />
</div>
</ul>

<h3><li> Product Analysis 📦</li></h3>  
<ul>  
  <li> Few products contribute significantly to total sales. </li>
  <li> Certain categories dominate revenue. </li>
  <li> High demand products drive overall performance. </li>
  <li> Pricing varies across suppliers and products. </li>
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/product%20analysis.png"  />
</div>
</ul>

<h3><li> Supplier Analysis 🚚</li></h3>  
<ul>  
  <li> Some suppliers provide more products than others. </li>
  <li> Pricing varies significantly across suppliers. </li>
  <li> Suppliers are distributed across multiple regions. </li>
  <li> Certain suppliers dominate specific product categories. </li>
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Images/Power%20Bi/supplier%20analysis.png"  />
</div>
</ul>

## Dashboard Insights

### Key Insights 🔑: 

1. **Customer Insights 🙋‍♂️**: Major customers are concentrated in EUROPE and NORTH AMERICA.
2. **Sales & Orders Insights 📈**: Sales show consistent growth over time. Order volume increases with sales trend. Certain categories contribute major revenue. Peak sales observed in specific periods.
3. **Employee Insights 🧑‍💼**: Employees are distributed across multiple roles. Majority have moderate tenure (mid-level experience). Clear hierarchical reporting structure exists.
4. **Product Insights 🛍️**: Few products contribute significantly to total sales. Certain categories dominate revenue. High demand products drive overall performance. Pricing varies across suppliers and products.
5. **Supplier Insights 🚚**: Some suppliers provide more products than others. Pricing varies significantly across suppliers. Suppliers are distributed across multiple regions. Certain suppliers dominate specific product categories.

### 🎛 Interactive Features:

- Drill-through options to explore details at multiple levels.
- Custom slicers for dynamic filtering.
- KPIs displayed in real-time visuals.

## How to Use 📋

1. Download the Power BI file: `northwind_sales.pbix`
2. Open the file in **Power BI Desktop**.
3. Explore the dashboards and insights interactively.

## File Details 📁

- **File Name**: `northwind_sales.pbix` [Download File](https://github.com/Pradipjagi99/Capstone-project-1/blob/main/Dashboard/northwind_sales.pbix)

</details>

---

## Contact 📱

For any queries or feedback, feel free to reach out:

- **Name 👤**: Jagi Pradip Rao
- **Email 📩**: pradip.jagi@gmail.com

## 🙌 Acknowledgments

A big shoutout to ACCIO JOB mentors for their helpful tutorial that guided this project.








    
    



