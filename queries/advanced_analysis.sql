-- =====================================================
-- RETAIL SQL ANALYTICS SYSTEM
-- Advanced Business Analysis
-- Author: Anubhav Bhattarai
-- =====================================================

USE retail_analytics;


-- =====================================================
-- 1. CUSTOMER SPENDING RANK
-- Skills: CTE + RANK() + Window Function
-- =====================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_id,
    customer_name,
    ROUND(total_spent, 2) AS total_spent,
    RANK() OVER (
        ORDER BY total_spent DESC
    ) AS spending_rank
FROM customer_spending;


-- =====================================================
-- 2. PRODUCT REVENUE RANKING
-- Skills: CTE + RANK()
-- =====================================================

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products AS p
    JOIN order_items AS oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    product_name,
    units_sold,
    ROUND(revenue, 2) AS revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_sales;


-- =====================================================
-- 3. MONTH-OVER-MONTH REVENUE GROWTH
-- Skills: CTE + LAG() + Window Function
-- =====================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m')
),

sales_comparison AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY sales_month
        )
        AS previous_month_revenue
    FROM monthly_sales
)

SELECT
    sales_month,
    ROUND(revenue, 2) AS revenue,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,

    ROUND(
        (
            (revenue - previous_month_revenue)
            / NULLIF(previous_month_revenue, 0)
        ) * 100,
        2
    ) AS growth_percentage

FROM sales_comparison
ORDER BY sales_month;


-- =====================================================
-- 4. RUNNING TOTAL REVENUE
-- Skills: SUM() OVER()
-- =====================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    sales_month,
    ROUND(monthly_revenue, 2) AS monthly_revenue,

    ROUND(
        SUM(monthly_revenue) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS running_total_revenue

FROM monthly_sales
ORDER BY sales_month;


-- =====================================================
-- 5. CATEGORY REVENUE CONTRIBUTION
-- Skills: Window Function + Percentage Analysis
-- =====================================================

WITH category_sales AS (
    SELECT
        c.category_name,
        SUM(oi.quantity * oi.unit_price) AS category_revenue
    FROM categories AS c
    JOIN products AS p
        ON c.category_id = p.category_id
    JOIN order_items AS oi
        ON p.product_id = oi.product_id
    GROUP BY
        c.category_id,
        c.category_name
)

SELECT
    category_name,
    ROUND(category_revenue, 2) AS category_revenue,

    ROUND(
        category_revenue
        / SUM(category_revenue) OVER () * 100,
        2
    ) AS revenue_percentage

FROM category_sales
ORDER BY category_revenue DESC;


-- =====================================================
-- 6. CUSTOMER SEGMENTATION
-- Skills: CTE + CASE Statement
-- =====================================================

WITH customer_spending AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_id,
    customer_name,
    ROUND(total_spent, 2) AS total_spent,

    CASE
        WHEN total_spent >= 400 THEN 'VIP Customer'
        WHEN total_spent >= 300 THEN 'High Value'
        WHEN total_spent >= 200 THEN 'Regular Customer'
        ELSE 'Low Value'
    END AS customer_segment

FROM customer_spending
ORDER BY total_spent DESC;


-- =====================================================
-- 7. STORE PERFORMANCE RANKING
-- Skills: CTE + RANK()
-- =====================================================

WITH store_sales AS (
    SELECT
        s.store_id,
        s.store_name,
        s.city,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM stores AS s
    JOIN orders AS o
        ON s.store_id = o.store_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        s.store_id,
        s.store_name,
        s.city
)

SELECT
    store_name,
    city,
    ROUND(revenue, 2) AS revenue,

    RANK() OVER (
        ORDER BY revenue DESC
    ) AS store_rank

FROM store_sales;


-- =====================================================
-- 8. CUSTOMER LIFETIME VALUE VIEW
-- Skills: SQL VIEW
-- =====================================================

CREATE OR REPLACE VIEW customer_lifetime_value AS

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_items_purchased,
    ROUND(
        SUM(oi.quantity * oi.unit_price),
        2
    ) AS lifetime_value

FROM customers AS c

JOIN orders AS o
    ON c.customer_id = o.customer_id

JOIN order_items AS oi
    ON o.order_id = oi.order_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;


-- =====================================================
-- 9. VIEW CUSTOMER LIFETIME VALUES
-- =====================================================

SELECT *
FROM customer_lifetime_value
ORDER BY lifetime_value DESC;


-- =====================================================
-- 10. TOP 3 CUSTOMERS
-- Uses the View Created Above
-- =====================================================

SELECT
    customer_name,
    total_orders,
    total_items_purchased,
    lifetime_value
FROM customer_lifetime_value
ORDER BY lifetime_value DESC
LIMIT 3;