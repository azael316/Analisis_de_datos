-- SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age;
-- SELECT * FROM parks_and_recreation.employee_demographics LIMIT 3;
-- SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age DESC LIMIT 3;
-- SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age DESC LIMIT 3, 2; -- Imprime los dos renglones siguientes (de abajo hacia arriba) a partir del los 3 primeros
-- SELECT gender, AVG(age) AS avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING avg_age > 40;
SELECT gender, AVG(age) avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING avg_age > 40;