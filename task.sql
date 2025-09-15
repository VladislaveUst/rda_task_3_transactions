
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;

USE ShopDB;

SOURCE create-database.sql;


START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @order_id = LAST_INSERT_ID();
SET @product_id = 1;
SET @count = 1;

INSERT INTO OrderItems (OrderID, ProductID, `Count`)
VALUES (@order_id, @product_id, @count);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - @count
WHERE ID = @product_id
  AND WarehouseAmount >= @count;

COMMIT;

