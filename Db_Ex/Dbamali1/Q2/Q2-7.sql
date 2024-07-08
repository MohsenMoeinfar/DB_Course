SELECT tradeTime , price
FROM BeijingHomePricesandDetails
WHERE YEAR(tradeTime) = 2016 AND price > 50000
ORDER BY price DESC