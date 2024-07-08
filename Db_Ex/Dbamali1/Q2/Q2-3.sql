SELECT buildingStructure , constructionTime
FROM BeijingHomePricesandDetails
WHERE buildingStructure = 'concrete' AND constructionTime BETWEEN 2000 AND 2010
ORDER BY constructionTime