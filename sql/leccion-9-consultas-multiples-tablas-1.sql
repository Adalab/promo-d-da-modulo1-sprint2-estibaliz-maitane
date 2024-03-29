/* Pair programming Consultas en múltiples tablas 1 */
-- ------------------------------------------------------------------------------------------------------------------------------------

/* En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind.
El día de hoy vamos a realizar ejercicios en los que practicaremos las queries SQL a múltiples tablas usando los operadores CROSS JOIN, 
INNER JOIN y NATURAL JOIN. De esta manera podremos combinar los datos de diferentes tablas en las mismas bases de datos, para así realizar 
consultas mucho mas complejas.*/

/* 1. Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos 
pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.*/
 
SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador,  COUNT(orders.order_id) AS NumeroPedidos
	FROM orders INNER JOIN customers
    USING (customer_id)
    GROUP BY customers.customer_id
    HAVING COUNT(orders.ship_country = 'UK');
 
 /* 2. Productos pedidos por empresa en UK por año:
Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de 
consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa 
cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/
 
# Con CROSS JOIN deja hacer los dos joins juntos pero es menos eficiente:
SELECT customers.company_name AS NombreEmpresa, YEAR(orders.shipped_date) AS Año, SUM(order_details.quantity) AS NumObjetos
	FROM orders
    CROSS JOIN customers, order_details
    WHERE customers.customer_id = orders.customer_id AND orders.order_id = order_details.order_id
    GROUP BY customers.company_name, YEAR(orders.shipped_date)
    HAVING COUNT(orders.ship_country = 'UK');

# Con INNER JOIN sería haciendo dos, pero entendemos que es una mejor solución:   
SELECT customers.company_name AS NombreEmpresa, YEAR(orders.shipped_date) AS Año, SUM(order_details.quantity) AS NumObjetos
	FROM orders
    INNER JOIN customers
    USING (customer_id)
	INNER JOIN order_details
    USING (order_id)
    GROUP BY customers.company_name, YEAR(orders.shipped_date)
    HAVING COUNT(orders.ship_country = 'UK');
 
 /* 3. Mejorad la query anterior:
Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa 
cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% 
nos sale como 0.15.*/
 
SELECT customers.company_name AS NombreEmpresa, YEAR(orders.shipped_date) AS Año, 
SUM(order_details.quantity) AS NumObjetos, SUM(order_details.unit_price * order_details.quantity * (1 - order_details.discount)) AS DineroTotal
	FROM orders
    INNER JOIN customers
    USING (customer_id)
	INNER JOIN order_details
    USING (order_id)
    GROUP BY customers.company_name, YEAR(orders.shipped_date)
    HAVING COUNT(orders.ship_country = 'UK');

 /* 4. BONUS: Pedidos que han realizado cada compañía y su fecha:
Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido 
una consulta que indique el nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.*/
 
SELECT orders.order_id AS OrderID, customers.company_name AS CompanyName, orders.order_date AS OrderDate
	FROM orders INNER JOIN customers
    USING (customer_id);
 
 /* 5. BONUS: Tipos de producto vendidos:
Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, 
y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).
Pista Necesitaréis usar 3 joins.*/

SELECT categories.category_id AS CategoryID, categories.category_name AS CategoryName, products.product_name AS ProductName, ROUND(SUM(order_details.unit_price * order_details.quantity * (1 - order_details.discount)), 2) AS ProductSales
	FROM products
    INNER JOIN categories
    USING (category_id)
	INNER JOIN order_details
    USING (product_id)
	GROUP BY category_id, product_name;


 

    