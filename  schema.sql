DROP TABLE IF EXISTS fact_payments CASCADE;
DROP TABLE IF EXISTS fact_subscriptions CASCADE;
DROP TABLE IF EXISTS dim_customers CASCADE;
DROP TABLE IF EXISTS dim_plans CASCADE;

-- Dimension: customers
CREATE TABLE dim_customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT,
    signup_date Date
);

-- Dimension: plans
CREATE TABLE dim_plans (
    plan_id SERIAL PRIMARY KEY,
    plan_name TEXT,
    monthly_price NUMERIC(10,2)
);

-- Fact: subscriptions
CREATE TABLE fact_subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customers(customer_id),
    plan_id INT REFERENCES dim_plans(plan_id),
    start_date DATE,
    end_date DATE
)

-- Fact: payments
CREATE TABLE fact_payments (
    payment_id SERIAL PRIMARY KEY,
    subscription_id INT REFERENCES fact_subscriptions(subscription_id),
    payment_date DATE,
    amount NUMERIC(10,2)
);

