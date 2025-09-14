-- Use our database
USE ShopDB;

-- Start the transaction
START TRANSACTION;

-- Step 1: Create a new order for CustomerID = 1
INSERT INTO Orders (CustomerID, Date)
VALUES (1, CURRENT_DATE());

-- Step 2: Get the last inserted Order ID
SET @order_id = LAST_INSERT_ID();

-- Step 3: Insert the order item (ProductID = 1, Count = 1)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- Step 4: Update product stock (reduce by 1)
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- Step 5: Commit the transaction
COMMIT;