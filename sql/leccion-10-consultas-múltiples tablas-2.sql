/*Pair programming Consultas en múltiples tablas 2*/
-- -------------------------------------------------------------------------------------------------------------------------------------

/*En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind.
El día de hoy vamos a realizar ejercicios en los que practicaremos las queries SQL a múltiples tablas 
usando los operadores LEFT JOIN, RIGHT JOIN, SELF JOIN. De esta manera podremos combinar los datos de diferentes 
tablas en las mismas bases de datos, para así realizar consultas mucho mas complejas. */


/* 1. Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, 
los ID de sus pedidos y las fechas.
Los resultados deberán similares a la siguiente tabla:*/


/* 2. Pedidos por cliente de UK:
Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada cliente 
del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. Especificamente nos piden el nombre 
de cada compañía cliente junto con el número de pedidos.
La tabla resultante será:*/


/* 3. Empresas de UK y sus pedidos:
También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) junto 
con los ID de todos los pedidos que han realizado, el nombre de contacto de cada empresa y la fecha del pedido.
Los resultados de la query deberán ser:*/ 


/* 4. Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas 
las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. 
Investiga el resultado, ¿sabes decir quién es el director?
La tabla resultado de la query deberá ser:*/


/* 5. BONUS: FULL OUTER JOIN Pedidos y empresas con pedidos asociados o no:
Selecciona todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados o no. 
Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido (si existe).
La tabala resultado deberá similar a:*/