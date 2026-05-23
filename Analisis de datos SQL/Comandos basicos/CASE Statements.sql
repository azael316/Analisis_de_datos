SELECT first_name, last_name,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "On death's door"
END
FROM employee_demographics;
-- Condiciones de rango

SELECT first_name, salary,
CASE
	WHEN salary < 50000 THEN salary*0.05
    WHEN salary > 50000 THEN salary*0.07
END AS Augment,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS Bonus
FROM employee_salary;
-- Varias condiciones