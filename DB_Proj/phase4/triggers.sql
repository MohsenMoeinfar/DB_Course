--TRIGGER1
--اگر تعداد انتخابی توسط خریدار در سبد خرید بیش تر از  موجودی کالا بود 
--اضافه نشود و ارور چاپ شود
CREATE TRIGGER trg_CheckProductQuantity
ON Product_Cart
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @ProductID INT, @Quantity INT, @StockQuantity INT;
    SELECT @ProductID = i.ProductID, @Quantity = i.Quantity
    FROM inserted i;
    SELECT @StockQuantity = p.Quantity
    FROM Product p
    WHERE p.P_ID = @ProductID;
    IF @Quantity > @StockQuantity
    BEGIN
        RAISERROR ('تعداد سفارش بیش تر از موجودی انبار است', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--check trigger1
--الان در انبار محصول شماره3 ازش 4تا هست و خریدار اگر 5تا بخواهد اضافه کند 
--ارور میخورد و جمله بالا ظاهر میشود
INSERT INTO Product_Cart(ProductID , CartID , Quantity)
VALUES 
(3 , 1 , 5) ;

--TRIGGER2
--اگر سفارش موفقی ثبت شد باید کالاهایی که انتخاب شده اند در سبد خرید 
-- به اندازه درخواست خریدار از موجودی انبار آن ها کم شود
CREATE TRIGGER UpdateStockOnOrder
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Product
    SET Product.Quantity = Product.Quantity - pc.Quantity
    FROM inserted AS i
    JOIN Product_Cart AS pc ON i.CartId = pc.CartID
    JOIN Product ON pc.ProductID = Product.P_ID
    WHERE i.OrderStatus = 'Paid';
END;
--TRIGGER3
--اگر کاربر محصولی را به سبدخرید با هر تعدادی اضافه کرد 
--باید قیمت سبد خرید در جدول سبد خرید هم اپدیت شود
CREATE TRIGGER UpdateTotalPriceOnCart
ON Product_Cart
AFTER INSERT , UPDATE
AS
BEGIN
    UPDATE Cart
    SET TotalPrice = (SELECT SUM(p.Price * pc.Quantity) 
                      FROM Product_Cart pc
                      JOIN Product p ON pc.ProductID = p.P_ID
                      WHERE pc.CartID = Cart.C_ID)
    FROM inserted AS i
    WHERE Cart.C_ID = i.CartID;
END;
--check trigger3
INSERT INTO Product_Cart(ProductID , CartID , Quantity)
VALUES 
(1 , 11 , 2) , 
(4 , 11  ,3 ) ; 
--check trigger2
INSERT INTO Orders(OrderID , OrderDate , OrderStatus , ShippingType , ShippingCost , BuyerID , CartId , TotalPrice)
VALUES
(11 , '2023-05-13' , 'Paid' , 'Express'  ,100000 , 11 , 11 ,85000000)  ;
--TRIGGER4
--اگر دقت کنید ما موقع اضافه کردن به جدول سفارش مجبور بودیم خودمون قیمت رو حساب کنیم
--و خوب این خوب نیست برای همین
--وقتی که داده ای به این جدول اضافه میشود قیمت به طور خودکار اپدیت میشود
CREATE TRIGGER CalculateTotalPrice
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Orders
    SET TotalPrice = (
        SELECT SUM(p.Price * pc.Quantity)
        FROM Product_Cart pc
        JOIN Product p ON pc.ProductID = p.P_ID
        WHERE pc.CartID = inserted.CartId
    )
    FROM inserted
    WHERE Orders.OrderID = inserted.OrderID;
END;

--check trigger4 
INSERT INTO Product_Cart(ProductID , CartID , Quantity)
VALUES 
(1 , 12 , 2) , 
(4 , 12  ,3 ) ; 
--دیگر دستی حساب نمیکنیم و نال میذاریم تا تریگر برود و قیمت کل را حساب کند
INSERT INTO Orders(OrderID , OrderDate , OrderStatus , ShippingType , ShippingCost , BuyerID , CartId , TotalPrice)
VALUES
(12 , '2023-05-13' , 'Paid' , 'Express'  ,100000 , 12 , 12 ,Null)  ;