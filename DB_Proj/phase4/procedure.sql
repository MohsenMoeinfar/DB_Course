--*PROCEDURE1*
--که با گرفتن آیدی فروشگاه لیست محصولات ناموجود در آن فروشگاه را نشان میدهد
IF OBJECT_ID('GetUnavailableProducts', 'P') IS NOT NULL
    DROP PROCEDURE GetUnavailableProducts;
GO
CREATE PROCEDURE GetUnavailableProducts (
    @p_StoreID INT
)
AS
BEGIN
    SELECT p.P_ID, p.ModelName, p.Color, p.Price, p.Image, p.SoftwareSpecifications, p.HardwareSpecifications, p.BranchNumber, p.Quantity
    FROM Product p
    JOIN Branch b ON p.BranchNumber = b.Branch_Number AND p.StID = b.StoreID
    WHERE b.StoreID = @p_StoreID AND p.Quantity = 0;
END;
GO
EXEC GetUnavailableProducts @p_StoreID = 3;
--*PROCEDURE2*
--با گرفتن شناسه سفارش  وضعیت سفارش 
--را تغییر میدهد
--کاربرد: برای تغییر وضعیت سفارش هایی که پرداخت نشده اگر کاربر افزایش موجودی داد
--و دوباره سفارش را زد از این  برا اپدیت وضعیت استفاده میشود
IF OBJECT_ID('UpdateOrderStatus', 'P') IS NOT NULL
    DROP PROCEDURE UpdateOrderStatus;
GO
CREATE PROCEDURE UpdateOrderStatus (
    @OrderID INT,
    @NewStatus NVARCHAR(50)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE OrderID = @OrderID)
    BEGIN
        RETURN;
    END
    UPDATE Orders
    SET OrderStatus = @NewStatus
    WHERE OrderID = @OrderID;
    PRINT 'Order status updated successfully';
END;
GO
EXEC UpdateOrderStatus @OrderID = 2, @NewStatus = 'Paid';
--ساختن یک 
--*PROCEDURE3*
--با گرفتن ایدی فروشگاه 
--شماره شعبه و آدرس شعبه هایی که در آن ها محصولاتی هست 
-- و تعداد انواع محصول
-- و تعداد کل محصولات 
-- و قیمت کل محصولات
-- برگردانده میشود
IF OBJECT_ID('GetBranchProductSummary', 'P') IS NOT NULL
    DROP PROCEDURE GetBranchProductSummary;
GO
CREATE PROCEDURE GetBranchProductSummary (
    @StoreID INT
)
AS
BEGIN
    SELECT 
        b.Branch_Number, 
        b.Address AS BranchAddress,
        COUNT(p.P_ID) AS TotalProducts,
        SUM(p.Quantity) AS TotalQuantity,
        SUM(p.Price * p.Quantity) AS TotalValue
    FROM Branch b
    JOIN Product p ON b.Branch_Number = p.BranchNumber AND b.StoreID = p.StID
    WHERE b.StoreID = @StoreID
    GROUP BY b.Branch_Number, b.Address
    ORDER BY b.Branch_Number;
END;
GO
EXEC GetBranchProductSummary @StoreID = 1;
--*PROCEDURE4*
--با گرفتن مبلغ و آیدی کاربر 
-- به موجودی کیف پول کاربر مبلغ را اضافه میکند
IF OBJECT_ID('dbo.UpdateWalletBalance', 'P') IS NOT NULL
    DROP PROCEDURE dbo.UpdateWalletBalance;
GO
CREATE PROCEDURE dbo.UpdateWalletBalance (
    @BuyerID INT,
    @Amount DECIMAL(10, 2)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Buyer WHERE B_ID = @BuyerID)
    BEGIN
        UPDATE Buyer
        SET WalletBalance = WalletBalance + @Amount
        WHERE B_ID = @BuyerID;
        PRINT 'Wallet balance updated successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Buyer ID does not exist.';
    END
END;
GO
EXEC dbo.UpdateWalletBalance @BuyerID = 1, @Amount = 1000000.00;