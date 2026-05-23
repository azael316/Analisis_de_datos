SELECT *
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id
    FROM employee_salary
    WHERE dept_id =1
);
-- Lo que hace es hacer una consulta la cual se basa en una subconsulta parentesis

SELECT *
FROM employee_demographics
WHERE employee_id IN (
	SELECT employee_id, dept_id
    FROM employee_salary
    WHERE dept_id =1
);
-- este no funciona porque la subconsulta tiene dos columnas

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name;
-- Esta consulta saca el promedio por objeto agrupado

SELECT first_name, salary, (
	SELECT AVG(salary)
    FROM employee_salary
)
FROM employee_salary;
-- Este primero hace una subconsulta para promediar

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;
-- Esta da los promedios y demás por genero

SELECT gender, AVG(`MAX(age)`) 
FROM (
	SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
	FROM employee_demographics
	GROUP BY gender
) AS Age_table
GROUP BY gender;
-- Esta cita a la anterior y da los promedios por género, pero como ya están agrupados
-- no hace nada nuevo

SELECT AVG(max_age) 
FROM (
	SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) AS count_age
	FROM employee_demographics
	GROUP BY gender
) AS Age_table;
-- Esta promedia sobre los únicos dos campos que hay