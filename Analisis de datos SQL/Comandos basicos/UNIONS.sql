SELECT age, gender
FROM employee_demographics
UNION
SELECT *
FROM employee_salary;
-- Esto nos regresa un error porque los tamaños de la primera seleccion y la segunda no coinciden

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;
-- Esto devuelve una tabla con los age gender de la primera y debajo de estos pone los datos de la
-- otra tabla, sirve para unir por ejemplo dos tablas con los mismo campos y generar una tabla más amplia

SELECT first_name, age
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;
-- Vemos que la union no repite datos con el mismo valor

SELECT first_name, last_name , 'Old man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name , 'Old woman' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name , 'Highly paid employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;
