SELECT COUNT(*) AS [Count]
FROM Countries AS c
LEFT JOIN MountainsCountries AS cm
    ON c.CountryCode = cm.CountryCode
WHERE cm.MountainId IS NULL;