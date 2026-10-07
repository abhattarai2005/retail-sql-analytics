# Retail SQL Analytics System

This project is a retail sales analytics system that I built using MySQL and SQL. I created a relational database for customers, products, categories, stores, orders, and order items, then used SQL queries to analyze the data and answer common business questions.

The main goal of this project was to practice database design and use SQL to turn raw retail data into useful information about sales, customers, products, and store performance.

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Relational Database Design
- Data Analysis

## Database Design

The database contains six tables:

- `customers`
- `categories`
- `products`
- `stores`
- `orders`
- `order_items`

I connected the tables using primary keys and foreign keys so that customer, order, product, category, and store information could be analyzed together.

## Business Questions

I used SQL to answer questions such as:

- What is the total revenue?
- How many orders and customers are in the database?
- What is the average order value?
- Which products generate the most revenue?
- Which customers spend the most?
- Which product categories perform best?
- Which stores generate the most revenue?
- How do sales change from month to month?
- Which customers make repeat purchases?
- Which products have low stock?
- Which payment methods are used most often?
- What is each customer's lifetime value?

## SQL Techniques Used

Throughout the project, I used:

- SELECT statements
- WHERE
- JOINs
- GROUP BY
- HAVING
- Aggregate functions
- Subqueries
- Common Table Expressions (CTEs)
- CASE statements
- SQL views
- Window functions
- `RANK()`
- `LAG()`
- Running totals
- Month-over-month growth calculations

## Key Findings

Some of the main findings from the sample data were:

- Smart Watch generated the highest product revenue.
- Liam Harris had the highest customer lifetime value at $499.95.
- Customer spending could be used to divide customers into different value groups.
- Monthly revenue analysis showed how sales changed throughout the year.
- Store-level analysis made it possible to compare the performance of different retail locations.
- Window functions helped calculate rankings, running revenue totals, and month-over-month changes.

## Project Structure

```text
retail-sql-analytics/
│
├── database/
│   ├── schema.sql
│   └── sample_data.sql
│
├── queries/
│   ├── basic_analysis.sql
│   └── advanced_analysis.sql
│
├── screenshots/
│   ├── database_structure.png
│   ├── top_products.png
│   ├── monthly_sales.png
│   ├── store_performance.png
│   ├── monthly_growth.png
│   └── customer_segmentation.png
│
└── README.md
```

## Analysis Results

### Database Structure

![Database Structure](screenshots/database_structure.png)

### Top Products by Revenue

![Top Products](screenshots/top_products.png)

### Monthly Sales Trend

![Monthly Sales](screenshots/monthly_sales.png)

### Store Performance

![Store Performance](screenshots/store_performance.png)

### Month-over-Month Revenue Growth

![Monthly Growth](screenshots/monthly_growth.png)

### Customer Segmentation

![Customer Segmentation](screenshots/customer_segmentation.png)

## What I Learned

This project helped me improve my understanding of relational database design and SQL analysis. I practiced connecting multiple tables, writing queries for business questions, using CTEs and window functions, and organizing SQL code into a complete project.

It also gave me experience thinking about SQL from a business perspective instead of only writing individual queries.

## Author

Anubhav Bhattarai

Computer Science Student

Skills used in this project: SQL, MySQL, Database Design, Data Analysis, CTEs, Window Functions, and Business Analytics