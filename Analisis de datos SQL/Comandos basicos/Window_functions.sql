SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;
-- Esta tabla nos muestra el salario promedio por genero

SELECT gender, AVG(salary) OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Esta nos da una tabla del genero del empleado y el salario promedio

SELECT dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Esta tabla lo que hace es hacer el promedio sobre alguna partición
-- de un campo, pero lo imprime para cada empleado.

SELECT dem.first_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, gender;
-- A diferencia esta nos da simplemente el salario promedio por empleado ya que agrupa
-- por nombre y por genero

SELECT dem.first_name, gender,
SUM(salary) OVER(PARTITION BY gender) as sum_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Aquí coloca la suma de cada genero en cada empleado
    
SELECT dem.first_name, gender,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as sum_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- En esta al ordenar por el id la suma se fue haciendo la suma progresivamente

SELECT dem.first_name, gender,
ROW_NUMBER() OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Esta le asigna a cada renglón su número y no está relacionado con las id

SELECT dem.first_name, gender,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Podemos usarlo para enumerar por grupos como el genero

SELECT dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS enumeration
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Esta muestra enumera por grupo, pero además ordena por salario

SELECT dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- En este caso el rank_num repite el numero en personas con el mismo salario,
-- pero vemos que se salta el 6

SELECT dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Para hacer que no se salte números podemos utilizar dense_rank()