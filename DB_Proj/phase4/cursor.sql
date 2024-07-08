USE MobileOnlineShop;
DECLARE @OrderID INT, @OrderDate DATE, @OrderStatus NVARCHAR(50), @ShippingType NVARCHAR(50), @ShippingCost DECIMAL(10, 2), @BuyerID INT, @BuyerName NVARCHAR(100);
DECLARE OrderCursor CURSOR FOR
SELECT Orders.OrderID, Orders.OrderDate, Orders.OrderStatus, Orders.ShippingType, Orders.ShippingCost, Buyer.B_ID, (Buyer.FirstName + ' ' + Buyer.LastName) AS BuyerName
FROM Orders
INNER JOIN Buyer ON Orders.BuyerID = Buyer.B_ID;
OPEN OrderCursor;
FETCH NEXT FROM OrderCursor INTO @OrderID, @OrderDate, @OrderStatus, @ShippingType, @ShippingCost, @BuyerID, @BuyerName;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Order ID: ' + CAST(@OrderID AS NVARCHAR(10)) + ', Order Date: ' + CAST(@OrderDate AS NVARCHAR(10)) + ', Order Status: ' + @OrderStatus + ', Shipping Type: ' + @ShippingType + ', Shipping Cost: ' + CAST(@ShippingCost AS NVARCHAR(10)) + ', Buyer ID: ' + CAST(@BuyerID AS NVARCHAR(10)) + ', Buyer Name: ' + @BuyerName;
    FETCH NEXT FROM OrderCursor INTO @OrderID, @OrderDate, @OrderStatus, @ShippingType, @ShippingCost, @BuyerID, @BuyerName;
END;
CLOSE OrderCursor;
DEALLOCATE OrderCursor;
