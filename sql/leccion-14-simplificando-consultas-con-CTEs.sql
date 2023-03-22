/*Pair programming Simplificando consultas con CTEs*/

-- -------------------------------------------------------------------------------------------------------------------------------------- --

/*1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.
Los resultados de esta query serán:*/

WITH ClientesEmpresas
  AS (
		SELECT customer_id AS CustID, company_name AS CompanyName
			FROM customers)
SELECT * FROM ClientesEmpresas;

/*2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos los que 
pertezcan a "Germany".
Los resultados de esta query serán:*/

WITH ClientesEmpresas
  AS (
		SELECT customer_id AS CustID, company_name AS CompanyName
			FROM customers)
SELECT customer_id, company_name
FROM customers
NATURAL JOIN ClientesEmpresas
WHERE country = 'Germany';

/*3. Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha y la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).
Los resultados de esta query serán:*/

WITH ClientesEmpresas
  AS (
		SELECT customer_id, company_name
			FROM customers)
	SELECT customer_id, company_name, order_id, order_date
    FROM orders
    NATURAL JOIN ClientesEmpresas;
    
/*4. Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.
Los resultados de esta query serán:*/

WITH ClientesEmpresas
  AS (
		SELECT customer_id, company_name
			FROM customers)
	SELECT customer_id, company_name, COUNT(order_id) AS numero_facturas
    FROM orders
    NATURAL JOIN ClientesEmpresas
    GROUP BY customer_id;

-- se puede agrupar también por company_name y no da error --

/*5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.
Los resultados de esta query serán:*/


WITH CantidadProducto
  AS (
		SELECT product_id, quantity
			FROM order_details)
	SELECT product_name AS producto, AVG(quantity) AS media_pedida
    FROM products
    NATURAL JOIN CantidadProducto
    GROUP BY product_name;