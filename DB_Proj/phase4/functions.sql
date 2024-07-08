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