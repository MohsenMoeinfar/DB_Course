INSERT INTO operations(Id , Dateshamsi , Date , Cost , FoodName)
SELECT شناسه , تاریخ  ,ساعت  , مبلغ , غذا
FROM Samaad
WHERE غذا IS NOT NULL AND EXISTS(
SELECT 1 
FROM Food 
WHERE Food.Name = غذا);
/*اینجا دو تا مشکل داشتیم یک اینکه ممکن بود غذا نال باشه در جدول سماد  و دو اینکه غذایی باشه که در 
جدول سماد باشه ولی در فود نباشه البته نمیدونم حدسم این بود چون مشکل ساز میشد
AND EXISTS(
SELECT 1 
FROM Food 
WHERE Food.Name = غذا)
اگه این قسمت رو نمیزدیم*/