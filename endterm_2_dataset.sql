CREATE TABLE supermarket_sales (
    invoice_id VARCHAR(20) PRIMARY KEY,
    branch VARCHAR(10),
    city VARCHAR(50),
    customer_type VARCHAR(20),
    gender VARCHAR(10),
    product_line VARCHAR(50),
    unit_price NUMERIC,
    quantity INT,
    tax NUMERIC,
    total NUMERIC,
    date DATE,
    time TIME,
    payment VARCHAR(20),
    cogs NUMERIC,
    gross_margin_percentage NUMERIC,
    gross_income NUMERIC,
    rating NUMERIC
);

-- 1. Total Sales and Average Rating per City 
SELECT 
    city,
    SUM(total) AS total_sales,
    AVG(rating) AS avg_rating
FROM 
    supermarket_sales
GROUP BY 
    city
ORDER BY 
    total_sales DESC;

-- 2. Best-Selling Product Line
SELECT 
    product_line,
    SUM(total) AS total_sales
FROM 
    supermarket_sales
GROUP BY 
    product_line
ORDER BY 
    total_sales DESC
LIMIT 1;

-- 3. Top 5 Customers by Total Purchase
SELECT 
    customer_type,
    SUM(total) AS total_purchase
FROM 
    supermarket_sales
GROUP BY 
    customer_type
ORDER BY 
    total_purchase DESC
LIMIT 5;

-- 4. Sales Distribution by Gender and Product Line
SELECT 
    gender,
    product_line,
    SUM(total) AS total_sales
FROM 
    supermarket_sales
GROUP BY 
    gender, product_line
ORDER BY 
    total_sales DESC;

-- 5. Monthly Sales Trend
SELECT 
    DATE_PART('month', date) AS month,
    SUM(total) AS total_sales
FROM 
    supermarket_sales
GROUP BY 
    DATE_PART('month', date)
ORDER BY 
    month;
