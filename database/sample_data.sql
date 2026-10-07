USE retail_analytics;
-- =====================================================
-- SAMPLE DATA
-- Retail SQL Analytics System
-- =====================================================

USE retail_analytics;

-- =========================
-- CATEGORIES
-- =========================

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Sports'),
('Beauty');


-- =========================
-- PRODUCTS
-- =========================

INSERT INTO products
(product_name, category_id, price, stock_quantity)
VALUES
('Wireless Headphones', 1, 79.99, 120),
('Smart Watch', 1, 149.99, 80),
('Bluetooth Speaker', 1, 59.99, 100),
('Laptop Stand', 1, 39.99, 70),

('Men T-Shirt', 2, 24.99, 200),
('Women Hoodie', 2, 49.99, 150),
('Running Shoes', 2, 89.99, 110),

('Coffee Maker', 3, 69.99, 60),
('Blender', 3, 54.99, 75),
('Air Fryer', 3, 119.99, 45),

('Yoga Mat', 4, 29.99, 100),
('Dumbbell Set', 4, 99.99, 55),
('Resistance Bands', 4, 19.99, 140),

('Face Moisturizer', 5, 22.99, 180),
('Skin Care Set', 5, 64.99, 90);


-- =========================
-- STORES
-- =========================

INSERT INTO stores
(store_name, city, state)
VALUES
('Youngstown Retail Center', 'Youngstown', 'Ohio'),
('Cleveland Downtown Store', 'Cleveland', 'Ohio'),
('Pittsburgh Retail Hub', 'Pittsburgh', 'Pennsylvania'),
('Columbus Shopping Center', 'Columbus', 'Ohio');


-- =========================
-- CUSTOMERS
-- =========================

INSERT INTO customers
(first_name, last_name, email, city, state, join_date)
VALUES
('James', 'Wilson', 'james.wilson@email.com', 'Youngstown', 'Ohio', '2026-01-12'),
('Emma', 'Johnson', 'emma.johnson@email.com', 'Cleveland', 'Ohio', '2026-01-18'),
('Michael', 'Brown', 'michael.brown@email.com', 'Pittsburgh', 'Pennsylvania', '2026-02-05'),
('Sophia', 'Davis', 'sophia.davis@email.com', 'Columbus', 'Ohio', '2026-02-15'),
('Daniel', 'Miller', 'daniel.miller@email.com', 'Youngstown', 'Ohio', '2026-03-02'),
('Olivia', 'Taylor', 'olivia.taylor@email.com', 'Cleveland', 'Ohio', '2026-03-11'),
('Ethan', 'Anderson', 'ethan.anderson@email.com', 'Pittsburgh', 'Pennsylvania', '2026-04-01'),
('Ava', 'Thomas', 'ava.thomas@email.com', 'Columbus', 'Ohio', '2026-04-19'),
('Noah', 'Jackson', 'noah.jackson@email.com', 'Youngstown', 'Ohio', '2026-05-07'),
('Mia', 'White', 'mia.white@email.com', 'Cleveland', 'Ohio', '2026-05-21'),
('Liam', 'Harris', 'liam.harris@email.com', 'Pittsburgh', 'Pennsylvania', '2026-06-02'),
('Isabella', 'Martin', 'isabella.martin@email.com', 'Columbus', 'Ohio', '2026-06-14');


-- =========================
-- ORDERS
-- =========================

INSERT INTO orders
(customer_id, store_id, order_date, payment_method, order_status)
VALUES
(1, 1, '2026-01-15', 'Credit Card', 'Completed'),
(2, 2, '2026-01-22', 'Debit Card', 'Completed'),
(3, 3, '2026-02-10', 'PayPal', 'Completed'),
(4, 4, '2026-02-25', 'Credit Card', 'Completed'),
(5, 1, '2026-03-08', 'Debit Card', 'Completed'),
(6, 2, '2026-03-17', 'Credit Card', 'Completed'),
(1, 1, '2026-04-03', 'PayPal', 'Completed'),
(7, 3, '2026-04-09', 'Credit Card', 'Completed'),
(8, 4, '2026-04-28', 'Debit Card', 'Completed'),
(2, 2, '2026-05-06', 'Credit Card', 'Completed'),
(9, 1, '2026-05-14', 'PayPal', 'Completed'),
(10, 2, '2026-05-30', 'Debit Card', 'Completed'),
(3, 3, '2026-06-04', 'Credit Card', 'Completed'),
(11, 3, '2026-06-18', 'Credit Card', 'Completed'),
(12, 4, '2026-06-26', 'PayPal', 'Completed'),
(4, 4, '2026-07-03', 'Credit Card', 'Completed'),
(5, 1, '2026-07-10', 'Debit Card', 'Completed'),
(6, 2, '2026-07-19', 'PayPal', 'Completed'),
(7, 3, '2026-08-01', 'Credit Card', 'Completed'),
(8, 4, '2026-08-11', 'Debit Card', 'Completed'),
(9, 1, '2026-08-20', 'Credit Card', 'Completed'),
(10, 2, '2026-09-02', 'PayPal', 'Completed'),
(11, 3, '2026-09-12', 'Debit Card', 'Completed'),
(12, 4, '2026-09-20', 'Credit Card', 'Completed');


-- =========================
-- ORDER ITEMS
-- =========================

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES

(1, 1, 1, 79.99),
(1, 5, 2, 24.99),

(2, 2, 1, 149.99),
(2, 14, 2, 22.99),

(3, 3, 2, 59.99),
(3, 11, 1, 29.99),

(4, 10, 1, 119.99),
(4, 15, 1, 64.99),

(5, 7, 1, 89.99),
(5, 13, 2, 19.99),

(6, 8, 1, 69.99),
(6, 9, 1, 54.99),

(7, 2, 1, 149.99),
(7, 4, 1, 39.99),

(8, 12, 1, 99.99),
(8, 13, 3, 19.99),

(9, 6, 2, 49.99),
(9, 14, 1, 22.99),

(10, 1, 2, 79.99),
(10, 3, 1, 59.99),

(11, 11, 2, 29.99),
(11, 12, 1, 99.99),

(12, 5, 3, 24.99),
(12, 6, 1, 49.99),

(13, 10, 1, 119.99),
(13, 8, 1, 69.99),

(14, 2, 1, 149.99),
(14, 1, 1, 79.99),

(15, 15, 2, 64.99),
(15, 14, 2, 22.99),

(16, 3, 2, 59.99),
(16, 4, 1, 39.99),

(17, 7, 1, 89.99),
(17, 5, 2, 24.99),

(18, 9, 1, 54.99),
(18, 10, 1, 119.99),

(19, 12, 2, 99.99),
(19, 13, 2, 19.99),

(20, 6, 1, 49.99),
(20, 7, 1, 89.99),

(21, 1, 1, 79.99),
(21, 11, 2, 29.99),

(22, 8, 1, 69.99),
(22, 15, 1, 64.99),

(23, 2, 1, 149.99),
(23, 3, 2, 59.99),

(24, 10, 1, 119.99),
(24, 12, 1, 99.99);