/* Pair programming Consultas en múltiples tablas 4 */
-- ------------------------------------------------------------------------------------------------------------------------------------

/*Es el turno de las subqueries. En este ejercicios os planteamos una serie de queries que nos permitirán conocer información de la 
base de datos Northwind, que tendréis que solucionar usando subqueries.*/

/*1. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, 
el nombre del producto y su ID de categoría.
La query debería resultar en una tabla como esta:*/

SELECT product_id AS ProductID, product_name AS ProductName, category_id AS CategoryID
	FROM products
    WHERE category_id = (SELECT category_id
						FROM categories
                        WHERE category_name = 'Beverages');

/*2. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países 
para buscar proveedores adicionales.
Los resultados de esta query son:*/

SELECT country
	FROM customers
	WHERE country NOT IN (SELECT country
							FROM suppliers);

/*3. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" 
(ProductID 6) en un solo pedido.
Resultado de nuestra query deberíamos tener una tabla como esta:*/

SELECT order_id AS OrderID, customer_id AS CustomerID
	FROM orders
	WHERE order_id IN ( SELECT order_id 
						FROM order_details
                        WHERE product_id = 6 AND quantity > 20);
                        
/*4. Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.
Los resultados esperados de esta query son:*/

SELECT product_name AS Ten_Most_Expensive_Products, unit_price AS UnitPrice
	FROM products
    WHERE product_id IN (SELECT product_id
						FROM order_details)
	ORDER BY unit_price DESC
    LIMIT 10;
    
SELECT product_name AS Ten_Most_Expensive_Products, unit_price AS UnitPrice
	FROM (SELECT *
			FROM products) AS viernes
            ORDER BY unit_price DESC
            LIMIT 10;
    
/*5. BONUS:
Qué producto es más popular
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.
El resultado de esta query es:*/

SELECT products.product_name AS ProductName, SumQuantity AS `MAX(SumQuantity)`
	FROM products, (SELECT product_id, SUM(quantity) AS SumQuantity
							FROM order_details
                            GROUP BY product_id) AS tablasum
    WHERE products.product_id = tablasum.product_id
    ORDER BY SumQuantity DESC
    LIMIT 1;
    



