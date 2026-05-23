-- Joins
USE parks_and_recreation;
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT * FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- Notamos que el empleado 2 no se encuentra en la salida de esta query porque no esta en ambas tablas

SELECT employe_id, age, occupation -- esta parte puede tener un error al no especificar a que tabla corresponde el id
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id, age, occupation   -- esto solo muesta ciertas columnas
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal	
ON dem.employee_id = sal.employee_id;

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal	
ON dem.employee_id = sal.employee_id;
-- Esto muestra todos los índices que aparecen en la tabla izquierda o derecha

SELECT emp1.first_name, emp2.first_name
FROM employee_salary emp1		-- se pueden nombrar sin usar AS
JOIN employee_salary emp2
ON emp1.employee_id = emp2.employee_id - 1;
-- este self join sirve para unir una lista consigo misma de tal forma que los índices cumplan
-- cierta condición, sirve por ejemplo para asociar equipos o tareas u otras cosas

SELECT *
FROM parks_departments;
-- Esta tabla tiene un id que corresponde al departamento y no al empleado

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
-- A partir de aquí la tabla tendrá los índices de las dos tablas unidas
INNER JOIN parks_departments pd
ON sal.dept_id = pd.department_id;
-- De esta forma podemos unir varias tablas a partir de sus distintos índices