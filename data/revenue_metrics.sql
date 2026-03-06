-- Total revenue
SELECT SUM(amount) as total_revenue 
FROM fact_payments;

-- Revenue per month
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS revenue
FROM fact_payments
GROUP BY month
ORDER BY month;

-- Revenue by country
SELECT 
    c.country,
    SUM(f.amount) AS revenue
FROM fact_payments as f 
JOIN dim_customers as c
ON c.customer_id = p.customer_id
GROUP BY c.country
ORDER BY revenue DESC;

-- Revenue by plan
SELECT
    p.plan_name,
    SUM(f.amount) AS revenue
FROM fact_payments f
JOIN fact_subscriptions s
    ON f.customer_id = s.customer_id
JOIN dim_plans p
    ON s.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY revenue DESC;

-- ARPU
SELECT 
    SUM(amount) / COUNT(DISTINCT subscription_id) AS arpu
FROM fact_payments;

-- Revenue per customer
SELECT 
    c.name,
    SUM(f.amount) AS customer_revenue
FROM fact_payments f
JOIN fact_subscriptions s
    ON f.subscription_id = s.subscription_id
JOIN dim_customers c
    ON s.customer_id = c.customer_id
GROUP BY c.name
ORDER BY customer_revenue DESC;

SELECT
    f.payment_date,
    f.amount,
    c.country,
    p.plan_name
FROM fact_payments f
JOIN fact_subscriptions s 
    ON f.subscription_id = s.subscription_id
JOIN dim_customers c 
    ON s.customer_id = c.customer_id
JOIN dim_plans p 
    ON s.plan_id = p.plan_id;