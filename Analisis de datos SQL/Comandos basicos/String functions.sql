SELECT LENGTH('skyfall');		-- Da la longitud de la cadena

SELECT first_name, LENGTH(first_name)
FROM employee_demographics		-- podemos dar las las longitudes por entrada
ORDER BY 2;

SELECT UPPER('Sky');	-- Cambia todo a mayusculas
SELECT LOWER('Sky');	-- Cambia todo a minusculas

SELECT first_name, UPPER(first_name)
FROM employee_demographics;			-- Podemos hacerlo para toda una columna

SELECT TRIM('     Sky   ');			-- 	Quita espacios

SELECT RTRIM('     Sky   ');		-- Quita los espacios a la derecha

SELECT first_name, LEFT(first_name, 3), RIGHT(first_name, 3),
SUBSTRING(first_name,3,2)		-- Primeras 3, ultimas 3, desde el tercero 2
FROM employee_demographics;

SELECT birth_date, SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;			
	
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;		-- remplazar caracteres

SELECT LOCATE('x', 'Alexander');		-- Da la posición de un caracter

SELECT first_name, last_name, CONCAT(first_name, ' ',last_name) AS full_name
FROM employee_demographics;				-- Junta cadenas
