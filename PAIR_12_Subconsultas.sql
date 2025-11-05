USE northwind;


 /* Extraed información de los productos "Beverages"
le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages".
 Devuelve el ID del producto, el nombre del producto y su ID de categoría.
 */
 
 
 SELECT ProductID, ProductName, CategoryID
	FROM Products
    WHERE CategoryID IN (SELECT CategoryID
							FROM Categories
							WHERE CategoryName = 'Beverages');
 
 SELECT *
 FROM categories; 
 

SELECT customer_number, contact_first_name, contact_last_name, city
	FROM customers
    WHERE city IN (SELECT city
						FROM customers
						GROUP BY city
						HAVING COUNT(customer_number) >= ALL (SELECT COUNT(customer_number)
																	FROM customers
																	GROUP BY city));