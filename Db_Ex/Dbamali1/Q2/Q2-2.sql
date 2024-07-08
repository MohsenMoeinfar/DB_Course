SELECT buildingType  , livingRoom
FROM BeijingHomePricesandDetails
WHERE buildingType = 'tower'
ORDER BY livingRoom DESC
