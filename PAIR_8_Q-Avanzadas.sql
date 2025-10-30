USE northwind;


-- 1. Precio MIN y MAX, dales el alias lowestPrice y highestPrice:
SELECT MIN(list_price) AS lowestPrice, MAX(list_price) AS highestPrice
FROM products;

-- 2. El número de productos y el precio medio en general
SELECT COUNT(id) AS totalProducts, AVG(list_price) AS avgPrice
FROM products;


-- 3. MAX y MIN cantidad de carga para un pedido (freight)
-- enviado a Reino Unido (United Kingdom): ADAPT to USA
SELECT MIN(quantity), MAX(quantity)
FROM order_details
WHERE order_id IN (
	SELECT id
    FROM orders
    WHERE ship_country_region = 'USA');
