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


  










