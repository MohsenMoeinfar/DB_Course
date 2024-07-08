--View1
CREATE VIEW StoreProductView AS
SELECT 
    s.S_ID AS StoreID,
    s.Name AS StoreName,
    b.Branch_Number AS BranchNumber,
    b.Address AS BranchAddress,
    p.P_ID AS ProductID,
    p.ModelName,
    p.Color,
    p.Price,
    p.Quantity
FROM Store s
JOIN Branch b ON s.S_ID = b.StoreID
JOIN Product p ON b.Branch_Number = p.BranchNumber AND b.StoreID = p.StID
WHERE p.Quantity > 0;
GO
SELECT * FROM StoreProductView;
--View2
CREATE VIEW buyerView AS
SELECT
    b.B_ID AS BuyerID,
    b.FirstName,
    b.LastName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalPrice) AS TotalSpent
FROM Buyer b
LEFT JOIN Orders o ON b.B_ID = o.BuyerID
GROUP BY b.B_ID, b.FirstName, b.LastName
GO
SELECT * FROM buyerView;
--View3
CREATE VIEW BuyerProductView AS
SELECT
    b.B_ID AS BuyerID,
    b.FirstName AS BuyerFirstName,
    b.LastName AS BuyerLastName,
    c.C_ID AS CartID,
    p.P_ID AS ProductID,
    p.ModelName AS ProductName,
    p.Price AS ProductPrice,
    pc.Quantity AS ProductQuantity
FROM Buyer b
JOIN Cart c ON b.B_ID = c.BuyerID
JOIN Product_Cart pc ON c.C_ID = pc.CartID
JOIN Product p ON pc.ProductID = p.P_ID;
GO
SELECT * FROM BuyerProductView;
