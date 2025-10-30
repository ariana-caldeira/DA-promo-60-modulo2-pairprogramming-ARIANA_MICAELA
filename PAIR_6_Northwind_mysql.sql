USE northwind;

# 1. Conociendo a las empleadas:
# diseñar una consulta SQL para obtener una lista con: EmployeeID, LastName y FirstName.

SELECT EmployeeID, LastName, FirstName
	FROM Employees;
    
# 2. Conociendo los productos más baratos:
# productos (tabla products) precios por unidad (UnitPrice) entre 0 y 5 dólares

SELECT ProductName, UnitPrice
	FROM products
    WHERE UnitPrice BETWEEN 0 AND 5;
    
# 3. Conociendo los productos que no tienen precio:

SELECT ProductName, UnitPrice
	FROM products
    WHERE UnitPrice IS NULL;
    
# 4. Comparando productos:
# productos con un precio < 15 dólares, pero sólo aquellos que tienen un ID menor que 20 

SELECT ProductID, ProductName, UnitPrice
	FROM products
    WHERE UnitPrice < 15 AND ProductID < 20;


# 5. Cambiando de operadores:
# precio superior a 15 dólares y un ID superior a 20

SELECT ProductID, ProductName, UnitPrice
	FROM products
    WHERE NOT (UnitPrice <= 15 OR ProductID <= 20);
    

# 6. Conociendo los países a los que vendemos:
# países que hacen pedidos

SELECT DISTINCT ShipCountry
	FROM orders;


# 7. Conociendo el tipo de productos que vendemos en Northwind:
# los primeros 10 productos según su ID

SELECT ProductID, ProductName, UnitPrice
	FROM products
    WHERE ProductID < 10;
    

# 8. Ordenando los resultados
# últimos 10 productos según su ID de manera descendiente

SELECT ProductID, ProductName, UnitPrice
	FROM products
    ORDER BY ProductID DESC
    LIMIT 10;


# 9. Que pedidos tenemos en nuestra BBDD:
# distintos pedidos (mostrar los valores únicos de ID en la tabla order_details)

SELECT DISTINCT OrderID, ProductID
	FROM orderdetails;
