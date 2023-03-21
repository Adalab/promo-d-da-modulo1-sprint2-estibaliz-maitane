/* Pair programming Consultas en múltiples tablas 5 */
-- ------------------------------------------------------------------------------------------------------------------------------------

/*En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind. En este caso trabajaremos 
con queries correlacionadas y con estamenteos como el like y not like. Para solucionar algunos de los ejercicios tendremos que 
aplicar conocimientos apredidos previamente como los join.
Es el momento de poner práctica los conceptos aprendidos en la lección de queries múltiples V.*/

/*1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos 
con una query correlacionada.*/

SELECT o1.order_id AS OrderID, o1.customer_id AS CustomerID, o1.employee_id AS EmployeeID, o1.order_date AS OrderDate, o1.required_date AS RequiredDate
	FROM orders AS o1
    WHERE order_date = (SELECT MAX(order_date)
				FROM orders AS o2
                WHERE o1.employee_id = o2.employee_id);
											
/*2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer 
con queries correlacionadas.*/

SELECT DISTINCT o1.product_id AS ProductID, o1.unit_price AS Max_unit_price
	FROM order_details AS o1
    WHERE unit_price = (SELECT MAX(unit_price)
							FROM order_details AS o2
                            WHERE o1.product_id = o2.product_id);

/*3. Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en ciudades que 
empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.*/

SELECT city AS City, company_name AS CompanyName, contact_name AS ContactName
	FROM customers
    WHERE (city LIKE 'A%') OR (city LIKE 'B%');

/*4. Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho 
todas las ciudades que empiezan por "L".*/

SELECT city AS ciudad, company_name AS empresa, contact_name AS persona_contacto, COUNT(order_id) AS numero_pedidos
	FROM customers
    INNER JOIN orders
    USING (customer_id)
    WHERE city LIKE 'L%'
    GROUP BY city, company_name
    HAVING COUNT(order_id);

/*5. Todos los clientes cuyo "contact_title" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". Extraer el nombre de contacto, 
su posisión (contact_title) y el nombre de la compañia.*/



/*6. Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/


