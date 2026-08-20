SELECT 
    PeakName,
    RiverName,
    LOWER(PeakName + SUBSTRING(RiverName, 2, LEN(RiverName))) AS mix
FROM peaks, rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY mix;