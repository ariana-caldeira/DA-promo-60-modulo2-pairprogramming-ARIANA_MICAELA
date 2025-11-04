USE northwind;

-- 1. ciudad, el nombre de la compañía y el nombre de contacto
-- ciudades que empiezan por "A" o "B"
SELECT City, CompanyName, ContactName
	FROM Customers
    WHERE City LIKE 'A%' OR City LIKE 'B%';


-- 2. ciudad, el nombre de la compañía y el nombre de contacto
-- Núm.pedidos de las ciudades que empiezan con L
SELECT c.City AS Ciudad, c.CompanyName AS Empresa, c.ContactName AS Contacto, COUNT(o.OrderID) AS total_Pedidos
	FROM Customers AS c
    INNER JOIN Orders AS o
		ON c.CustomerID = o.CustomerID
	WHERE c.City LIKE 'L%'
	GROUP BY c.City, c.CompanyName, c.ContactName;


-- 3. Todos los clientes cuyo "country" no incluya "Sales"
SELECT ContactName AS Nombre_Contacto, ContactTitle AS Título, CompanyName AS Empresa
	FROM Customers
	WHERE ContactTitle NOT LIKE '%Sales%';
    

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre.
-- el nombre de contacto.
SELECT ContactName AS Nombre_Contacto
	FROM Customers
	WHERE ContactName NOT LIKE '_A%';


-- 5. Extraer toda la información sobre las compañías que tengamos en la bases de datos
SELECT City, CompanyName, ContactName, 'Customer' AS Relashioship
	FROM Customers
UNION
SELECT City, CompanyName, ContactName, 'Supplier'
	FROM Suppliers;
    
    
-- 6. categorías "sweet" o "Sweet"
SELECT *
	FROM categories
    WHERE Description LIKE '%sweet%' OR  Description like '%Sweet%';
    
    
-- 7. nombres y apellidos de los clientes y empleados
SELECT ContactName AS Nombre_Completo
	FROM Customers
UNION
SELECT CONCAT(FirstName, ' ', LastName)
	FROM Employees;


-- 8. EXTRA: nombres y apellidos de los clientes y empleados + relashioship
SELECT ContactName AS Nombre_Completo, 'Customer' AS Relashioship
	FROM Customers
UNION
SELECT CONCAT(FirstName, ' ', LastName), 'Empleado'
	FROM Employees;