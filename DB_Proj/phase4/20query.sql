-- Query1: نمایش نام و تعداد محصولاتی که موجودی آن ها از 3 کم تر است و
--براساس قیمت از بیش تر به کم تر
SELECT ModelName, Quantity , Price
FROM Product
WHERE Quantity < 3
ORDER BY Price DESC ;
--Query2
--نمایش محصولاتی که نام آیفون در آنان هست و همچنین در فروشگاه  هایی با ایدی 1تا 5 باشند 
-- براساس قیمت از بیش تر به کم تر
SELECT *
FROM Product
WHERE ModelName LIKE '%iPhone%' AND StID IN (1,2,3,4,5)
ORDER BY Price DESC;
--Query3
--ایدی و نام و نام خانوادگی خریدارانی که 
-- در ماه 4ام از سال 2023 سفارشی داشته اند 
SELECT DISTINCT b.B_ID , b.FirstName, b.LastName
FROM Buyer b
JOIN Orders o ON b.B_ID = o.BuyerID
WHERE YEAR(o.OrderDate) = 2023  AND MONTH(o.OrderDate) = 4 ;
--Query4
--ایدی فروشگاه و شماره شعبه  و نام فروشگاه و شماره تلفن شعبه هایی که
--در آن ها محصولاتی با ویژگی 
--Android10 
--موجود است
SELECT DISTINCT s.S_ID AS StoreID, b.Branch_Number AS BranchNumber , s.Name AS StoreName, b.MobileNumber AS BranchPhoneNumber
FROM Store s
JOIN Branch b ON s.S_ID = b.StoreID
JOIN Product p ON b.Branch_Number = p.BranchNumber AND p.SoftwareSpecifications LIKE '%Android 10%';
--Query5
--نمایش نام و نام خانوادگی و آیدی سبد خرید و مبلغ پرداختی کسانی که
--بیش تر از 10 میلیون حساب خود را شارژ کرده اند
--مرتب شده بر اساس مبلغ 
SELECT b.FirstName, b.LastName, c.C_ID, p.Amount 
FROM Payment p
JOIN Buyer b ON p.BuyerID = b.B_ID
JOIN Cart c ON b.B_ID = c.BuyerID
WHERE p.Amount > 10000000
ORDER BY p.Amount ;
--Query6
-- برای هر فروشگاه نمایش نام فروشگاه و تعداد کل موجود محصولات
SELECT s.Name AS StoreName, COUNT(p.P_ID) AS TotalProducts
FROM Product p
JOIN Branch b ON p.BranchNumber = b.Branch_Number AND p.StID = b.StoreID
JOIN Store s ON b.StoreID = s.S_ID
WHERE p.Quantity > 0
GROUP BY s.Name;
--Query7
--نمایش مدل گوشی و قیمت آن و آدرس شعبه  و اسم فروشگاهی که گوشی در آن جااست
SELECT p.ModelName, p.Price, b.Address AS BranchAddress, s.Name AS StoreName
FROM Product p
JOIN Branch b ON p.BranchNumber = b.Branch_Number AND p.StID = b.StoreID
JOIN Store s ON b.StoreID = s.S_ID;
--Query8
--نمایش آیدی و نام و نام خانوادگی خریدارانی که محصولی با رنگ طلایی خریداری کرده اند
SELECT DISTINCT b.B_ID As Buyer_Id  ,b.FirstName, b.LastName
FROM Buyer b
JOIN Cart c ON b.B_ID = c.BuyerID
JOIN Product_Cart pc ON c.C_ID = pc.CartID
JOIN Product p ON pc.ProductID = p.P_ID
WHERE p.Color = 'Gold';
--Query9
--نمایش خریدارانی با مجموع خرید بیش تر از میانگین خرید کل خریدار ها
WITH OrderTotals AS (
    SELECT BuyerID, SUM(TotalPrice) AS TotalSpent
    FROM Orders
    GROUP BY BuyerID
),
AverageTotalSpent AS (
    SELECT AVG(TotalSpent) AS AvgSpent
    FROM OrderTotals
)
SELECT b.B_ID, b.FirstName, b.LastName, ot.TotalSpent
FROM OrderTotals ot
JOIN AverageTotalSpent ats ON ot.TotalSpent > ats.AvgSpent
JOIN Buyer b ON ot.BuyerID = b.B_ID
ORDER BY ot.TotalSpent DESC;
--Query10
--نمایش کاربرانی که در روز 4 ام ماه 5 ام 2023 موجودی خودشون رو زیاد کردند
--مرتب شده بر اساس  مبلغ افزایش از بیش تر به کم تر 
SELECT FirstName, LastName, Amount, PaymentDate
FROM Payment
JOIN Buyer ON Payment.BuyerID = Buyer.B_ID
WHERE PaymentDate = '2023-05-04'
ORDER BY Amount DESC;
--Query11
--آیدی فروشگاه و اسم فروشگاه و تعداد کل محصولات  در فروشگاه با آیدی 1
SELECT s.S_ID, s.Name AS StoreName, COUNT(p.P_ID) AS ProductCount
FROM Store s
JOIN Branch b ON s.S_ID = b.StoreID
JOIN Product p ON b.Branch_Number = p.BranchNumber AND b.StoreID = p.StID
WHERE s.S_ID = 1
GROUP BY s.S_ID, s.Name;
--Query12
--نمایش محصولات موجود در شعبه و فروشگاه خاصی 
SELECT *
FROM Product p
WHERE p.BranchNumber = 1 AND p.StID = 1;
--Query13
--ساختن یک 
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
--Query14
--ساختن  یک
--*Function1*
--با گرفتن ایدی کاربر جمع قیمت محصولات موجود در سبد خرید برگردانده میشود
IF OBJECT_ID('GetTotalCartPrice', 'FN') IS NOT NULL
    DROP FUNCTION GetTotalCartPrice;
