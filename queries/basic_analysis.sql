-- =====================================================
-- RETAIL SQL ANALYTICS SYSTEM
-- Basic Business Analysis
-- Author: Anubhav Bhattarai
-- =====================================================

USE retail_analytics;


-- =====================================================
-- 1. TOTAL REVENUE
-- =====================================================

SELECT
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_items;


-- =====================================================
-- 2. TOTAL ORDERS
-- =====================================================

SELECT
    COUNT(*) AS total_orders
FROM orders;


-- =====================================================
-- 3. TOTAL CUSTOMERS
-- =====================================================

SELECT
    COUNT(*) AS total_customers
FROM customers;


-- =====================================================
-- 4. AVERAGE ORDER VALUE
-- =====================================================

SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;


-- =====================================================
-- 5. TOP 5 PRODUCTS BY REVENUE
-- =====================================================

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY revenue DESC
LIMIT 5;


-- =====================================================
-- 6. TOP CUSTOMERS BY SPENDING
-- =====================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;


-- =====================================================
-- 7. MONTHLY SALES TREND
-- =====================================================

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY
    sales_month;


-- =====================================================
-- 8. CATEGORY PERFORMANCE
-- =====================================================

SELECT
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM categories AS c
JOIN products AS p
    ON c.category_id = p.category_id
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY
    revenue DESC;


-- =====================================================
-- 9. STORE PERFORMANCE
-- =====================================================

SELECT
    s.store_name,
    s.city,
    s.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM stores AS s
JOIN orders AS o
    ON s.store_id = o.store_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    s.store_id,
    s.store_name,
    s.city,
    s.state
ORDER BY
    revenue DESC;


-- =====================================================
-- 10. PAYMENT METHOD ANALYSIS
-- =====================================================

SELECT
    payment_method,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY
    payment_method
ORDER BY
    number_of_orders DESC;


-- =====================================================
-- 11. REPEAT CUSTOMERS
-- =====================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS number_of_orders
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(o.order_id) > 1
ORDER BY
    number_of_orders DESC;


-- =====================================================
-- 12. LOW STOCK PRODUCTS
-- =====================================================

SELECT
    product_name,
    stock_quantity
FROM products
WHERE
    stock_quantity < 80
ORDER BY
    stock_quantity ASC;


-- =====================================================
-- 13. BEST SELLING PRODUCTS BY QUANTITY
-- =====================================================

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    total_units_sold DESC;


-- =====================================================
-- 14. REVENUE BY STATE
-- =====================================================

SELECT
    s.state,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM stores AS s
JOIN orders AS o
    ON s.store_id = o.store_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    s.state
ORDER BY
    total_revenue DESC;


-- =====================================================
-- 15. CUSTOMER ORDER SUMMARY
-- =====================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS products_purchased,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_spent DESC;