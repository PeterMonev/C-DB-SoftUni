SELECT
    ContinentCode,
    CurrencyCode,
    COUNT(CountryCode) AS CurrencyUsage
FROM Countries
GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(CountryCode) > 1
   AND COUNT(CountryCode) =
   (
       SELECT MAX(CurrencyUsage)
       FROM
       (
           SELECT
               ContinentCode,
               CurrencyCode,
               COUNT(CountryCode) AS CurrencyUsage
           FROM Countries
           GROUP BY ContinentCode, CurrencyCode
       ) AS c
       WHERE c.ContinentCode = Countries.ContinentCode
   )
ORDER BY ContinentCode;