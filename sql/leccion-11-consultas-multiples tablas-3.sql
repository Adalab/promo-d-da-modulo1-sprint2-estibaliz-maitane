/*Pair programming Consultas en múltiples tablas 3*/
-- -------------------------------------------------------------------------------------------------------------------------------------

/*En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind.
Hoy prondremos en práctica sentencias como UNION, UNION ALL, INTERSECT o EXCEPT.
Para esta práctica te hara falta crear en algunos de los ejercicios una columna temporal.
Para ver como funciona esta creación de columnas temporales prueba el siguiente código:
	SELECT  'Hola!'  AS tipo_nombre
	FROM customers; */

/* 1. Extraer toda la información sobre las compañias que tengamos en la BBDD
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. Mostrad la 
ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). Pero importante! 
No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. Para ello añade el 
valor que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT.*/



/* 2. Extraer todos los pedidos gestinados por "Nancy Davolio"
En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", una de nuestras empleadas. Nos pide todos los detalles 
tramitados por ella.*/


    
/* 3. Extraed todas las empresas que no han comprado en el año 1997
En este caso, nuestro jefe quiere saber cuántas empresas no han comprado en el año 1997.
💡 Pista 💡 Para extraer el año de una fecha, podemos usar el estamento year. */ 



/* 4. Extraed toda la información de los pedidos donde tengamos "Konbu"
Estamos muy interesados en saber como ha sido la evolución de la venta de Konbu a lo largo del tiempo. Nuestro jefe nos pide que nos muestre 
todos los pedidos que contengan "Konbu".
💡 Pista 💡 En esta query tendremos que combinar conocimientos adquiridos en las lecciones anteriores como por ejemplo el INNER JOIN.*/

