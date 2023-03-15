SELECT * FROM customers;

-- Ejercicio 1 invertida apellidos en ambas customer y employees, con alias apellidos

SELECT contact_last_name AS 'Apellidos'
	FROM customers
	UNION
	SELECT last_name
	FROM employees;
    
-- ejercicio 2 nombres y apellidos tanto de clientes como customers
-- mismo que arriba --

-- ejercicio 4 empleados con contrato asignado a alguno de los clientes existentes, num empleado, nombre empl, y last name

SELECT employee_number AS 'Nuevo empleado'
	FROM employees
    WHERE employee_number IN (SELECT sales_rep_employee_number FROM customers);
    
-- ejercicio 5 not in