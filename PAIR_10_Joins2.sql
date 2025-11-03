USE Northwind;

-- 1. la ubicación, nombre, y apellido tanto de las empleadas como de las jefas.

SELECT Employees.EmployeeID, Employees.LastName, Employees.FirstName, Employees.Address, Employees.ReportsTo AS SupervisorID, Supervisors.LastName, Supervisors.FirstName, Supervisors.Address
	FROM Employees
    LEFT JOIN Employees AS Supervisors
    ON Employees.ReportsTo = Supervisors.EmployeeID;
    
-- 2. *categorías de productos, incluso si no tienen productos asociados..
-- nombre de la categoría, nombre de los productos dentro de cada categoría. 

SELECT c.CategoryName, p.ProductName
	FROM Products AS p
    LEFT JOIN Categories AS c
		ON p.CategoryID = c.CategoryID
    ORDER BY c.CategoryName, p.ProductName;

-- 2.1 contar el numero de productos distintos por cada categoria
SELECT c.CategoryName, COUNT(DISTINCT p.ProductName)
	FROM Categories AS c
    LEFT JOIN Products AS p
		ON p.CategoryID = c.CategoryID
	GROUP BY c.CategoryName;

-- 3. todos los pedidos junto con los datos de las empresas clientes
-- incluir todos los pedidos, incluso si no tienen cliente registrado

SELECT o.CustomerID, c.CompanyName, o.OrderID
	FROM Orders AS o
    LEFT JOIN Customers AS c
		ON o.CustomerID = c.CustomerID;

-- 3.1 contar el numero de productos distintos por cada categoria
SELECT o.CustomerID, c.CompanyName, COUNT(o.OrderID) AS TotalOrders
	FROM Orders AS o
    LEFT JOIN Customers AS c
		ON o.CustomerID = c.CustomerID
	GROUP BY o.CustomerID;

-- 4.  todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.
SELECT e.EmployeeID, e.FirstName, e.LastName, o.OrderID, o.CustomerID, o.ShipCountry
	FROM Employees AS e
    LEFT JOIN Orders AS o
		ON e.EmployeeID = o.EmployeeID;