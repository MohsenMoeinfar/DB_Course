SELECT Dateshamsi , Name , [ KiloCalories(100gr)] 
FROM operations , Food
WHERE operations.FoodName = Food.Name
AND Food.[ KiloCalories(100gr)] < 250