USE tienda;

SELECT employee_id, first_name, last_name, reports_to
FROM employees;

SELECT A.first_name AS Nombre_jefe, A.last_name AS apellido_jefe, B.first_name, B.last_name
	FROM employees AS A, employees AS B
    WHERE A.employee_id = B.reports_to;
    
SELECT * FROM products;

SELECT A.product_name AS nombre1, A.buy_price AS price1, B.product_name AS name2, B.buy_price AS price2, b.product_line AS line2, A.product_line AS line1
	FROM products AS A, products AS B
    WHERE A.product_code <> B.product_code AND A.product_line = 'Motorcycles' AND A.product_line = B.product_line;
    
SELECT customers.customer_number, employees.first_name, employees.last_name
	FROM customers
    LEFT JOIN employees
    ON customers.sales_rep_employee_number;
    
SELECT column1, column2
	FROM tabla1
    WHERE = condicion
    GROUP BY
    HAVING condicion
    ORDER BY
    LIMIT 10
    OFFSET 5