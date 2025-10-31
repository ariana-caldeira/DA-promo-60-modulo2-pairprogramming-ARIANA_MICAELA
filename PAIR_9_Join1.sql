USE Northwind;

-- 1. cuántos pedidos ha realizado cada empresa cliente de UK
-- ID del cliente y el nombre de la empresa y el número de pedidos
SELECT CustomerID, CompanyName, count(OrderID) AS totalOrders
	FROM Customers
	NATURAL JOIN Orders
	WHERE Country = 'UK'
	GROUP BY CustomerID
	HAVING COUNT(OrderID);


-- 2. cuántos objetos ha pedido cada empresa cliente de UK durante cada año.
-- nombre de la empresa, el año, y la cantidad de objetos que han pedido
-- PASO 1
SELECT Customers.CompanyName, Orders.OrderDate
FROM Customers
NATURAL JOIN Orders;

-- PASO 2
SELECT Orders.OrderDate, orderdetails.Quantity
FROM Orders
INNER JOIN orderdetails
ON Orders.orderID = orderdetails.orderID;

-- PASO 3
SELECT Customers.CompanyName, Orders.OrderDate, orderdetails.Quantity
FROM Customers
NATURAL JOIN Orders
INNER JOIN orderdetails
ON Orders.orderID = orderdetails.orderID;


-- PASO 4
SELECT Customers.CompanyName, YEAR(Orders.OrderDate), SUM(orderdetails.Quantity)
	FROM Customers
	INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
	INNER JOIN orderdetails
		ON Orders.orderID = orderdetails.orderID
	GROUP BY Customers.CompanyName, YEAR(Orders.OrderDate);


CompanyName, Cada año, Suma de cantidad / Año
xxxxxxxxxxx, 1996.   ,   100
xxxxxxxxxxx, 1997.   ,   200
xxxxxxxxxxx, 1998

