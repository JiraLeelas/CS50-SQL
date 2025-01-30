SELECT 
    "first_name", "last_name", 
    "height" AS [Above Average Height], 
    "weight" AS [Above Average Weight] 
FROM "players" 
WHERE "weight" > (SELECT avg("weight") 
FROM "players") AND "height" > (SELECT avg("height") 
FROM "players") 
ORDER BY 
    "first_name", 
    "last_name", 
    [Above Average Height], 
    [Above Average Weight];