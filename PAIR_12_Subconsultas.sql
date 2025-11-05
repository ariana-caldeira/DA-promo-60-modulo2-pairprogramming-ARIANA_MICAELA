
USE northwind;


/* 1. pedidos con el máximo "order_date" para cada empleado
fecha de los pedidos más recientes que ha gestionado cada empleado */
SELECT EmployeeID, OrderID, OrderDate 
	FROM Orders AS o
	WHERE OrderDate = (SELECT MAX(OrderDate)
							FROM Orders AS o2
							WHERE o2.OrderID = o.OrderID);


-- Ejemplos de clase de tabla 'tienda':
SELECT *
	FROM costumers AS c   -- fila
    WHERE EXISTS (SELECT *
					FROM orders
                    WHERE customer_number = c.customer_number);   -- fila = valor de la fila
SELECT *    
	FROM products AS p
	WHERE buy_price > (SELECT AVG(buy_price)
							FROM products AS p2
							WHERE p2.product_line = p.product_line);
-- -- -- --- -- -- -- -- -- -- -- - 



/* 2. Extraed información de los productos "Beverages"
productos con categoría "Beverages", devuelve el ID del producto,
el nombre del producto y su ID de categoría */
 
SELECT ProductID, ProductName, CategoryID
	FROM Products
    WHERE CategoryID IN (SELECT CategoryID
							FROM Categories
							WHERE CategoryName = 'Beverages');
                            
 

/* 3. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor
ubicado en ese país. Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los
clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.*/

-- clientes sin provedor en ese pais
SELECT CustomerID, CompanyName, City
	FROM Customers
    WHERE city NOT IN (SELECT City
							FROM Suppliers);


/* OrderId, nombre del cliente que pidieron más de 20 artículos del producto
"Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.*/

SELECT OrderID, Quantity, ProductID
	FROM orderdetails
    WHERE ProductID IN (SELECT ProductID
							FROM Products
                            WHERE ProductName = "Grandma's Boysenberry Spread")
                            AND Quantity >= 20;

-- orders: orderID, customerID
-- orderdetails: orderID, ProductID, Quantity
-- customers: customerID, contactName
SELECT o.OrderID, c.CompanyName
	FROM Orders AS o
    LEFT JOIN Customers AS c
		ON o.CustomerID = c.CustomerID
    LEFT JOIN orderdetails AS od
		ON o.OrderID = od.OrderID
    WHERE ProductID IN (SELECT ProductID
							FROM Products
                            WHERE ProductName = "Grandma's Boysenberry Spread")
                            AND Quantity >= 20;


/* 5. Qué producto es más popular: Extraed cuál es el producto
que más ha sido comprado y la cantidad que se compró. */
-- orderdetails: productID, Quantity
-- products: ProductID, ProductName

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Cantidad_Vendida
	FROM Products AS p
    LEFT JOIN orderdetails AS od
		ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
	ORDER BY Cantidad_Vendida DESC
	LIMIT 1;

