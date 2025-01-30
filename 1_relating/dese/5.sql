SELECT 
    "city", 
    COUNT("name") AS "Count"
FROM 
    "schools"
WHERE 
    "type" = 'Public School'
GROUP BY 
    "city"
HAVING 
    "Count" <= 3
ORDER BY 
    "Count" DESC, 
    "city" ASC;
