USE bbdd_empleadas_join;

-- CROSS JOIN
SELECT empleadas.nombre, empleadas_en_proyectos.id_proyecto
FROM empleadas
CROSS JOIN empleadas_en_proyectos;

-- NATURAL JOIN
SELECT nombre, apellido, id_proyecto   
FROM empleadas NATURAL JOIN empleadas_en_proyectos;

-- INNER JOIN
SELECT nombre, apellido, empleadas_en_proyectos.id_proyecto   
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;


-- -- -- -- -- -- -- -- -- -- -- -- -- --
-- EJERCICIOS JOIN I
-- customer_number, customer_name, contact_last_name, contact_first_name
-- phone, address_line1, address_line2, city, state, postal_code, country
-- sales_rep_employee_number, credit_limit

USE tienda;

-- 1. ID, nombre, apellidos de las empleadas
-- + el ID de cada cliente asociado a ellas, usando CROSS JOIN:
SELECT employee_number, first_name, last_name, customer_number
FROM employees
CROSS JOIN customers
WHERE employee_number = sales_rep_employee_number;


-- 2. ID, nombre, apellidos de las empleadas
-- con más de 8 clientes, usando CROSS JOIN:
SELECT employee_number, first_name, last_name
FROM employees
CROSS JOIN (
	SELECT sales_rep_employee_number, COUNT(customer_number)
    FROM customers
    GROUP BY sales_rep_employee_number
    HAVING COUNT(customer_number) > 8
) AS c
WHERE employee_number = sales_rep_employee_number;


-- 3. nombre y apellidos de las empleadas c
-- clientes + de un país, usando CROSS JOIN:
SELECT first_name, last_name
FROM employees
CROSS JOIN (
	SELECT sales_rep_employee_number, COUNT(DISTINCT country)
    FROM customers
    GROUP BY sales_rep_employee_number
    HAVING COUNT(DISTINCT country) > 1
) AS c
WHERE employee_number = sales_rep_employee_number;


-- 4. ID, nombre y apellidos de las empleadas y
-- + el ID de cada cliente asociado a ellas, usando INNER JOIN:
SELECT employee_number, first_name, last_name, customer_number
FROM employees
INNER JOIN customers
ON employee_number = sales_rep_employee_number;


-- 5. ID, nombre, apellidos de las empleadas
-- c + de 8 clientes, usando INNER JOIN:
SELECT employee_number, first_name, last_name
FROM employees
INNER JOIN customers
ON employee_number = sales_rep_employee_number
GROUP BY sales_rep_employee_number
HAVING COUNT(customer_number) > 8;


-- 6. nombre y apellidos de las empleadas c
-- clientes + de un país, usando INNER JOIN:
SELECT first_name, last_name
FROM employees
INNER JOIN customers
ON employee_number = sales_rep_employee_number
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT country) > 1;