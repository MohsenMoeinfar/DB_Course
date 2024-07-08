CREATE TABLE operations(
 Id INT PRIMARY KEY NOT NULL, 
 Dateshamsi nvarchar(50) NOT NULL, 
 Date datetime2(7)  NOT NULL,
 Cost int , 
 FoodName nvarchar(255) NOT NULL
 FOREIGN KEY (FoodName) REFERENCES Food(Name) ON DELETE CASCADE ON UPDATE CASCADE
);