GO
CREATE FUNCTION GetTotalCartPrice (
    @BuyerID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalPrice DECIMAL(10, 2);
    SELECT @TotalPrice = SUM(p.Price * pc.Quantity)
    FROM Cart c
    JOIN Product_Cart pc ON c.C_ID = pc.CartID
    JOIN Product p ON pc.ProductID = p.P_ID
    WHERE c.BuyerID = @BuyerID;
    RETURN ISNULL(@TotalPrice, 0);
END;
GO
SELECT dbo.GetTotalCartPrice(1);
--Query15
--ساختن  یک
--*Function2*
--با گرفتن ایدی کاربر تعداد سفارش هایی که تا الان داده است  را
--برمیگرداند
IF OBJECT_ID('GetBuyerOrderCount', 'FN') IS NOT NULL
    DROP FUNCTION GetBuyerOrderCount;
GO
CREATE FUNCTION GetBuyerOrderCount (
    @p_BuyerID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @orderCount INT;
    SELECT @orderCount = COUNT(*)
    FROM Orders
    WHERE BuyerID = @p_BuyerID;
    RETURN ISNULL(@orderCount, 0);
END;
GO
SELECT dbo.GetBuyerOrderCount(5) as Ordercountof5;
--Query16
--ساختن یک 
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
--Query17
--ساختن  یک
--*Function3*
--با گرفتن آیدی کاربر بالاترین سفارش از نظر قیمت را به همراه 
--آیدی کاربر و تعداد محصولات موجود در آن سفارش 
IF OBJECT_ID('GetTopOrderDetails', 'FN') IS NOT NULL
    DROP FUNCTION GetTopOrderDetails;
GO
CREATE FUNCTION GetTopOrderDetails (
    @BuyerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 
        o.OrderID, 
        o.OrderDate, 
        o.OrderStatus, 
        o.ShippingType, 
        o.ShippingCost, 
        o.TotalPrice, 
        c.BuyerID,
        SUM(pc.Quantity) AS TotalProducts
    FROM Orders o
    JOIN Cart c ON o.CartId = c.C_ID
    JOIN Product_Cart pc ON c.C_ID = pc.CartID
    WHERE c.BuyerID = @BuyerID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatus, o.ShippingType, o.ShippingCost, o.TotalPrice, c.BuyerID
    ORDER BY TotalProducts DESC
);
GO
SELECT * 
FROM dbo.GetTopOrderDetails(1); 
--Query18
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

--Query19
--ساختن  یک
--*Function4*
--قابلیت سرچ بوسیله قیمت  با تعیین ابتدا و انتهای بازه قیمت تابع 
-- بما محصولات در آن رنج را برمیگرداند
IF OBJECT_ID('dbo.GetProductsByPriceRange', 'IF') IS NOT NULL
    DROP FUNCTION dbo.GetProductsByPriceRange;
GO
CREATE FUNCTION dbo.GetProductsByPriceRange (
    @MinPrice DECIMAL(10, 2),
    @MaxPrice DECIMAL(10, 2)
)
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM Product
    WHERE Price BETWEEN @MinPrice AND @MaxPrice
);
GO
SELECT * 
FROM dbo.GetProductsByPriceRange(5000000.00, 10000000.00);
--Query20
--ساختن یک 
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

















