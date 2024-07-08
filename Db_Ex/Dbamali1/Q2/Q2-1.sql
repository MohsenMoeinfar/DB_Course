SELECT id , constructionTime
FROM BeijingHomePricesandDetails
WHERE (square > 200 OR square < 50 ) AND elevator = 'has elevator' AND subway = 'has subway'