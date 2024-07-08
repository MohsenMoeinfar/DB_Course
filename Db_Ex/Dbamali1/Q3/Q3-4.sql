SELECT Name, [ KiloCalories(100gr)] , Cost
FROM operations , Food
WHERE operations.FoodName = Food.Name
AND Food.[ KiloCalories(100gr)] > 250
ORDER BY operations.Cost DESC ;