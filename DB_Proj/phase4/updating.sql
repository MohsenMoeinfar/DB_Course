--اضافه کردن ستون جدید
ALTER TABLE Store
ADD PhoneNumber NVARCHAR(50) ;

ALTER TABLE Product
ADD Rating DECIMAL(3, 2);

--عوض کردن  یک ستون
--nvarchar(100) AND NOT NULL to nvarchar(120) AND CAN BE NULL
ALTER TABLE Branch
ALTER COLUMN Address NVARCHAR(120) ;
--NVARCHAR(20) TO NVARCHAR(30)
ALTER TABLE Product
ALTER COLUMN Color NVARCHAR(30)  NOT NULL ;

--حذف کردن یک ستون

ALTER TABLE Store
DROP COLUMN PhoneNumber ;

ALTER TABLE Product
DROP COLUMN Rating ;
-----------------------------------------------------------------------
--تغییرات مربوط به سطر های جدول
-----------UPDATE ROWS
UPDATE Buyer
SET FirstName = 'Shayan'  ,LastName = 'Molaei'
WHERE B_ID  = 1 ;

UPDATE Product
SET Quantity = 100
WHERE P_ID = 30

-----------DELETE ROWS
DELETE FROM Product
WHERE P_ID = 54 ;

DELETE FROM Branch
WHERE Address ='Address 3 - MOBMOB' ;
-----------------------------------
--اضافه کردن محدودیت های جدیدی که در هنگام ساخت جدول  اضافه نشده بودند 
--حذف محدودیت و آپدیت محدودیت ها
------------------------------------
--اضافه کردن محدودیت ها
ALTER TABLE Buyer
ADD CONSTRAINT UniqueBuyerEmail UNIQUE (Email);

ALTER TABLE Buyer
ADD CONSTRAINT  consforphonenumber CHECK (PhoneNumber LIKE '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Buyer
ADD CONSTRAINT emailchecker CHECK (Email LIKE '%_@__%.__%');

ALTER TABLE Product
ADD CONSTRAINT Quantitychecker CHECK(Quantity >= 0) ;

ALTER TABLE CART 
ADD CONSTRAINT Totalpricecheckercart CHECK(TotalPrice >= 0 ) 

ALTER TABLE Buyer
ADD CONSTRAINT PASSCHECKER CHECK(LEN(Password) > 5);




--حذف محدودیت ها
ALTER TABLE CART 
  DROP CONSTRAINT Totalpricecheckercart ;

ALTER TABLE Product
   DROP CONSTRAINT Quantitychecker ;



--اپدیت محدودیت ها 
--اپدیت به طور کلی دستور مستقیم ندارد
--برای اپدیت ما  ابتدا محدودیت را حذف و سپس اضافه میکنیم

-- حذف محدودیت موجود
ALTER TABLE Buyer DROP CONSTRAINT emailchecker;
-- اضافه کردن محدودیت جدید با شرایط جدید
ALTER TABLE Buyer
ADD CONSTRAINT emailchecker CHECK (Email LIKE '%_@gmail.com');



--حذف محدودیت موجود
ALTER TABLE BUYER DROP CONSTRAINT PASSCHECKER ; 
--اضافه کردن محدودیت جدید با شرایط جدید
ALTER TABLE Buyer
ADD CONSTRAINT PASSCHECKER CHECK(LEN(Password) > 7);








