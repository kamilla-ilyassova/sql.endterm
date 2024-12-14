CREATE TABLE employee_performance (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary NUMERIC,
    performance_score NUMERIC,
    age INT,
    joining_date DATE
);

-- 1. Find the Highest Salary
SELECT MAX(salary) AS highest_salary FROM employee_performance;

-- 2. Average Performance Score by Department
SELECT department, AVG(performance_score) AS avg_performance
FROM employee_performance
GROUP BY department;

-- 3. Employees with Performance Score > 85
SELECT name, department, performance_score
FROM employee_performance
WHERE performance_score > 85;

-- 4. Total Employees in Each Department
SELECT department, COUNT(*) AS total_employees
FROM employee_performance
GROUP BY department;

-- 5. Employees Who Joined in the Last Year
SELECT name, department, joining_date
FROM employee_performance
WHERE joining_date >= CURRENT_DATE - INTERVAL '1 year';
