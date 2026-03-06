BEGIN;

INSERT INTO dim_plans (plan_name, monthly_price)
VALUES
('Basic', 10.00),
('Pro', 25.00),
('Enterprise', 60.00);

INSERT INTO dim_customers (name, country, signup_date)
VALUES
('Anna Kowalski', 'Poland', '2024-01-10'),
('John Smith', 'USA', '2024-02-15'),
('Maria Ivanova', 'Ukraine', '2024-03-20'),
('David Cohen', 'Israel', '2024-01-25'),
('Laura Becker', 'Germany', '2024-04-05');

INSERT INTO fact_subscriptions (customer_id, plan_id, start_date, end_date)
VALUES
(1, 2, '2024-01-10', NULL),        -- Anna → Pro
(2, 1, '2024-02-15', NULL),        -- John → Basic
(3, 2, '2024-03-20', '2024-06-20'),-- Maria → Pro (cancelled)
(4, 3, '2024-01-25', NULL),        -- David → Enterprise
(5, 1, '2024-04-05', NULL);        -- Laura → Basic

INSERT INTO fact_payments (subscription_id, payment_date, amount)
VALUES
-- Anna (subscription_id = 1)
(1, '2024-01-10', 25.00),
(1, '2024-02-10', 25.00),
(1, '2024-03-10', 25.00),

-- John (subscription_id = 2)
(2, '2024-02-15', 10.00),
(2, '2024-03-15', 10.00),

-- Maria (subscription_id = 3)
(3, '2024-03-20', 25.00),
(3, '2024-04-20', 25.00),
(3, '2024-05-20', 25.00),

-- David (subscription_id = 4)
(4, '2024-01-25', 60.00),
(4, '2024-02-25', 60.00),

-- Laura (subscription_id = 5)
(5, '2024-04-05', 10.00),
(5, '2024-05-05', 10.00);

COMMIT;