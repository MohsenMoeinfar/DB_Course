SELECT Designation , Experience , Salary_In_Rupees
FROM DataScienceFieldsSalaryCategorization
WHERE (Experience = 'SE' OR Experience = 'EX')  AND Salary_In_Rupees < 5000000